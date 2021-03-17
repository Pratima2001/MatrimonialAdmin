import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageEditPage/EditMemberprofile.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Dash1 extends StatefulWidget {
  Dash createState() => Dash();
}

class Dash extends State<Dash1> {
  int w = 800;
  String a, b;
  Color c = Colors.red;
  TextEditingController _controller = TextEditingController();
  int m, day, yr;
  int totalmembers = 0, freem = 0, premium = 0, approved;
  DateTime date;
  int earningtotal = 0,
      earninglastmonth = 0,
      earninglastyr = 0,
      earninglast6month = 0,
      earninglast3months = 0;
  getCurrentDate() {
    var date = new DateTime.now().toString();
    String s = "";
    var dateParse = DateTime.parse(date);
    m = dateParse.month;
    day = dateParse.day;
    yr = dateParse.year;
  }

  void initState() {
    super.initState();
    getCurrentDate();
    getdata();
    getuserdata();
  }

  getdata() async {
    await FirebaseFirestore.instance
        .collection("RazorPay")
        .get()
        .then((doc) => {
              date = Timestamp.now().toDate(),
              doc.docs.forEach((document) {
                DateTime lastm = document.data()["timestamp"].toDate();
                earningtotal += int.parse(document.data()["amount"]);

                final lastdate = DateTime(lastm.year, lastm.month, lastm.day);
                print("lastdate" + lastdate.toString());
                final date2 = DateTime.now();
                print("todaysdays" + date2.toString());
                final difference = date2.difference(lastdate).inDays;
                print("difference" + difference.toString());

                if (difference <= 30) {
                  earninglastmonth += int.parse(document.data()["amount"]);
                  setState(() {});
                }
                if (difference <= 90) {
                  earninglast3months += int.parse(document.data()["amount"]);
                  setState(() {});
                }
                if (difference <= 180) {
                  earninglast6month += int.parse(document.data()["amount"]);
                  setState(() {});
                }
                if (difference <= 360) {
                  earninglastyr += int.parse(document.data()["amount"]);
                  setState(() {});
                }
              })
            });
  }

  getuserdata() async {
    await FirebaseFirestore.instance.collection("UserData").get().then((doc) =>
        {
          doc.docs.forEach((document) {
            if (document.data()["subscription"].toString().trim() == "Yes") {
              premium += 1;
              setState(() {});
            }
            if (document.data()["subscription"].toString().trim() != "Yes") {
              freem += 1;
              setState(() {});
            }
          })
        });
    totalmembers = freem + premium;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(width: 270, child: Navigation()),
        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  height: 1400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/front1.jpg"),
                                fit: BoxFit.fitWidth)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 65),
                          child: Text(
                            "\nMembers\n",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 50),
                        margin: EdgeInsets.only(
                            left: 30, right: 30, bottom: 30, top: 20),
                        color: Colors.white,
                        child: Container(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/members.png",
                                              width: 120,
                                              height: 120,
                                            ),
                                            Text("$totalmembers \n"),
                                            Text(
                                              "Total Members",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 100,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/freem1.png",
                                              width: 120,
                                              height: 120,
                                            ),
                                            Text("$freem \n"),
                                            Text("Free Members",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 100,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(
                                              "assets/premiumm1.png",
                                              width: 100,
                                              height: 100,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "$premium",
                                            ),
                                            Text(
                                              "\nPremium Members",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      child: Container(
                                    color: Colors.white,
                                  ))),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 65),
                          child: Text(
                            "\nEarning\n",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 50),
                        margin: EdgeInsets.only(
                            left: 30, right: 30, bottom: 30, top: 20),
                        color: Colors.white,
                        child: Container(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/total.png",
                                              width: 100,
                                              height: 100,
                                            ),
                                            Text(
                                              "\nRs $earningtotal",
                                            ),
                                            Text(
                                              "\nTotal Earnings",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/lastmonth.jpg",
                                              width: 100,
                                              height: 100,
                                            ),
                                            Text("\nRs $earninglastmonth\n"),
                                            Text("Last Month",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/lastmonth.jpg",
                                              width: 100,
                                              height: 100,
                                            ),
                                            Text("\nRs $earninglastmonth\n"),
                                            Text("Last 3 Months",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/last6months.png",
                                              width: 100,
                                              height: 100,
                                            ),
                                            Text("\nRs $earninglast3months\n"),
                                            Text("Last 6 Months",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/lastyr.png",
                                              width: 100,
                                              height: 100,
                                            ),
                                            Text("\nRs $earninglastyr"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Last Year",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 65),
                          child: Text(
                            "\nSuccess Stories\n",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 50),
                        margin: EdgeInsets.only(
                            left: 30, right: 30, bottom: 30, top: 20),
                        color: Colors.white,
                        child: Container(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/publish.png",
                                              width: 60,
                                              height: 60,
                                            ),
                                            Text("\n\n$totalmembers \n"),
                                            Text(
                                              "Total Publish",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 100,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      elevation: 5,
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/ubpublish.jpg",
                                              width: 60,
                                              height: 60,
                                            ),
                                            Text("\n\n$freem \n"),
                                            Text("Total Unpublish",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ))),
                              SizedBox(
                                width: 100,
                              ),
                              Expanded(flex: 1, child: Container()),
                              SizedBox(
                                width: 60,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Material(
                                      child: Container(
                                    color: Colors.white,
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )))
      ],
    ));
  }
}
