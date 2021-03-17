import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageFrontPage/MessageScreen.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class MessageMainScreen extends StatefulWidget {
  MessageMainScreen1 createState() => MessageMainScreen1();
}

class MessageMainScreen1 extends State<MessageMainScreen> {
  String idu, url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          Container(width: 250, child: Navigation()),
          Expanded(
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
                Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "Messages",
                      style: TextStyle(fontSize: 25),
                    )),
                Expanded(
                    child: Container(
                  margin:
                      EdgeInsets.only(left: 50, bottom: 20, top: 30, right: 50),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 10,
                                        left: 15,
                                        top: 10,
                                        bottom: 10),
                                    height: 40,
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Search",
                                            prefixIcon: Icon(Icons.search),
                                            contentPadding:
                                                EdgeInsets.only(left: 10),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        40)))),
                                  ),
                                  Expanded(
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("UserData")
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Text("Processing");
                                          }
                                          return ListView.builder(
                                              itemCount:
                                                  snapshot.data.docs.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        idu = snapshot
                                                                .data.documents[
                                                            index]["userId"];
                                                        url = snapshot
                                                                .data.documents[
                                                            index]["userImage"];
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 70,
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            leading:
                                                                CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(snapshot
                                                                          .data
                                                                          .documents[index]
                                                                      [
                                                                      "userImage"]),
                                                            ),
                                                            title: Text(snapshot
                                                                    .data
                                                                    .documents[
                                                                index]["userId"]),
                                                            subtitle: Text(
                                                                "Sent a message"),
                                                          ),
                                                          Divider(
                                                            height: 1,
                                                            color: Colors
                                                                .grey[200],
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                              });
                                        }),
                                  )
                                ],
                              ))),
                      Expanded(
                          flex: 2,
                          child: Container(
                              child: MessageScreen(
                            id: idu,
                            url: url,
                          )))
                    ],
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
