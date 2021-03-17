import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class Photoapp extends StatefulWidget {
  Photoapp1 createState() => Photoapp1();
}

class Photoapp1 extends State<Photoapp> {
  var b1;
  bool b;

  dialog(String s) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      content: Text("\n$s\n"),
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
            color: Colors.grey[200],
            margin: EdgeInsets.only(left: 0, top: 0, bottom: 10, right: 50),
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
                  margin: EdgeInsets.only(left: 50, top: 0),
                  height: 60,
                  child: Text(
                    "Photo Approval",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 50),
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 40, left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 170,
                    child: Container(
                      height: 400,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("UserData")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("Processing");
                            }
                            return GridView.builder(
                                itemCount: snapshot.data.docs.length,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        childAspectRatio: 1.0,
                                        crossAxisSpacing: 1.0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    margin:
                                        EdgeInsets.only(left: 10, right: 20),
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Text(
                                            snapshot.data.documents[index].get(
                                                  "userId",
                                                ) +
                                                "\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 0, right: 0),
                                          child: Image(
                                            width: 165,
                                            height: 144,
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .data.documents[index]
                                                .get("userImage")),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        FlatButton(
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("photoApproval") ==
                                                    true
                                                ? Colors.red
                                                : Colors.green,
                                            onPressed: () async {
                                              String id1 = snapshot
                                                  .data.documents[index]
                                                  .get("uid");
                                              Map<String, dynamic> map = {
                                                "photoApproval": true
                                              };
                                              Map<String, dynamic> map1 = {
                                                "photoApproval": false
                                              };
                                              await FirebaseFirestore.instance
                                                  .collection("UserData")
                                                  .doc(id1)
                                                  .get()
                                                  .then((value) => {
                                                        b = value.data()[
                                                            "photoApproval"],
                                                        if (b == true)
                                                          {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "UserData")
                                                                .doc(id1)
                                                                .update(map1)
                                                                .then((value) =>
                                                                    dialog(
                                                                        "Photo Reject"))
                                                          }
                                                        else
                                                          {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "UserData")
                                                                .doc(id1)
                                                                .update(map)
                                                                .then((value) =>
                                                                    dialog(
                                                                        "Photo Approved"))
                                                          }
                                                      });
                                              setState(() {});
                                            },
                                            child: Text(
                                              snapshot.data.documents[index].get(
                                                          "photoApproval") ==
                                                      true
                                                  ? "Reject"
                                                  : "Approve",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
