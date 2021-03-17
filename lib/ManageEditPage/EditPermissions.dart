import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageAddPage/AddDepartment.dart';
import 'package:shaddiadmin/ManageFrontPage/DepartmentList.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Editpermission extends StatefulWidget {
  String depart;
  bool memberlist,
      memberadd,
      memberupdate,
      memberdelete,
      planlist,
      planadd,
      planupdate,
      plandelete,
      deplist,
      depupdate,
      depdel,
      depadd,
      ulist,
      uadd,
      uupdate,
      udel;
  Editpermission(
      {this.depart,
      this.memberlist,
      this.memberadd,
      this.memberupdate,
      this.memberdelete,
      this.planlist,
      this.planadd,
      this.planupdate,
      this.plandelete,
      this.deplist,
      this.depadd,
      this.depupdate,
      this.depdel,
      this.ulist,
      this.uadd,
      this.uupdate,
      this.udel});
  Permission1 createState() => Permission1(memberlist);
}

class Permission1 extends State<Editpermission> {
  bool memberadd = false,
      memberupdate = false,
      memberslist = false,
      memberdelete = false;
  bool planslist = false,
      plansadd = false,
      plansupdate = false,
      plansdel = false;
  bool deparlist = false,
      departadd = false,
      departupdate = false,
      departdelete = false;
  bool userslist = false, usersadd = false, usersup = false, usersdel = false;
  Permission1(bool b) {
    print("in main");
    print(b);
  }

  setpermission() async {
    Map<String, dynamic> map = {
      "list": memberslist,
      "add": memberadd,
      "update": memberupdate,
      "delete": memberdelete,
      "field": "members"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(widget.depart)
        .collection("Permissions")
        .doc("members")
        .set(map);

    Map<String, dynamic> plans = {
      "list": planslist,
      "add": plansadd,
      "update": plansupdate,
      "delete": plansdel,
      "field": "membersPlan"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(widget.depart)
        .collection("Permissions")
        .doc("membersPlan")
        .set(plans);
    Map<String, dynamic> department = {
      "list": deparlist,
      "add": departadd,
      "update": departupdate,
      "delete": departdelete,
      "field": "department"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(widget.depart)
        .collection("Permissions")
        .doc("department")
        .set(department);

    Map<String, dynamic> users = {
      "list": userslist,
      "add": usersadd,
      "update": usersup,
      "delete": usersdel,
      "field": "department"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(widget.depart)
        .collection("Permissions")
        .doc("users")
        .set(users);

    showdialog();
  }

  showdialog() {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\nPermissions updated sucessfully"),
      actions: [
        FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              " Ok ",
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

  void initState() {
    super.initState();
    setState(() {
      memberslist = widget.memberlist;
      memberupdate = widget.memberupdate;
      memberadd = widget.memberadd;
      memberdelete = widget.memberdelete;
      planslist = widget.planlist;
      plansadd = widget.planadd;
      plansupdate = widget.planupdate;
      plansdel = widget.plandelete;
      deparlist = widget.deplist;
      departadd = widget.depadd;
      departupdate = widget.depupdate;
      departdelete = widget.depdel;
      userslist = widget.ulist;
      usersadd = widget.uadd;
      usersup = widget.uupdate;
      usersdel = widget.udel;
    });
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
                  padding: EdgeInsets.only(left: 50, top: 0, right: 0),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Department Update",
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        width: 400,
                        child: Row(
                          children: [
                            FlatButton(
                              height: 50,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Adddepartment()));
                              },
                              child: Text(
                                "  Add Department  ",
                                style: TextStyle(color: Colors.green),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FlatButton(
                              height: 50,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DepartmentList()));
                              },
                              child: Text(
                                "  Department List  ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: 1200,
                          margin: EdgeInsets.only(left: 50, right: 50),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 25),
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Department Name",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Container(
                                        height: 35,
                                        width: 450,
                                        child: TextField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  top: 5, left: 5),
                                              hintText: widget.depart,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey))),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                  height: 320,
                                  padding: EdgeInsets.only(left: 20),
                                  margin: EdgeInsets.only(
                                      top: 30, left: 40, right: 40),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Members",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                Divider(
                                                  height: 1,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  memberslist,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  memberslist =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: memberadd,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  memberadd =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  memberupdate,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  memberupdate =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  memberdelete,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  memberdelete =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Members Plan",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                Divider(
                                                  height: 1,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: planslist,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  planslist =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: plansadd,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  plansadd =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  plansupdate,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  plansupdate =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: plansdel,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  plansdel =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Department",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: deparlist,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  deparlist =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: departadd,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  departadd =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  departupdate,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  departupdate =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value:
                                                                  departdelete,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  departdelete =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                  height: 320,
                                  padding: EdgeInsets.only(left: 20),
                                  margin: EdgeInsets.only(
                                      top: 30, left: 40, right: 40),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Users",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: userslist,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  userslist =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: usersadd,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  usersadd =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: usersup,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  usersup = val;
                                                                });
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: usersdel,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  usersdel =
                                                                      val;
                                                                });
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Bank Account",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey[300])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 5),
                                                    child: Text(
                                                      "Orders",
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                    child: Table(
                                                  border: TableBorder(
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid),
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey[200],
                                                              style: BorderStyle
                                                                  .solid)),
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Process\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            "Action\n",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nList\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child:
                                                              Text("\nAdd\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nUpdate\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                    TableRow(children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                              "\nDelete\n")),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 80),
                                                          child: Switch(
                                                              value: false,
                                                              onChanged: (val) {
                                                                setState(() {});
                                                              })),
                                                    ]),
                                                  ],
                                                ))
                                              ],
                                            ),
                                          )),
                                    ],
                                  )),
                              SizedBox(
                                height: 40,
                              ),
                              FlatButton(
                                  minWidth: 150,
                                  onPressed: () {
                                    setpermission();
                                  },
                                  color: Colors.green,
                                  child: Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        )))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
