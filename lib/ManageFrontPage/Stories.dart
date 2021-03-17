import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageAddPage/Addstory.dart';
import 'package:shaddiadmin/ManageFrontPage/Viewstory.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class Stories extends StatefulWidget {
  Stories1 createState() => Stories1();
}

class Stories1 extends State<Stories> {
  String year;

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

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(width: 270, child: Navigation()),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 0, left: 0),
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
                      height: 70,
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Success Stories",
                            style: TextStyle(fontSize: 25),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 35,
                              width: 370,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    width: 200,
                                    child: TextField(
                                      onChanged: (val) {
                                        setState(() {
                                          year = val;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide.none),
                                          prefixIcon: Icon(Icons.search),
                                          contentPadding: EdgeInsets.only(
                                              bottom: 15, top: 2),
                                          hintText: "Search year"),
                                    ),
                                  ),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      color: Colors.white,
                                      minWidth: 150,
                                      height: 70,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Addstory()));
                                      },
                                      child: Text("Add Story"))
                                ],
                              ))
                        ],
                      )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 30, right: 20, bottom: 20),
                    color: Colors.white,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("SuccessStories")
                            .orderBy('year')
                            .startAt([year]).snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Processing");
                          }
                          return GridView.builder(
                              itemCount: snapshot.data.docs.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: 1.0,
                                      crossAxisSpacing: 1.0),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.grey)),
                                  margin: EdgeInsets.only(
                                      top: 20, left: 30, right: 30, bottom: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 150,
                                          child: Image(
                                            image: NetworkImage(snapshot.data
                                                .documents[index]["image"]),
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(snapshot
                                          .data.documents[index]["date"]
                                          .toString()),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 10, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(snapshot
                                                          .data.documents[index]
                                                      ["femaleName"] +
                                                  "-" +
                                                  snapshot.data.documents[index]
                                                      ["maleName"]),
                                              FlatButton(
                                                  height: 15,
                                                  color: Colors.white,
                                                  minWidth: 70,
                                                  onPressed: () {
                                                    String s = snapshot
                                                                .data.documents[
                                                            index]["maleName"] +
                                                        "-" +
                                                        snapshot.data.documents[
                                                                index]
                                                            ["femaleName"];
                                                    String story1 = snapshot
                                                            .data
                                                            .documents[index]
                                                        ["story"];
                                                    String photo1 = snapshot
                                                            .data
                                                            .documents[index]
                                                        ["image"];

                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Viewstory(
                                                                      name: s,
                                                                      photo:
                                                                          photo1,
                                                                      story:
                                                                          story1,
                                                                    )));
                                                  },
                                                  child: Text(
                                                    "Read  More",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ))
                                            ],
                                          )),
                                      FlatButton(
                                          padding: EdgeInsets.zero,
                                          minWidth: 50,
                                          onPressed: () async {
                                            bool b = snapshot.data
                                                .documents[index]["publish"];
                                            String uid = snapshot.data
                                                .documents[index]["userId"];
                                            Map<String, dynamic> publish = {
                                              "publish": !b,
                                            };
                                            String status;
                                            if (b == true) {
                                              status = "Unpublish";
                                            } else {
                                              status = "Publish";
                                            }
                                            await FirebaseFirestore.instance
                                                .collection("SuccessStories")
                                                .doc(uid)
                                                .update(publish)
                                                .then((value) =>
                                                    dialog("Story " + status));
                                          },
                                          child: snapshot.data.documents[index]
                                                      ["publish"] ==
                                                  true
                                              ? Text(
                                                  "Unpublish",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              : Text(
                                                  "Publish",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ))
                                    ],
                                  ),
                                );
                              });
                        }),
                  ))
                ],
              ),
            )),
          ],
        ));
  }
}
