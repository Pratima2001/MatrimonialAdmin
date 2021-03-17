import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shaddiadmin/ui/Navigationdrawer.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Orders extends StatefulWidget {
  Order1 createState() => Order1();
}

class Order1 extends State<Orders> {
  var date = Timestamp.now().toDate();

  Future<void> _createPDF(String a, String id) async {
    PdfDocument document = PdfDocument();

//Adds a page to the document
    PdfPage page = document.pages.add();
    PdfTextElement(
      text: "Payment Receipt\n",
      font: PdfStandardFont(PdfFontFamily.helvetica, 20),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(page.getClientSize().width / 2 - 80, 0,
            page.getClientSize().width / 2, page.getClientSize().height / 2));
    PdfTextElement(
      text: "Invoice to:\n",
      font: PdfStandardFont(PdfFontFamily.helvetica, 18),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(0, 100, page.getClientSize().width / 2,
            page.getClientSize().height / 2));
    PdfTextElement(text: a, font: PdfStandardFont(PdfFontFamily.timesRoman, 12))
        .draw(
            page: page,
            bounds: Rect.fromLTWH(0, 140, page.getClientSize().width / 2,
                page.getClientSize().height / 2));

//Create a text element with the text and font
//Draw the text in second column

    //Save the document
    List<int> bytes = document.save();
    //Dispose the document
    document.dispose();
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "$id.pdf")
      ..click();
  }

  getdata(String s, String amount, String membership, String date) async {
    String name, email, phone, uid;

    await FirebaseFirestore.instance
        .collection("UserData")
        .get()
        .then((value) => {
              value.docs.forEach((doc) {
                if (doc.data()["userId"] == s) {
                  uid = doc.data()["uid"];
                  finduser(uid, amount, membership, date);
                }
              })
            });
  }

  finduser(String s, String amount, String membership, String date) async {
    String name, email, phone, userId;
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(s)
        .get()
        .then((value) => {
              email = value.data()["email"],
              phone = value.data()["mobileNo"],
              userId = value.data()["userId"]
            });
    String details = " Member Id :          $userId\n" +
        "\n Email:                  $email\n" +
        "\n Mobile No:           $phone\n" +
        "\n Package:                $membership\n" +
        "\n Amount:                Rs $amount\n" +
        "\n Date:                     $date\n"
            "\n Payment mode:      Card";

    _createPDF(details, userId);
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
                          "Orders List",
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
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(2),
                                  2: FlexColumnWidth(2),
                                  3: FlexColumnWidth(2),
                                  4: FlexColumnWidth(2),
                                  5: FlexColumnWidth(2),
                                  6: FlexColumnWidth(2),
                                  7: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "Sr.No",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Member ID",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                        )),
                                    Text(
                                      "Package",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Price",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Received",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Expired",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Status",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Actions",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 17),
                                    ),
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
                                                  0: FlexColumnWidth(1),
                                                  1: FlexColumnWidth(2),
                                                  2: FlexColumnWidth(2),
                                                  3: FlexColumnWidth(2),
                                                  4: FlexColumnWidth(2),
                                                  5: FlexColumnWidth(2),
                                                  6: FlexColumnWidth(2),
                                                  7: FlexColumnWidth(2),
                                                },
                                                children: [
                                                  TableRow(children: [
                                                    Text(
                                                      index.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
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
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      date
                                                                  .difference(
                                                                      date1)
                                                                  .inDays >
                                                              0
                                                          ? "Inactive"
                                                          : "Active",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        icon: Icon(
                                                          Icons.file_download,
                                                          color: Colors.green,
                                                        ),
                                                        onPressed: () {
                                                          getdata(
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
                                                                      "amount"),
                                                              snapshot
                                                                  .data
                                                                  .documents[
                                                                      index]
                                                                  .get(
                                                                      "membershipType"),
                                                              snapshot
                                                                  .data
                                                                  .documents[
                                                                      index]
                                                                  .get(
                                                                      "timestamp")
                                                                  .toDate()
                                                                  .toString());
                                                        })
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
