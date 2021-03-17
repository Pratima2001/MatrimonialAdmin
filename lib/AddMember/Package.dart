import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageEditPage/EditPlans.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Package extends StatefulWidget {
  Package1 createState() => Package1();
}

class Package1 extends State<Package> {
  IconData yes = Icons.check;
  IconData no = Icons.close;
  Color r = Colors.red;
  Color g = Colors.green;
  Color c;
  int group = 1;
  Razorpay razorpay;

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

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    Map<String, dynamic> options = {
      "key": "[rzp_test_Q0RUQnP7YaTYsi]",
      "amount": 1,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "7304124648", "email": "pdong3266@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
  }

  void handlerErrorFailure() {
    print("Pament error");
  }

  void handlerExternalWallet() {
    print("External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\n               Select Package",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 50),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 1000,
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 0, right: 10),
                          margin: EdgeInsets.only(left: 20, right: 10, top: 20),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(children: [
                                Text(
                                  "Sr No",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text("Select",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15)),
                                Text(
                                  "Name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Credits",
                                  textAlign: TextAlign.center,
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
                                  "Colour",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                            height: 300,
                            width: 1000,
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
                                        String clr = snapshot
                                            .data.documents[index]
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
                                              3: FlexColumnWidth(1),
                                              4: FlexColumnWidth(1),
                                              5: FlexColumnWidth(1),
                                              6: FlexColumnWidth(1),
                                            },
                                            children: [
                                              TableRow(children: [
                                                Text(
                                                  index.toString(),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                                Radio(
                                                    value: index,
                                                    groupValue: group,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        group = val;
                                                      });
                                                    }),
                                                Text(
                                                  snapshot.data.documents[index]
                                                      .get("Name"),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot.data.documents[index]
                                                      .get("Credits"),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot.data.documents[index]
                                                          .get("planValidity") +
                                                      " Days",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot.data.documents[index]
                                                      .get("planCharges"),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      color: c),
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
                                })),
                        FlatButton(
                          onPressed: () {
                            openCheckout();
                          },
                          child: Text("press"),
                          color: Colors.blue,
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
