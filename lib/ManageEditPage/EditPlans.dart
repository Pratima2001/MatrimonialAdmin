import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Editplans extends StatefulWidget {
  String Name, Credits, Planv, Planc, Order, Colour;
  bool Offinfo, Photou, Horou, Printv, Videou, Protectv, Mess, Book;
  Editplans(
      {this.Name,
      this.Credits,
      this.Planv,
      this.Planc,
      this.Order,
      this.Colour,
      this.Offinfo,
      this.Photou,
      this.Horou,
      this.Printv,
      this.Videou,
      this.Protectv,
      this.Mess,
      this.Book});
  Editplans1 createState() => Editplans1();
}

class Editplans1 extends State<Editplans> {
  int offiline = 2,
      print = 2,
      photou = 2,
      horoscope = 2,
      video = 2,
      protect = 2,
      bookmark = 2,
      message = 2;
  String colour = "Red";
  bool offlinedata = false,
      printedview = false,
      photoupload = false,
      horoupload = false,
      videoup = false,
      book = false,
      mess = false,
      protectv = false;
  TextEditingController name, credits, planvalidity, charges, order;

  void initState() {
    super.initState();
    name = TextEditingController(text: widget.Name);
    credits = TextEditingController(text: widget.Credits);
    planvalidity = TextEditingController(text: widget.Planv);
    charges = TextEditingController(text: widget.Planc);
    order = TextEditingController(text: widget.Order);
    offiline = widget.Offinfo == true ? 1 : 2;
    photou = widget.Photou == true ? 1 : 2;
    horoscope = widget.Horou == true ? 1 : 2;
    print = widget.Printv == true ? 1 : 2;
    video = widget.Videou == true ? 1 : 2;
    protect = widget.Protectv == true ? 1 : 2;
    message = widget.Mess == true ? 1 : 2;
    bookmark = widget.Book == true ? 1 : 2;
    colour = widget.Colour;
    offlinedata = widget.Offinfo == true ? true : false;
    printedview = widget.Printv == true ? true : false;
    photoupload = widget.Photou == true ? true : false;
    horoupload = widget.Horou == true ? true : false;
    videoup = widget.Videou == true ? true : false;
    book = widget.Book == true ? true : false;
    mess = widget.Mess == true ? true : false;
    protectv = widget.Protectv == true ? true : false;
  }

  addplan() async {
    Map<String, dynamic> map = {
      "Name": name.text,
      "Credits": credits.text,
      "planValidity": planvalidity.text,
      "planCharges": charges.text,
      "order": order.text,
      "Colour": colour,
      "offlineInfo": offlinedata,
      "printedView": printedview,
      "photoUpload": photoupload,
      "horoUpload": horoupload,
      "videoUpload": videoup,
      "bookmarkProfile": book,
      "messaging": mess,
      "protectVideo": protectv
    };
    await FirebaseFirestore.instance
        .collection("MembershipPlans")
        .doc(name.text)
        .update(map)
        .then((value) => showdialog());

    setState(() {
      name.clear();
      credits.clear();
      planvalidity.clear();
      charges.clear();
      order.clear();
      offlinedata = false;
      printedview = false;
      photoupload = false;
      horoupload = false;
      videoup = false;
      printedview = false;
      bookmark = 2;
      book = false;
      message = 2;
      mess = false;
      offiline = 2;
      print = 2;
      photou = 2;
      horoscope = 2;
      video = 2;
      protect = 2;
    });
  }

  showdialog() {
    Dialog success = Dialog(
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(10),
        width: 200,
        child: Center(
          child:
              Text("Data Updated Sucessfully!", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => success);
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
                  padding: EdgeInsets.only(left: 35, top: 0, right: 20),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members Plans Setup',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "Members Plan List",
                            style: TextStyle(color: Colors.blue),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 30, bottom: 50),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                                height: 1000,
                                padding: EdgeInsets.only(
                                    left: 60, top: 30, right: 250),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Name',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 210,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey[200])),
                                            child: TextField(
                                              controller: name,
                                              decoration: InputDecoration(
                                                  hintText: "Name",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Credits ',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 200,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey[200])),
                                            child: TextField(
                                              controller: credits,
                                              decoration: InputDecoration(
                                                  hintText: "Credits",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Plan Validity',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 170,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey[200])),
                                            child: TextField(
                                              controller: planvalidity,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Plan Validity in Days",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Plan Charges',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 165,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey[200])),
                                            child: TextField(
                                              controller: charges,
                                              decoration: InputDecoration(
                                                  hintText: "Plan Charges",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Order',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 217,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey[200])),
                                            child: TextField(
                                              controller: order,
                                              decoration: InputDecoration(
                                                  hintText: "Order",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\nColour",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 215,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          width: 150,
                                          height: 30,
                                          padding: EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                            hint: Text(colour),
                                            isExpanded: true,
                                            iconSize: 20.0,
                                            style:
                                                TextStyle(color: Colors.black),
                                            items: [
                                              'Red',
                                              'Green',
                                              'Blue',
                                              'Yellow'
                                            ].map(
                                              (val) {
                                                return DropdownMenuItem<String>(
                                                  value: val,
                                                  child: Text(val),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                colour = val.toString();
                                              });
                                            },
                                          )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Info To Offline Clients',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 117,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: offiline,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          offiline = val;
                                                          offlinedata = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: offiline,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          offiline = val;
                                                          offlinedata = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Printed View',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 175,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: print,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          print = val;
                                                          printedview = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: print,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          print = val;
                                                          printedview = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Photo Upload',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 168,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: photou,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          photou = val;
                                                          photoupload = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: photou,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          photou = val;
                                                          photoupload = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Horoscope Upload',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 135,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: horoscope,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          horoscope = val;
                                                          horoupload = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: horoscope,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          horoscope = val;
                                                          horoupload = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Video Upload',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 170,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: video,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          video = val;
                                                          videoup = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: video,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          video = val;
                                                          videoup = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Bookmark Profile',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 145,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: bookmark,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          bookmark = val;
                                                          book = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: bookmark,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          bookmark = val;
                                                          book = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Messaging',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 188,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: message,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          message = val;
                                                          mess = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: message,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          message = val;
                                                          mess = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Protect Video',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ])),
                                        SizedBox(
                                          width: 170,
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: protect,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          protect = val;
                                                          protectv = true;
                                                        });
                                                      }),
                                                  Text("Yes"),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Radio(
                                                      value: 2,
                                                      groupValue: protect,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          protect = val;
                                                          protectv = false;
                                                        });
                                                      }),
                                                  Text("No"),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Container(
                                      child: RaisedButton(
                                          color: Colors.blue,
                                          child: Text(
                                            "Edit Plan",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            addplan();
                                          }),
                                    )
                                  ],
                                )))))
              ],
            ))),
          ],
        ));
  }
}
