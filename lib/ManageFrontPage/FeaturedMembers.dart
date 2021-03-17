import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class Featuredmembers extends StatefulWidget {
  Featuredmembers1 createState() => Featuredmembers1();
}

class Featuredmembers1 extends State<Featuredmembers> {
  var date = Timestamp.now().toDate();

  degrademembership(String id, bool b) async {
    bool yes = true, no = false;
    Map<String, dynamic> map = {"status": "Inactive"};
  }

  degrade(String userid) {
    String sub;
    Map<String, dynamic> update = {"subscription": "Not Specified"};
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(userid)
        .update(update);
  }

  dialog(String u) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n\nAre you sure you want to degrade this membership?\n"),
      actions: [
        FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            onPressed: () {
              Navigator.of(context).pop();
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
          color: Colors.red,
          onPressed: () {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Row(
          children: [
            Container(width: 270, child: Navigation()),
            Expanded(
              child: Container(
                child: Container(
                  child: Column(
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
                        margin: EdgeInsets.only(left: 30, top: 20),
                        height: 60,
                        child: Text(
                          "Featured Members",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 30),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              margin:
                                  EdgeInsets.only(left: 20, right: 10, top: 20),
                              child: Table(
                                columnWidths: {
                                  0: FlexColumnWidth(2),
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
                                      "Member Id",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Package",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      "Price",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      "Received",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      "Expired",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      "Status",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      "Action",
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey[200],
                            ),
                            Expanded(
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("RazorPay")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Text("Processing");
                                      }
                                      return ListView.builder(
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (context, index) {
                                            var date1 = snapshot
                                                .data.documents[index]
                                                .get("timestamp")
                                                .toDate()
                                                .add(Duration(days: 20));

                                            print(
                                                date.difference(date1).inDays);
                                            return Container(
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 10, top: 20),
                                              child: Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(2),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(2),
                                                  6: FlexColumnWidth(2),
                                                },
                                                children: [
                                                  TableRow(children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          snapshot.data
                                                              .documents[index]
                                                              .get("userId"),
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                    Text(
                                                      snapshot
                                                          .data.documents[index]
                                                          .get(
                                                              "membershipType"),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rs " +
                                                          snapshot.data
                                                              .documents[index]
                                                              .get("amount"),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data.documents[index]
                                                          .get("timestamp")
                                                          .toDate()
                                                          .toString()
                                                          .substring(0, 11)
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data.documents[index]
                                                          .get("timestamp")
                                                          .toDate()
                                                          .add(Duration(
                                                              days: 20))
                                                          .toString()
                                                          .substring(0, 11)
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot
                                                                  .data
                                                                  .documents[
                                                                      index]
                                                                  .get(
                                                                      "status") ==
                                                              "Active"
                                                          ? "Active"
                                                          : "Inactive",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: FlatButton(
                                                          minWidth: 20,
                                                          color: Colors.red,
                                                          onPressed: () {
                                                            degrademembership(
                                                                snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .get(
                                                                        "userId"),
                                                                snapshot
                                                                    .data
                                                                    .documents[
                                                                        index]
                                                                    .get(
                                                                        "status"));
                                                          },
                                                          child: Text(
                                                            "Degrade",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    )
                                                  ]),
                                                ],
                                              ),
                                            );
                                          });
                                    }))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
