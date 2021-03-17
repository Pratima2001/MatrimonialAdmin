import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageFrontPage/ApprovedMembers.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class MembersApproval extends StatefulWidget {
  MembersApproval1 createState() => MembersApproval1();
}

showtable() {
  return Container(
    height: 30,
    margin: EdgeInsets.only(left: 20, right: 10, top: 20),
    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
    child: Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(3),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
        7: FlexColumnWidth(2)
      },
      children: [
        TableRow(children: [
          Text(
            "Member ID",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Profile Image",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Gender",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Email",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Mobile",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Subscription",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Status",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            "Action",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ]),
      ],
    ),
  );
}

class MembersApproval1 extends State<MembersApproval> {
  dialog(String sub) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n\nAre you sure you want to Approve this member?\n"),
      actions: [
        FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.of(context).pop();
              dispproveprmission(sub, "No", false);
            },
            child: Text(
              " No ",
              style: TextStyle(color: Colors.black),
            )),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          minWidth: 70,
          color: Colors.green,
          onPressed: () {
            approval(sub, "Yes", true);
            Navigator.of(context).pop();
          },
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white),
          ),
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

  approval(String app, String status, bool b) async {
    Map<String, dynamic> approval = {
      "adminApproval": b,
      "subscription": status
    };
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(app)
        .update(approval)
        .then((value) => {
              if (b == true)
                {dialog1("Member Approved")}
              else
                {dialog1("Member Disapproved")}
            });
  }

  dialog1(String s) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n\n$s\n"),
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
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  dispproveprmission(String dis, String no, bool b) {
    AlertDialog dialog1 = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n\nAre you sure you want to disappove this Member?\n"),
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
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              approval(dis, no, b);
              Navigator.of(context).pop();
            },
            child: Text(
              " Yes ",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return dialog1;
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    margin: EdgeInsets.only(left: 30, top: 0, right: 30),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Members Approval",
                          style: TextStyle(fontSize: 25),
                        ),
                        FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(25)),
                            color: Colors.white,
                            minWidth: 150,
                            height: 40,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ApprovedMembers()));
                            },
                            child: Text("Approved Members"))
                      ],
                    )),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        showtable(),
                        Expanded(
                            child: Container(
                          padding:
                              EdgeInsets.only(top: 20, left: 50, right: 40),
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("UserData")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Text("Processing");
                                }
                                return ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, index) {
                                      String image = snapshot
                                          .data.documents[index]
                                          .get("userImage");
                                      String sub = snapshot
                                          .data.documents[index]
                                          .get("subscription");
                                      print(sub);
                                      if (sub.trim() == "Yes" &&
                                          snapshot.data.documents[index]
                                                  .get("adminApproval") ==
                                              false) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 10),
                                              child: Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(2),
                                                  1: FlexColumnWidth(3),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(3),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(2),
                                                  6: FlexColumnWidth(2),
                                                  7: FlexColumnWidth(2)
                                                },
                                                children: [
                                                  TableRow(children: [
                                                    Text(
                                                      "\n" +
                                                          snapshot.data
                                                                  .documents[
                                                              index]["userId"],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .get(
                                                                        'userImage') ==
                                                                ""
                                                            ? Image.asset(
                                                                "assets/user.png",
                                                                width: 50,
                                                                height: 50,
                                                              )
                                                            : Image.network(snapshot
                                                                .data
                                                                .documents[
                                                                    index]
                                                                .get(
                                                                    'userImage'))),
                                                    Text(
                                                      "\n" +
                                                          snapshot.data
                                                              .documents[index]
                                                              .get("gender"),
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "\n" +
                                                          snapshot.data
                                                              .documents[index]
                                                              .get("email"),
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "\n" +
                                                          snapshot.data
                                                              .documents[index]
                                                              .get("mobileNo"),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "\n" +
                                                          snapshot.data
                                                              .documents[index]
                                                              .get(
                                                                  "subscription"),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "\nPending",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.only(
                                                            top: 15),
                                                        child: FlatButton(
                                                            onPressed: () {
                                                              dialog(snapshot
                                                                  .data
                                                                  .documents[
                                                                      index]
                                                                  .get("uid"));
                                                            },
                                                            color: Colors.green,
                                                            child: Text(
                                                              "Approve",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )))
                                                  ]),
                                                ],
                                              ),
                                            ),
                                            Divider()
                                          ],
                                        );
                                      }
                                      return Text("");
                                    });
                              }),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
