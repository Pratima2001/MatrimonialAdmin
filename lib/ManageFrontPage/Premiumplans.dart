import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shaddiadmin/ManageEditPage/EditPlans.dart';
import 'package:shaddiadmin/ManageAddPage/Addplans.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import '../ui/collapsing_navigation_drawer.dart';

class Premiumplan extends StatefulWidget {
  Premiumplan1 createState() => Premiumplan1();
}

class Premiumplan1 extends State<Premiumplan> {
  ScrollController _controller = ScrollController();
  IconData yes = Icons.check;
  IconData no = Icons.close;
  Color r = Colors.red;
  Color g = Colors.green;
  Color c;
  setclr(String s) {
    if (s == "Red") {
      c = Colors.red;
    } else if (s == "Blue") {
      c = Colors.blue;
    } else if (s == "Green") {
      c = Colors.green;
    } else if (s == "Yellow") {
      c = Colors.yellow;
    }
  }

  showdialog() {
    Dialog success = Dialog(
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(10),
        width: 200,
        child: Center(
          child:
              Text("Data Deleted Sucessfully!", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => success);
  }

  dialogdenied() {
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

  showdata() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 50),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 1800,
                    color: Colors.grey[100],
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 10, right: 10),
                    margin: EdgeInsets.only(left: 20, right: 10, top: 20),
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                        3: FlexColumnWidth(2),
                        4: FlexColumnWidth(2),
                        5: FlexColumnWidth(1),
                        6: FlexColumnWidth(2),
                        7: FlexColumnWidth(2),
                        8: FlexColumnWidth(2),
                        9: FlexColumnWidth(3),
                        10: FlexColumnWidth(2),
                        11: FlexColumnWidth(2),
                        12: FlexColumnWidth(2),
                        13: FlexColumnWidth(2),
                        14: FlexColumnWidth(2),
                        15: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(children: [
                          Text(
                            "Sr No",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Credits",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Plan_Validity",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Plan_Charges",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Colour",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Offline_Intimation",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Photo_Upload",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Horoscope_upload",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "printedView",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              )),
                          Text(
                            "Video Upload",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Protect Photo",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Messaging",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "BookmarkPro",
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
                  ),
                  Container(
                      height: 300,
                      width: 1800,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("MembershipPlans")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("Processing...");
                            }
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  String clr = snapshot.data.documents[index]
                                      .get("Colour")
                                      .toString();
                                  setclr(clr);

                                  return Container(
                                      child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(1),
                                        2: FlexColumnWidth(1),
                                        3: FlexColumnWidth(2),
                                        4: FlexColumnWidth(2),
                                        5: FlexColumnWidth(1),
                                        6: FlexColumnWidth(2),
                                        7: FlexColumnWidth(2),
                                        8: FlexColumnWidth(2),
                                        9: FlexColumnWidth(3),
                                        10: FlexColumnWidth(2),
                                        11: FlexColumnWidth(2),
                                        12: FlexColumnWidth(2),
                                        13: FlexColumnWidth(2),
                                        14: FlexColumnWidth(2),
                                        15: FlexColumnWidth(2),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Text(
                                            index.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                .get("Name"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                .get("Credits"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                    .get("planValidity") +
                                                " Days",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                .get("planCharges"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Text(
                                            snapshot.data.documents[index]
                                                .get("order"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: 20,
                                                height: 20,
                                                color: c),
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("offlineInfo") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("offlineInfo") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("photoUpload") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("photoUpload") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("horoUpload") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("horoUpload") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("printedView") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("printedView") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("videoUpload") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("videoUpload") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("protectVideo") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("protectVideo") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index]
                                                        .get("messaging") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get("messaging") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Icon(
                                            snapshot.data.documents[index].get(
                                                        "bookmarkProfile") ==
                                                    true
                                                ? yes
                                                : no,
                                            color: snapshot
                                                        .data.documents[index]
                                                        .get(
                                                            "bookmarkProfile") ==
                                                    true
                                                ? g
                                                : r,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  String name = snapshot
                                                      .data.documents[index]
                                                      .get("Name");
                                                  String cre = snapshot
                                                      .data.documents[index]
                                                      .get("Credits");
                                                  String pvalidity = snapshot
                                                      .data.documents[index]
                                                      .get("planValidity");
                                                  String charge = snapshot
                                                      .data.documents[index]
                                                      .get("planCharges");
                                                  String ordr = snapshot
                                                      .data.documents[index]
                                                      .get("order");
                                                  String clr = snapshot
                                                      .data.documents[index]
                                                      .get("Colour");
                                                  bool offline = snapshot
                                                      .data.documents[index]
                                                      .get("offlineInfo");
                                                  bool photo = snapshot
                                                      .data.documents[index]
                                                      .get("photoUpload");
                                                  bool horo = snapshot
                                                      .data.documents[index]
                                                      .get("horoUpload");
                                                  bool print = snapshot
                                                      .data.documents[index]
                                                      .get("printedView");
                                                  bool video = snapshot
                                                      .data.documents[index]
                                                      .get("videoUpload");
                                                  bool protect = snapshot
                                                      .data.documents[index]
                                                      .get("protectVideo");
                                                  bool message = snapshot
                                                      .data.documents[index]
                                                      .get("messaging");
                                                  bool book = snapshot
                                                      .data.documents[index]
                                                      .get("bookmarkProfile");
                                                  lplanupdate == true
                                                      ? Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Editplans(
                                                                        Name:
                                                                            name,
                                                                        Credits:
                                                                            cre,
                                                                        Planv:
                                                                            pvalidity,
                                                                        Planc:
                                                                            charge,
                                                                        Order:
                                                                            ordr,
                                                                        Colour:
                                                                            clr,
                                                                        Offinfo:
                                                                            offline,
                                                                        Photou:
                                                                            photo,
                                                                        Horou:
                                                                            horo,
                                                                        Printv:
                                                                            print,
                                                                        Videou:
                                                                            video,
                                                                        Protectv:
                                                                            protect,
                                                                        Mess:
                                                                            message,
                                                                        Book:
                                                                            book,
                                                                      )))
                                                      : dialogdenied();
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
                                                    String s = snapshot
                                                        .data.documents[index]
                                                        .get("Name");
                                                    lplandel == false
                                                        ? dialogdenied()
                                                        : await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "MembershipPlans")
                                                            .doc(s)
                                                            .delete()
                                                            .then((value) =>
                                                                showdialog());
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
                                        ]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    )
                                  ]));
                                });
                          }))
                ],
              ))
        ],
      ),
    );
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
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members Plans List',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            lplanadd == true
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Addplans()))
                                : dialogdenied();
                          },
                          child: Text(
                            "Add Members Plan",
                            style: TextStyle(color: Colors.green),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: lplanslist == true ? showdata() : acessdenied())
              ],
            ))),
          ],
        ));
  }
}
