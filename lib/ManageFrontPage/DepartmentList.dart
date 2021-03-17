import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shaddiadmin/ManageAddPage/AddDepartment.dart';
import 'package:shaddiadmin/ManageEditPage/EditPermissions.dart';
import 'package:shaddiadmin/ManageEditPage/EditPlans.dart';
import 'package:shaddiadmin/ManageAddPage/Addplans.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class DepartmentList extends StatefulWidget {
  Department1 createState() => Department1();
}

class Department1 extends State<DepartmentList> {
  bool listmember = false,
      addmember = false,
      updatemem = false,
      deletemem = false,
      planlist1 = false,
      planadd1 = false,
      planup = false,
      plandel = false,
      deplist1 = false,
      depadd1 = false,
      depup1 = false,
      depdel1 = false,
      ulist1 = false,
      uadd1 = false,
      uupda1 = false,
      udel1 = false;

  List users = List();

  accessdenieddialog() {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      title: Text("Alert"),
      content: Text("\nAccess Denied\n"),
      actions: [
        FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              " ok ",
              style: TextStyle(color: Colors.black),
            )),
        SizedBox(
          width: 5,
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  delete(String depart) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      title: Text("Delete"),
      content: Text("\nAre you sure you want to delete this item?\n"),
      actions: [
        FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              " Cancel ",
              style: TextStyle(color: Colors.black),
            )),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
            deletedepart(depart);
          },
          child: Text("Delete"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  deletedepart(String depart) async {
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(depart)
        .delete();
    findusers(depart);
  }

  findusers(String depart) async {
    await FirebaseFirestore.instance
        .collection("Department")
        .doc("Users")
        .collection("UsersList")
        .get()
        .then((snap) => snap.docs.forEach((doc) {
              if (doc.data()["department"] == depart) {
                users.add(doc.data()["username"]);
                print("username is" + doc.data()["username"]);
              }
            }));

    if (users.length > 0) {
      deleteusers();
    }
  }

  deleteusers() {
    print("list is");
    for (int i = 0; i < users.length; i++) {
      FirebaseFirestore.instance
          .collection("Department")
          .doc("Users")
          .collection("UsersList")
          .doc(users[i])
          .delete();
    }
  }

  showdata() {
    return Container(
        margin: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 150),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 50, top: 10, right: 70, bottom: 10),
              color: Colors.grey[200],
              margin: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 5),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Department List",
                        style: TextStyle(fontSize: 18),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Action",
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Department")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Processing");
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 70, top: 10, right: 70, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        snapshot.data.documents[index]
                                            .get("departName"),
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff000000)),
                                      )),
                                  Visibility(
                                      visible: snapshot.data.documents[index]
                                                  .get("departName") ==
                                              "Admin"
                                          ? false
                                          : true,
                                      child: Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  String d = snapshot
                                                      .data.documents[index]
                                                      .get("departName");
                                                  print(d);
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("Department")
                                                      .doc(d.trim())
                                                      .collection("Permissions")
                                                      .doc("members")
                                                      .get()
                                                      .then((value) => {
                                                            listmember = value
                                                                .data()["list"],
                                                            addmember = value
                                                                .data()["add"],
                                                            updatemem =
                                                                value.data()[
                                                                    "update"],
                                                            deletemem =
                                                                value.data()[
                                                                    "delete"]
                                                          });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("Department")
                                                      .doc(d.trim())
                                                      .collection("Permissions")
                                                      .doc("membersPlan")
                                                      .get()
                                                      .then((value) => {
                                                            planlist1 = value
                                                                .data()["list"],
                                                            planadd1 = value
                                                                .data()["add"],
                                                            planup =
                                                                value.data()[
                                                                    "update"],
                                                            plandel =
                                                                value.data()[
                                                                    "delete"]
                                                          });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("Department")
                                                      .doc(d.trim())
                                                      .collection("Permissions")
                                                      .doc("department")
                                                      .get()
                                                      .then((value) => {
                                                            deplist1 = value
                                                                .data()["list"],
                                                            depadd1 = value
                                                                .data()["add"],
                                                            depup1 =
                                                                value.data()[
                                                                    "update"],
                                                            depdel1 =
                                                                value.data()[
                                                                    "delete"]
                                                          });
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("Department")
                                                      .doc(d.trim())
                                                      .collection("Permissions")
                                                      .doc("users")
                                                      .get()
                                                      .then((value) => {
                                                            ulist1 = value
                                                                .data()["list"],
                                                            uadd1 = value
                                                                .data()["add"],
                                                            uupda1 =
                                                                value.data()[
                                                                    "update"],
                                                            udel1 =
                                                                value.data()[
                                                                    "delete"]
                                                          });
                                                  ldepupdate == true
                                                      ? Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Editpermission(
                                                                    depart: d,
                                                                    memberlist:
                                                                        listmember,
                                                                    memberadd:
                                                                        addmember,
                                                                    memberupdate:
                                                                        updatemem,
                                                                    memberdelete:
                                                                        deletemem,
                                                                    planlist:
                                                                        planlist1,
                                                                    planadd:
                                                                        planadd1,
                                                                    planupdate:
                                                                        planup,
                                                                    plandelete:
                                                                        plandel,
                                                                    deplist:
                                                                        deplist1,
                                                                    depadd:
                                                                        depadd1,
                                                                    depupdate:
                                                                        depup1,
                                                                    depdel:
                                                                        depdel1,
                                                                    ulist:
                                                                        ulist1,
                                                                    uadd: uadd1,
                                                                    uupdate:
                                                                        uupda1,
                                                                    udel: udel1,
                                                                  )))
                                                      : accessdenieddialog();
                                                },
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  color: Colors.green,
                                                  child: Icon(
                                                    Icons.edit_outlined,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    String d = snapshot
                                                        .data.documents[index]
                                                        .get("departName");
                                                    ldepdelete == true
                                                        ? delete(d)
                                                        : accessdenieddialog();
                                                  },
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    color: Colors.red,
                                                    child: Icon(
                                                      Icons.delete_outlined,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ],
                                          )))
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        );
                      });
                },
              ),
            ))
          ],
        ));
  }

  acessdenied() {
    return Container(
      height: 400,
      margin: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 150),
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Text(
              "\n404\n",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            Text(
              "OOps! Something went wrong",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Access Denied!!",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(width: 270, child: Navigation()),
            Expanded(
                child: Container(
                    child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.grey[200],
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  elevation: 0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, top: 0, right: 50),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Department List',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            ldepadd == true
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Adddepartment()))
                                : accessdenieddialog();
                          },
                          child: Text(
                            "Add Department",
                            style: TextStyle(color: Colors.black),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: ldpartlist == true ? showdata() : acessdenied())
              ],
            ))),
          ],
        ));
  }
}
