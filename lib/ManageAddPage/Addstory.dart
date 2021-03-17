import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/AddMember/Api.dart';
import 'package:shaddiadmin/ManageFrontPage/Stories.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:firebase/firebase.dart' as f1;
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart' as fb;

class Addstory extends StatefulWidget {
  Addstory1 createState() => Addstory1();
}

class Addstory1 extends State<Addstory> {
  String day = "DD", month = "MM";
  var filePath;
  Image image;
  File file;
  String id, id1;
  String url;

  TextEditingController _male = TextEditingController(),
      _female = TextEditingController(),
      _yourMatriId = TextEditingController(),
      _partnerId = TextEditingController(),
      _email = TextEditingController(),
      _story = TextEditingController(),
      _yr = TextEditingController();

  publishstory() {
    if (_male.text == "" ||
        _female.text == "" ||
        _yourMatriId.text == "" ||
        _partnerId.text == "" ||
        _email.text == "" ||
        _story.text == "" ||
        url == null) {
      dialog("Alert", "Fill all required details");
    } else {
      savedata();
    }
  }

  savedata() async {
    String id = _male.text + "-" + _female.text;
    Map<String, dynamic> map = {
      "femaleName": _female.text,
      "maleName": _male.text,
      "yourId": _yourMatriId.text,
      "partnerId": _partnerId.text,
      "email": _email.text,
      "story": _story.text,
      "date": day + "-" + month + "-" + _yr.text,
      "image": url,
      "userId": id,
      "publish": true,
      "year": _yr.text
    };
    FirebaseFirestore.instance
        .collection("SuccessStories")
        .doc(id)
        .set(map)
        .then((value) => dialog("", "Information Added Successfully"));
  }

  dialog(String a, String b) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        top: 15,
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
              " Ok ",
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

  uploadImage() async {
    // HTML input element
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        file = uploadInput.files.first;
        final reader = FileReader();

        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen(
          (loadEndEvent) async {
            uploadToFirebase(file);
          },
        );
      },
    );
  }

  f1.UploadTask _uploadTask;

  uploadToFirebase(File imageFile) async {
    String iduser = id + "-" + id1;
    DateTime s = DateTime.now();
    var a = s.day + s.month + s.year + s.hour + s.minute;
    filePath = "$iduser.png";
    setState(() {
      _uploadTask = f1
          .storage()
          .refFromURL('gs://matrimonial-1c9e5.appspot.com/SuccessStories/')
          .child(filePath.trim())
          .put(imageFile);
    });
  }

  getimage(String filePath) {
    var dowurl = FirebaseStorage.instance
        .refFromURL('gs://matrimonial-1c9e5.appspot.com/SuccessStories/')
        .child(filePath.trim())
        .getDownloadURL()
        .then((value) => {
              url = value,
              if (url != null) {savedata()}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          Container(width: 270, child: Navigation()),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 1000,
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
                                "Add Success Story\n",
                                style: TextStyle(fontSize: 25),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 35,
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlatButton(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          color: Colors.white,
                                          minWidth: 150,
                                          height: 70,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Stories()));
                                          },
                                          child: Text("Success Stories List"))
                                    ],
                                  ))
                            ],
                          )),
                      Expanded(
                          child: Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 20, bottom: 20),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 100, top: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Bride Name (Female)',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Groom Name (Male)',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Your Matrimony Id',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: "Partner's Matrimony Id",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'E-mail',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Marriage Date',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Upload Photo',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 110,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Success Story',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: '*',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ])),
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(right: 200, top: 35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 35,
                                          child: TextField(
                                            controller: _female,
                                            decoration: InputDecoration(
                                                hintText: "Bride Name(Female)",
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                          height: 35,
                                          child: TextField(
                                            controller: _male,
                                            decoration: InputDecoration(
                                                hintText: "Groom Name(Male)",
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                          height: 35,
                                          child: TextField(
                                            onChanged: (val) {
                                              id = val;
                                            },
                                            controller: _yourMatriId,
                                            decoration: InputDecoration(
                                                hintText: "Matrimoney Id",
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                          height: 35,
                                          child: TextField(
                                            onChanged: (val) {
                                              id1 = val;
                                            },
                                            controller: _partnerId,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Partner Matrimoney Id",
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                          height: 35,
                                          child: TextField(
                                            controller: _email,
                                            decoration: InputDecoration(
                                                hintText: "Email",
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              padding: EdgeInsets.only(left: 5),
                                              width: 80,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                hint: Text(day),
                                                isExpanded: true,
                                                iconSize: 20.0,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                items: [
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4',
                                                  '5',
                                                  '6',
                                                  '7',
                                                  '8',
                                                  '9',
                                                  '11',
                                                  '12',
                                                  '13',
                                                  '14',
                                                  '15',
                                                  '16',
                                                  '17',
                                                  '18',
                                                  '19',
                                                  '20',
                                                  '21',
                                                  '22',
                                                  '22',
                                                  '23',
                                                  '24',
                                                  '25',
                                                  '26',
                                                  '27',
                                                  '28',
                                                  '29',
                                                  '30',
                                                  '31'
                                                ].map(
                                                  (val) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: val,
                                                      child: Text(val),
                                                    );
                                                  },
                                                ).toList(),
                                                onChanged: (val) {
                                                  setState(() {
                                                    day = val.toString();
                                                  });
                                                },
                                              )),
                                            ),
                                            Container(
                                              width: 80,
                                              padding: EdgeInsets.only(left: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                      child: DropdownButton(
                                                hint: Text(month),
                                                isExpanded: true,
                                                iconSize: 20.0,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                items: [
                                                  'January',
                                                  'February',
                                                  'March',
                                                  'April',
                                                  'May',
                                                  'June',
                                                  'July',
                                                  'August',
                                                  'September',
                                                  'Octomber',
                                                  'November',
                                                  'December'
                                                ].map(
                                                  (val) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: val,
                                                      child: Text(val),
                                                    );
                                                  },
                                                ).toList(),
                                                onChanged: (val) {
                                                  setState(() {
                                                    month = val.toString();
                                                  });
                                                },
                                              )),
                                            ),
                                            Container(
                                                width: 80,
                                                child: TextField(
                                                  controller: _yr,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey))),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            uploadImage();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            height: 100,
                                            width: 100,
                                            child: Center(
                                              child: Text("Choose Photo"),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 100,
                                        child: TextField(
                                          controller: _story,
                                          maxLines: 7,
                                          decoration: InputDecoration(
                                              hintText: "Add a story...",
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none)),
                                        ),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FlatButton(
                                          onPressed: () {
                                            getimage(filePath);
                                          },
                                          color: Colors.blue,
                                          minWidth: 150,
                                          child: Text(
                                            "Publish",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
