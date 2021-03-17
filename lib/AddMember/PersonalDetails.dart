import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_cloud_messaging_interop/firebase_cloud_messaging_interop.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/Theme.dart';

class Personal extends StatefulWidget {
  Personal1 createState() => Personal1();
}

class Personal1 extends State<Personal> {
  String profilfor = "---Choose Profile For---",
      mother = "--Choose Mother Tongue--",
      i,
      date = "DD",
      month = "MM",
      yr = "YY",
      marital = "Never Married",
      religion = "--Choose Religion--";
  FirebaseMessagingWeb fcm;

  String currentToken, token;
  DocumentReference docRef;
  TextEditingController _first = TextEditingController(),
      _last = TextEditingController(),
      _mobile = TextEditingController(),
      _email = TextEditingController(),
      _pass = TextEditingController(),
      _community = TextEditingController(),
      _subcom = TextEditingController(),
      _about = TextEditingController(),
      _yr = TextEditingController();
  dialog(String a, String b) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 25,
      ),
      title: Text(a),
      content: Text(b),
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

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  Savedata() async {
    i = getRandomString(28);
    if (_first.text.length == 0 ||
        _last.text.length == 0 ||
        _mobile.text.length == 0 ||
        _email.text.length == 0 ||
        _pass.text.length == 0 ||
        _community.text.length == 0 ||
        _subcom.text.length == 0 ||
        profilfor == "---Choose Profile For---" ||
        religion == "--Choose Religion--" ||
        mother == "--Choose Mother Tongue--" ||
        _about.text == "" ||
        _yr.text == "" ||
        date == "DD" ||
        month == "MM") {
      dialog("Alert", "Fill all required details");
    } else {
      Map<String, dynamic> data = {
        'FCMToken': token,
        'age': '',
        'annualIncome': "Not Specified",
        "profileFor": profilfor,
        "firstName": _first.text,
        "lastName": _last.text,
        "gender": gender == 1 ? "Male" : "female",
        "birthDate": date + "-" + month + _yr.text,
        "dateOfBirth": "Not Specified",
        "mobileNo": _mobile.text,
        "email": _email.text,
        "password": _pass.text,
        "motherTongue": mother,
        "religion": religion,
        "maritalStatus": marital,
        "community": _community.text,
        "subCommunity": _subcom.text,
        "aboutYou": _about.text,
        "userId": _first.text + "  " + _last.text,
        "casteNoBar": "Not Specified",
        'city': "Not Specified",
        'cityOfBirth': 'Not Specified',
        'createdAt': 1658975324,
        'username': _first.text + "  " + _last.text,
        'uid': i
      };
      id = _first.text + "" + _last.text;

      docRef = await FirebaseFirestore.instance
          .collection("UserData")
          .doc(i)
          .set(data)
          .then((value) => getid());
    }
  }

  getid() {
    dialog("", "Data Added");
    docIduser = i;
  }

  NotificationService() {
    fcm = FirebaseMessagingWeb(publicVapidKey: 'YourPublicVapidKey');

    fcm = FirebaseMessagingWeb();
    fcm.init('YourPublicVapidKey');

    /// Setup callback for whenever a notification is received.
    /// The app must be open inside the navigator for this callback to fire.
    fcm.onMessage((Map notificationData) {
      // do something with notification data
    });

    /// Whenever the token is refreshed,
    fcm.onTokenRefresh(() async {
      token = await fcm.getToken();
    });
  }

  int gender = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          height: 750,
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\nPersonal Information\n",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Profile For\n",
                              style: TextStyle(color: Colors.black),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                height: 35,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      profilfor,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    items: [
                                      "Self",
                                      "Parent / Guardian",
                                      "Sibling",
                                      "Friend",
                                      "Other"
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
                                        profilfor = val;
                                      });
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nName\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                                height: 35,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          width: 200,
                                          child: TextField(
                                            controller: _first,
                                            decoration: InputDecoration(
                                                hintText: "First",
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                contentPadding:
                                                    EdgeInsets.only(left: 10)),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            child: TextField(
                                          controller: _last,
                                          decoration: InputDecoration(
                                              hintText: "Last",
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              contentPadding:
                                                  EdgeInsets.only(left: 10)),
                                        ))),
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nGender",
                                style: TextStyle(color: Colors.black)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: gender,
                                    onChanged: (val) {
                                      setState(() {
                                        gender = val;
                                      });
                                    }),
                                Text("Male",
                                    style: TextStyle(color: Colors.black)),
                                Radio(
                                    value: 2,
                                    groupValue: gender,
                                    onChanged: (val) {
                                      setState(() {
                                        gender = val;
                                      });
                                    }),
                                Text("Female",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\n Date of Birth\n",
                                style: TextStyle(color: Colors.black)),
                            Row(
                              children: [
                                Container(
                                    width: 70,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text(
                                          date,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        isExpanded: true,
                                        iconSize: 20.0,
                                        items: [
                                          "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          "10",
                                          "11",
                                          "12",
                                          "13",
                                          "14",
                                          "15",
                                          "16",
                                          "17",
                                          "18",
                                          "19",
                                          "20",
                                          "21",
                                          "22",
                                          "23",
                                          "24",
                                          "25",
                                          "26",
                                          "27",
                                          "28",
                                          "29",
                                          "30",
                                          "31"
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
                                            date = val;
                                          });
                                        },
                                      ),
                                    )),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                    width: 70,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text(
                                          month,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        isExpanded: true,
                                        iconSize: 20.0,
                                        items: [
                                          "01",
                                          "02",
                                          "03",
                                          "04",
                                          "25",
                                          "06",
                                          "07",
                                          "08",
                                          "09",
                                          "10",
                                          "11",
                                          "12"
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
                                            month = val;
                                          });
                                        },
                                      ),
                                    )),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 70,
                                  height: 30,
                                  child: TextField(
                                    controller: _yr,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 5, left: 5),
                                        hintText: "YY",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nMobile No\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 35,
                              child: TextField(
                                controller: _mobile,
                                decoration: InputDecoration(
                                    hintText: "Mobile No",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nEmail\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 35,
                              child: TextField(
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: "Mobile No",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nLogin Password\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 35,
                              child: TextField(
                                controller: _pass,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Login password",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 70,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mother Tongue\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                height: 35,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      mother,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    items: [
                                      "Hindi",
                                      "Marathi",
                                      "Punjabi",
                                      "Bengali",
                                      "Gujrati",
                                      "Urdu",
                                      "Telugu",
                                      "Kannada",
                                      "English",
                                      "Tamil",
                                      "Odia",
                                      "Marwari",
                                      "Aka",
                                      "Arabic",
                                      "Arunachali",
                                      "Assamese",
                                      "Awadhi",
                                      "Baluchi",
                                      "Bengali",
                                      "Bhojpuri",
                                      "Bhutia",
                                      "Brahui",
                                      "Brij",
                                      "Burmese",
                                      "Chattisgarhi",
                                      "Chinese",
                                      "Coorgi",
                                      "Dogi",
                                      "English",
                                      "French",
                                      "Garhwali",
                                      "Garo",
                                      "Gujrati",
                                      "Haryanavi",
                                      "Himachali",
                                      "Hindi",
                                      "Hindko",
                                      "Kakbarak",
                                      "Kanauji",
                                      "Kannada",
                                      "Khandesi",
                                      "Khasi",
                                      "Konkani",
                                      "Koshali",
                                      "Kutchi",
                                      "Ladakhi",
                                      "Lepcha",
                                      "Magahi",
                                      "Marathi",
                                      "Marwari",
                                      "Mizo",
                                      "Monpa",
                                      "Nepali",
                                      "Odia",
                                      "Tamil",
                                      "Teluhu",
                                      "Sindhi",
                                      "punjabi"
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
                                        mother = val;
                                      });
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nReligion\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                height: 35,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      religion,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    items: [
                                      "Hindu",
                                      "Muslim",
                                      "christrian",
                                      'Parsi',
                                      "Jain",
                                      "Buddhist",
                                      "Jewish",
                                      "No Religion",
                                      "Spritual",
                                      "Other"
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
                                        religion = val;
                                      });
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nMarital Status\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                height: 35,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      marital,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    isExpanded: true,
                                    iconSize: 20.0,
                                    items: [
                                      "Never Married",
                                      "Divorced",
                                      "Awaiting Divorce"
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
                                        marital = val;
                                      });
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nCommunity\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 35,
                              child: TextField(
                                controller: _community,
                                decoration: InputDecoration(
                                    hintText: "Community",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nSubcommunity\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 35,
                              child: TextField(
                                controller: _subcom,
                                decoration: InputDecoration(
                                    hintText: "Subcommunity",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("\nAbout\n",
                                style: TextStyle(color: Colors.black)),
                            Container(
                              height: 75,
                              child: TextField(
                                controller: _about,
                                maxLines: 7,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    contentPadding:
                                        EdgeInsets.only(left: 10, top: 20)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FlatButton(
                              onPressed: () {
                                NotificationService();
                                Savedata();
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ))
                ],
              ))
            ],
          )),
    ));
  }
}
