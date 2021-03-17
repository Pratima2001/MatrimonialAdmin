import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageFrontPage/DepartmentList.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Adddepartment extends StatefulWidget {
  Adddepartment1 createState() => Adddepartment1();
}

class Adddepartment1 extends State<Adddepartment> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  adddepart() async {
    Map<String, dynamic> m = {"departName": name.text};
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(name.text)
        .set(m)
        .then((value) => null);
    setpermission();
  }

  setpermission() async {
    Map<String, dynamic> map = {
      "list": false,
      "add": false,
      "update": false,
      "delete": false,
      "field": "members"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(name.text)
        .collection("Permissions")
        .doc("members")
        .set(map);

    Map<String, dynamic> plans = {
      "list": false,
      "add": false,
      "update": false,
      "delete": false,
      "field": "membersPlan"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(name.text)
        .collection("Permissions")
        .doc("membersPlan")
        .set(plans);
    Map<String, dynamic> department = {
      "list": false,
      "add": false,
      "update": false,
      "delete": false,
      "field": "department"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(name.text)
        .collection("Permissions")
        .doc("department")
        .set(department);
    Map<String, dynamic> users = {
      "list": false,
      "add": false,
      "update": false,
      "delete": false,
      "field": "users"
    };
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(name.text)
        .collection("Permissions")
        .doc("users")
        .set(users);

    name.clear();
    showdialog();
  }

  showdialog() {
    Dialog success = Dialog(
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(10),
        width: 200,
        child: Center(
          child: Text("Department added Sucessfully!",
              style: TextStyle(fontSize: 17)),
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
                      'Department Setup',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DepartmentList()));
                        },
                        child: Text(
                          "Department List",
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
              Container(
                  height: 250,
                  margin:
                      EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 50),
                  child: Container(
                      padding: EdgeInsets.only(top: 70),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Department Name',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ])),
                              ),
                              SizedBox(
                                width: 210,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 100, left: 50),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[200])),
                                  child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: name,
                                        decoration: InputDecoration(
                                            hintText: "\nName",
                                            contentPadding:
                                                EdgeInsets.only(left: 10),
                                            border: OutlineInputBorder()),
                                      )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Add Department",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  adddepart();
                                }),
                            padding: EdgeInsets.only(),
                          )
                        ],
                      )))
            ])))
          ],
        ));
  }
}
