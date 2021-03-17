import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/AddMember/AddmemberMain.dart';
import 'package:shaddiadmin/ManageEditPage/EditMemberprofile.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_list_tile.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';
import 'package:shaddiadmin/ui/theme.dart';

class Member extends StatefulWidget {
  Members1 createState() => Members1();
}

class Members1 extends State<Member> {
  String id;
  dialog() {
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

  show() {
    return Container(
      height: 400,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("UserData")
            .orderBy('userId')
            .startAt([a]).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("");
          }
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                String image = snapshot.data.documents[index].get("userImage");
                String sub = snapshot.data.documents[index].get("subscription");
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(3),
                          2: FlexColumnWidth(2),
                          3: FlexColumnWidth(2),
                          4: FlexColumnWidth(3),
                          5: FlexColumnWidth(3),
                          6: FlexColumnWidth(2),
                          7: FlexColumnWidth(2)
                        },
                        children: [
                          TableRow(children: [
                            Text(
                              "\n" + snapshot.data.documents[index]["userId"],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: snapshot.data.documents[index]
                                            .get('userImage') ==
                                        ""
                                    ? Image.asset(
                                        "assets/user.png",
                                        width: 50,
                                        height: 50,
                                      )
                                    : Image.network(snapshot
                                        .data.documents[index]
                                        .get('userImage'))),
                            Text(
                              "\n" +
                                  snapshot.data.documents[index].get("gender"),
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "\n" +
                                  snapshot.data.documents[index]
                                      .get("subscription"),
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "\n" +
                                  snapshot.data.documents[index]
                                      .get("mobileNo"),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "\n" +
                                  snapshot.data.documents[index].get("email"),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "\nStatus",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 15),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        id = snapshot.data.documents[index]
                                            .get("userId");
                                        String profile = snapshot
                                            .data.documents[index]
                                            .get("userImage");
                                        String username = snapshot
                                            .data.documents[index]
                                            .get("username");
                                        String profil = snapshot
                                            .data.documents[index]
                                            .get("profileFor");
                                        String password = snapshot
                                            .data.documents[index]
                                            .get("password");
                                        String firstname = snapshot
                                            .data.documents[index]
                                            .get("firstName");
                                        String lastname1 = snapshot
                                            .data.documents[index]
                                            .get("lastName");
                                        String email1 = snapshot
                                            .data.documents[index]
                                            .get("email");

                                        String gender1 = snapshot
                                            .data.documents[index]
                                            .get("gender");
                                        String d = snapshot
                                            .data.documents[index]
                                            .get("anyDisablity");
                                        String height1 = snapshot
                                            .data.documents[index]
                                            .get("height");
                                        String blood = snapshot
                                            .data.documents[index]
                                            .get("bloodGroup");
                                        String abou = snapshot
                                            .data.documents[index]
                                            .get("aboutYou");

                                        String religion1 = snapshot
                                            .data.documents[index]
                                            .get("religion");
                                        String com = snapshot
                                            .data.documents[index]
                                            .get("community");
                                        String mothert = snapshot
                                            .data.documents[index]
                                            .get("motherTongue");
                                        String ctry = snapshot
                                            .data.documents[index]
                                            .get("country");
                                        String state1 = snapshot
                                            .data.documents[index]
                                            .get("state");
                                        String weight1 = snapshot
                                            .data.documents[index]
                                            .get("bodyWeight");
                                        if (lmemberupdate == true) {
                                          Navigator
                                                  .of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile(
                                                          id: id,
                                                          profile: profile,
                                                          username: username,
                                                          first: firstname,
                                                          lastname: lastname1,
                                                          email: email1,
                                                          profilefor: profil,
                                                          password: password,
                                                          mobile: snapshot.data
                                                              .documents[index]
                                                              .get("mobileNo"),
                                                          marital: snapshot.data
                                                              .documents[index]
                                                              .get(
                                                                  "maritalStatus"),
                                                          gender: gender1,
                                                          disablity: d,
                                                          height: height1,
                                                          bloodgrp: blood,
                                                          about: abou,
                                                          religion: religion1,
                                                          community: com,
                                                          mothertongue: mothert,
                                                          country: ctry,
                                                          state: state1,
                                                          weight: weight1)));
                                        } else {
                                          dialog();
                                        }
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
                                          lmemberdelete == true
                                              ? delete()
                                              : dialog();
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
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                    Divider()
                  ],
                );
              });
        },
      ),
    );
  }

  delete() {
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
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection("UserData")
                .doc(id)
                .delete();
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

  acessdenied() {
    return Container(
      height: 400,
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

  showtable() {
    return Container(
      height: 30,
      margin: EdgeInsets.only(left: 20, right: 10),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(3),
          5: FlexColumnWidth(3),
          6: FlexColumnWidth(2),
          7: FlexColumnWidth(2)
        },
        children: [
          TableRow(children: [
            Text(
              "Member ID",
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
              "Subscription",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              "Mobile",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              "Email",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              "Status",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              "Actions",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
  }

  int w = 800;
  String a, b;
  Color c = Colors.red;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(width: 270, child: Navigation()),
        Expanded(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              backgroundColor: Colors.white,
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
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.only(top: 20, left: 30),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Members",
                      style: TextStyle(fontSize: 23),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 35,
                        width: 370,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              width: 200,
                              child: TextField(
                                onChanged: (val) {
                                  setState(() {
                                    a = val;
                                    b = a.toLowerCase();
                                  });
                                },
                                controller: _controller,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    prefixIcon: Icon(Icons.search),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 15, top: 2),
                                    hintText: "Search"),
                              ),
                            ),
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25)),
                                color: Colors.white,
                                minWidth: 150,
                                height: 70,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Addmember()));
                                },
                                child: Text("Add Member"))
                          ],
                        ))
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            lmemberslist == true ? showtable() : Text(""),
            Divider(
              color: Colors.grey[200],
            ),
            lmemberslist == true ? show() : acessdenied()
          ],
        ))),
      ],
    ));
  }
}
