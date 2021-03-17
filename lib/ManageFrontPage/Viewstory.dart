import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageAddPage/Addstory.dart';
import 'package:shaddiadmin/ManageFrontPage/Stories.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Viewstory extends StatefulWidget {
  String name, story, photo;
  Viewstory({this.name, this.story, this.photo});
  Viewstory1 createState() => Viewstory1();
}

class Viewstory1 extends State<Viewstory> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(width: 270, child: Navigation()),
            Expanded(
                child: Container(
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
                            "Success Stories",
                            style: TextStyle(fontSize: 25),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 35,
                              width: 170,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.black),
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
                          padding: EdgeInsets.only(left: 50, top: 50),
                          margin:
                              EdgeInsets.only(left: 30, right: 20, bottom: 20),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey)),
                                      width: 500,
                                      height: 300,
                                      child: Image(
                                        image: NetworkImage(widget.photo),
                                        fit: BoxFit.fill,
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: Container(
                                    margin: EdgeInsets.only(right: 50),
                                    child: Text(
                                      widget.story,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ))
                                ],
                              ),
                            ],
                          )))
                ],
              ),
            )),
          ],
        ));
  }
}
