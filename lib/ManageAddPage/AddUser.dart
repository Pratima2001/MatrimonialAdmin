import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageFrontPage/UsersList.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Adduser extends StatefulWidget {
  Adduser1 createState() => Adduser1();
}

class Adduser1 extends State<Adduser> {
  TextEditingController first = TextEditingController(text: "First"),
      middle = TextEditingController(),
      last = TextEditingController(),
      adress = TextEditingController(),
      country = TextEditingController(),
      city = TextEditingController(),
      mobile = TextEditingController(),
      email = TextEditingController(),
      pass = TextEditingController();
  String colour = "---Choose Department---";
  List l = List();
  int status = 1;
  void initState() {
    super.initState();
    a();
  }

  a() async {
    await FirebaseFirestore.instance
        .collection("Department")
        .get()
        .then((value) => value.docs.forEach((element) {
              l.add(element.data()["departName"]);
            }));
    setState(() {
      l;
    });

    for (int i = 0; i < l.length; i++) {
      print(l[i]);
    }
  }

  adduser() async {
    Map<String, dynamic> map = {
      "firstName": first.text,
      "middleName": middle.text,
      "lastName": last.text,
      "adress": adress.text,
      "mobile": mobile.text,
      "username": email.text,
      "password": pass.text,
      "department": colour,
      "status": status == 1 ? true : false,
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc("Users")
        .collection("UsersList")
        .doc(email.text)
        .set(map);

    first.clear();
    middle.clear();
    last.clear();
    adress.clear();
    mobile.clear();
    pass.clear();
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
            child: Column(children: [
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
                padding: EdgeInsets.only(left: 50, top: 0, right: 50),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Setup',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserList()));
                        },
                        child: Text(
                          "Users List",
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: 800,
                        margin: EdgeInsets.only(left: 50, right: 50),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
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
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Adress',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 175,
                                    ),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'Mobile No',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 65,
                                    ),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'Username',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 65,
                                    ),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'Password',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'Department',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: 52,
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    margin: EdgeInsets.only(right: 200),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                    height: 35,
                                                    child: TextField(
                                                      controller: first,
                                                      decoration: InputDecoration(
                                                          hintText: "First",
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          border:
                                                              OutlineInputBorder()),
                                                    ))),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                    height: 35,
                                                    child: TextField(
                                                      controller: middle,
                                                      decoration: InputDecoration(
                                                          hintText: "Middle",
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          border:
                                                              OutlineInputBorder()),
                                                    ))),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                    height: 35,
                                                    child: TextField(
                                                      controller: last,
                                                      decoration: InputDecoration(
                                                          hintText: "Last",
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          border:
                                                              OutlineInputBorder()),
                                                    )))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: TextField(
                                              controller: adress,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  hintText: "Adress",
                                                  border: UnderlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none)),
                                            )),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          width: 300,
                                          height: 50,
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: 120,
                                                  height: 35,
                                                  child: TextField(
                                                    controller: country,
                                                    decoration: InputDecoration(
                                                        hintText: "Country",
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        border:
                                                            OutlineInputBorder()),
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  width: 120,
                                                  height: 35,
                                                  child: TextField(
                                                    controller: city,
                                                    decoration: InputDecoration(
                                                        hintText: "City",
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        border:
                                                            OutlineInputBorder()),
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Container(
                                            height: 35,
                                            child: TextField(
                                              controller: mobile,
                                              decoration: InputDecoration(
                                                  hintText: "Mobile No",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            )),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Container(
                                            height: 35,
                                            child: TextField(
                                              controller: email,
                                              decoration: InputDecoration(
                                                  hintText: "Username",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            )),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Container(
                                            height: 35,
                                            child: TextField(
                                              obscureText: true,
                                              controller: pass,
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder()),
                                            )),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          height: 35,
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
                                            items: l.map(
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
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 350,
                                          child: Row(
                                            children: [
                                              Radio(
                                                  value: 1,
                                                  groupValue: status,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      status = val;
                                                    });
                                                  }),
                                              Text("Enable"),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Radio(
                                                  value: 2,
                                                  groupValue: status,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      status = val;
                                                    });
                                                  }),
                                              Text("Diable"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 30,
                                          child: RaisedButton(
                                              color: Colors.blue,
                                              child: Text(
                                                "Add User",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                adduser();
                                              }),
                                        )
                                      ],
                                    )))
                          ],
                        ),
                      ))),
              SizedBox(
                height: 50,
              ),
            ]),
          ))
        ],
      ),
    );
  }
}
