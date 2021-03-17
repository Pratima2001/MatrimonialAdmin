import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shaddiadmin/AddMember/Family&Edudetails.dart';
import 'package:shaddiadmin/AddMember/Family.dart';
import 'package:shaddiadmin/AddMember/Package.dart';
import 'package:shaddiadmin/AddMember/PersonalDetails.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

class Addmember extends StatefulWidget {
  Addmember1 createState() => Addmember1();
}

class Addmember1 extends State<Addmember> with SingleTickerProviderStateMixin {
  TabController _controller;
  Color c = Colors.blueAccent;

  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
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
                  margin: EdgeInsets.only(top: 0, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                height: 70,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 500,
                                      child: TabBar(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          isScrollable: false,
                                          controller: _controller,
                                          labelColor: Colors.blue,
                                          labelStyle: TextStyle(fontSize: 17),
                                          unselectedLabelColor: Colors.black,
                                          tabs: [
                                            Container(
                                              child: Tab(
                                                text: "Personal Info",
                                              ),
                                            ),
                                            Container(
                                                child: Tab(
                                              text: "Education Details",
                                            )),
                                            Container(
                                              color: _controller.index == 2
                                                  ? c
                                                  : Colors.white,
                                              child: Tab(
                                                text: "Family Info",
                                              ),
                                            ),
                                          ]),
                                    )
                                  ],
                                )),
                            Expanded(
                                child: TabBarView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: _controller,
                                    children: [
                                  Personal(),
                                  FamilyandEdu(),
                                  Family(),
                                ]))
                          ],
                        ),
                      ))
                    ],
                  )))
        ],
      ),
    );
  }
}

class Religion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("religion"),
      ),
    );
  }
}
