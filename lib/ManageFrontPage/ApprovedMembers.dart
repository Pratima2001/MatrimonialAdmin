import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class ApprovedMembers extends StatefulWidget {
  ApprovedMembers1 createState() => ApprovedMembers1();
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

class ApprovedMembers1 extends State<ApprovedMembers> {
  dialog(String sub) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n\nAre you sure you want to Disapprove this member?\n"),
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
          minWidth: 70,
          color: Colors.red,
          onPressed: () {
            approval(sub, "No", false);
            Navigator.of(context).pop();
          },
          child: Text("Yes"),
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
        .then((value) => {dialog1("Member Disapproved")});
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
                          "Approved Members",
                          style: TextStyle(fontSize: 25),
                        ),
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
                                              true) {
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
                                                      "\nApproved",
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
                                                            color: Colors.red,
                                                            child: Text(
                                                              "Disapprove",
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
