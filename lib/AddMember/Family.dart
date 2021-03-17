import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase/firebase.dart' as f1;
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:shaddiadmin/Theme.dart';

class Family extends StatefulWidget {
  Family1 createState() => Family1();
}

class Family1 extends State<Family> {
  String fs = "--Choose Father's Status--",
      ms = "--Choose Mother's Status--",
      sisters = "--Choose No of Sisters--",
      brothers = "--Choose No of Brothers--";
  var filePath;
  Image image;
  File file;
  String url1;
  check() {
    if (fs == "--Choose Father's Status--" ||
        ms == "--Choose Mother's Status--" ||
        sisters == "--Choose No of Sisters--" ||
        brothers == "--Choose No of Brothers--") {
      dialog("Alert", "Fill all required details");
    } else {
      saveuser();
    }
  }

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

  saveuser() {
    Map<String, dynamic> data = {
      "fatherStatus": fs,
      "motherStatus": ms,
      "noOfBrothers": brothers,
      "noOfSisters": sisters,
      "userImage": "",
      'familyInfluence': 'Not Specified',
      'familyValue': 'Not Specified',
      'gothra': 'NotSpecified',
      'grewUpIn': 'Not Specified',
      'nativePlace': 'Not Specified',
      'partnerAge': 'Not Specified',
      'partnerAnnualIncome': 'Not Specified',
      'partnerCity': 'Not Specified',
      'partnerCountry': 'Not Specified',
      'partnerDiet': 'Not Specified',
      'partnerHeight': 'Not Specified',
      'partnerMaritalStatus': "Not Specified",
      'partnerProfessionalArea': "Not Specified",
      'partnerProfileCreatedBy': 'Not Specified',
      'partnerQualification': 'Not Specified',
      'partnerReligion': 'Not Specified',
      'partnerState': 'Not Specified',
      'partnerWorkAs': 'Not Specified',
      'partnerWorkWith': 'Not Specified',
      'photoApproval': 'Not Specified',
      'residencyStatus': 'Not Specified',
      'state': 'Not Specified',
      'subscription': 'Not Specified',
      'timeOfBirth': 'Not Specified',
      'uid': docIduser,
      'online':'0'
    };
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(docIduser)
        .update(data);
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
    DateTime s = DateTime.now();
    var a = s.day + s.month + s.year + s.hour + s.minute;
    filePath = "/profileImage.png";
    setState(() {
      _uploadTask = f1
          .storage()
          .refFromURL('gs://matrimonial-1c9e5.appspot.com/UserImage/pratima')
          .child(filePath.trim())
          .put(imageFile);
    });
  }

  getimage(String filePath) {
    setState(() {
      var dowurl = FirebaseStorage.instance
          .refFromURL('gs://matrimonial-1c9e5.appspot.com/UserImage/pratima')
          .child(filePath.trim())
          .getDownloadURL()
          .then((value) => {url1 = value, addimage(value.toString())});
    });
  }

  addimage(String v) {
    Map<String, dynamic> map = {"userImage": v};
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(docIduser)
        .update(map);
  }

  @override
  Widget build(BuildContext context) {
    dialog(String b) {
      AlertDialog dialog = AlertDialog(
        actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
        contentPadding: EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        content: Text("\n" + b),
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

    savedata() {
      if (fs == "--Choose Father's Status--" ||
          ms == "--Choose Mother's Status--" ||
          sisters == "--Choose No of Sisters--" ||
          brothers == "--Choose No of Brothers--") {
        dialog("Fill all details");
      } else {
        saveuser();
      }
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Family Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("\n\nFather's Status\n",
                          style: TextStyle(color: Colors.black)),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 35,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                fs,
                              ),
                              isExpanded: true,
                              iconSize: 20.0,
                              style: TextStyle(color: Colors.black),
                              items: [
                                'Employed',
                                "Business",
                                "Retired",
                                "Not Employed",
                                "Passed Away"
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
                                  fs = val;
                                });
                              },
                            ),
                          )),
                      Text("\n\nMother's Status\n",
                          style: TextStyle(color: Colors.black)),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 35,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                ms,
                              ),
                              isExpanded: true,
                              iconSize: 20.0,
                              style: TextStyle(color: Colors.black),
                              items: [
                                "Homemaker",
                                "Employed",
                                "Business",
                                "Retired",
                                "Passed  Away"
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
                                  ms = val;
                                });
                              },
                            ),
                          )),
                    ],
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text("\n\nNo of Brothers\n",
                            style: TextStyle(color: Colors.black)),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            height: 35,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  brothers,
                                ),
                                isExpanded: true,
                                iconSize: 20.0,
                                style: TextStyle(color: Colors.black),
                                items: ["0", "1", "2", "3", "4", "5"].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    brothers = val;
                                  });
                                },
                              ),
                            )),
                        Text("\n\nNo of Sisters\n",
                            style: TextStyle(color: Colors.black)),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            height: 35,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  sisters,
                                ),
                                isExpanded: true,
                                iconSize: 20.0,
                                style: TextStyle(color: Colors.black),
                                items: ["0", "1", "2", "3", "4", "5"].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    sisters = val;
                                  });
                                },
                              ),
                            )),
                      ],
                    ),
                  ))
                ],
              ),
            )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile Photo\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                  child: url1 != null
                                      ? Image(image: NetworkImage(url1))
                                      : Text("No data")),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FlatButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                color: Colors.red,
                                minWidth: 110,
                                child: Text(
                                  "Choose File",
                                  style: TextStyle(color: Colors.white),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                                onPressed: () {
                                  check();
                                  getimage(filePath);
                                  saveuser();
                                },
                                color: Colors.blue,
                                minWidth: 110,
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        )),
                        Expanded(child: Container())
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
