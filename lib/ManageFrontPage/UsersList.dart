import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageAddPage/AddUser.dart';
import 'package:shaddiadmin/ManageEditPage/EditUserProfile.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class UserList extends StatefulWidget {
  UserList1 createState() => UserList1();
}

class UserList1 extends State<UserList> {
  String status = "Enable";
  Color c = Colors.green;
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

  delete(String u) {
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
            deleteuser(u);
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

  deleteuser(String user) async {
    print("user Is" + user);
    await FirebaseFirestore.instance
        .collection("Department")
        .doc("Users")
        .collection("UsersList")
        .doc(user)
        .delete();
    Navigator.of(context).pop();
  }

  displaycon1() {
    return Container(
      color: Colors.grey[200],
      height: 40,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(2),
          5: FlexColumnWidth(2),
          6: FlexColumnWidth(2),
        },
        children: [
          TableRow(children: [
            Text(
              "Sr.No",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Department",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Username",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Status",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Action",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ]),
        ],
      ),
    );
  }

  showdata() {
    return Container(
        padding: EdgeInsets.only(left: 0, right: 10, top: 20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Department")
                .doc("Users")
                .collection("UsersList")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Processing");
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(2),
                            4: FlexColumnWidth(2),
                            5: FlexColumnWidth(2),
                            6: FlexColumnWidth(2),
                          },
                          children: [
                            TableRow(children: [
                              Text(
                                index.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                snapshot.data.documents[index].get("firstName"),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                snapshot.data.documents[index]
                                    .get("department"),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                snapshot.data.documents[index].get("username"),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                snapshot.data.documents[index].get("password"),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          String s = snapshot
                                              .data.documents[index]
                                              .get("username");
                                          bool b = snapshot
                                              .data.documents[index]
                                              .get("status");
                                          Map<String, dynamic> m = {
                                            "status": !b
                                          };
                                          await FirebaseFirestore.instance
                                              .collection("Department")
                                              .doc("Users")
                                              .collection("UsersList")
                                              .doc(s)
                                              .update(m);
                                        },
                                        child: Container(
                                            width: 70,
                                            height: 20,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("status") ==
                                                    true
                                                ? Colors.green
                                                : Colors.red,
                                            child: Center(
                                                child: Text(
                                              snapshot.data.documents[index]
                                                          .get("status") ==
                                                      true
                                                  ? "Enable"
                                                  : "Disable",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                      )
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        String fn = snapshot
                                            .data.documents[index]
                                            .get("firstName");
                                        String mn = snapshot
                                            .data.documents[index]
                                            .get("middleName");
                                        String ln = snapshot
                                            .data.documents[index]
                                            .get("lastName");
                                        String adr = snapshot
                                            .data.documents[index]
                                            .get("adress");
                                        String mobile = snapshot
                                            .data.documents[index]
                                            .get("mobile");
                                        String u = snapshot
                                            .data.documents[index]
                                            .get("username");
                                        String pass = snapshot
                                            .data.documents[index]
                                            .get("password");
                                        String depat = snapshot
                                            .data.documents[index]
                                            .get("department");
                                        bool status = snapshot
                                            .data.documents[index]
                                            .get("status");
                                        lusersup == true
                                            ? Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Edituserprofile(
                                                          first: fn,
                                                          middle: mn,
                                                          last: ln,
                                                          adress: adr,
                                                          mobile: mobile,
                                                          username: u,
                                                          pass: pass,
                                                          depar: depat,
                                                          status: status,
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
                                        onTap: () async {
                                          String u = snapshot
                                              .data.documents[index]
                                              .get("username");

                                          lusersdel == true
                                              ? delete(u)
                                              : accessdenieddialog();
                                        },
                                        child: Visibility(
                                            visible: snapshot
                                                        .data.documents[index]
                                                        .get("department") ==
                                                    "Admin"
                                                ? false
                                                : true,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              color: Colors.red,
                                              child: Icon(
                                                Icons.delete_outlined,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ))),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider()
                      ],
                    ));
                  });
            }));
  }

  acessdenied() {
    return Container(
      height: 400,
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 50),
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
        children: [
          Container(width: 270, child: Navigation()),
          Expanded(
              child: Container(
            child: Column(children: [
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
                      'Users List',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          lusersadd == true
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Adduser()))
                              : accessdenieddialog();
                        },
                        child: Text(
                          "Add User",
                          style: TextStyle(color: Colors.blue),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin:
                    EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 50),
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    luserslist == true ? displaycon1() : Text(""),
                    Expanded(
                        child: luserslist == true ? showdata() : acessdenied())
                  ],
                ),
              ))
            ]),
          ))
        ],
      ),
    );
  }
}
