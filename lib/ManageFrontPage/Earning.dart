import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class Earning extends StatefulWidget {
  Earning1 createState() => Earning1();
}

class Earning1 extends State<Earning> {
  int m, day, yr;
  DateTime date;
  int earningtotal = 0,
      earninglastmonth = 0,
      earninglastyr = 0,
      earninglast6month = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(width: 270, child: Navigation()),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "\nEarning\n",
                      style: TextStyle(fontSize: 25),
                    )),
                Container(
                  margin:
                      EdgeInsets.only(left: 50, right: 50, bottom: 30, top: 40),
                  color: Colors.white,
                  child: Container(
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Material(
                                elevation: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/total.png",
                                        width: 120,
                                        height: 120,
                                      ),
                                      Text("Rs $earningtotal\n"),
                                      Text(
                                        "Total Earnings",
                                        style: TextStyle(fontSize: 17),
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
                                elevation: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/lastmonth.jpg",
                                        width: 120,
                                        height: 120,
                                      ),
                                      Text("Rs $earninglastmonth\n"),
                                      Text("Last Month",
                                          style: TextStyle(fontSize: 17))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                            flex: 1,
                            child: Material(
                                elevation: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/last6months.png",
                                        width: 120,
                                        height: 120,
                                      ),
                                      Text("Rs $earninglast6month\n"),
                                      Text("Last 6 Months",
                                          style: TextStyle(fontSize: 17))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                            flex: 1,
                            child: Material(
                                elevation: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/lastyr.png",
                                        width: 120,
                                        height: 120,
                                      ),
                                      Text("Rs $earninglastyr\n"),
                                      Text("Last Year",
                                          style: TextStyle(fontSize: 17))
                                    ],
                                  ),
                                ))),
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
