import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageFrontPage/DepartmentList.dart';
import 'package:shaddiadmin/ManageFrontPage/Earning.dart';
import 'package:shaddiadmin/ManageFrontPage/FeaturedMembers.dart';
import 'package:shaddiadmin/ManageFrontPage/Members.dart';
import 'package:shaddiadmin/ManageFrontPage/MembersApproval.dart';
import 'package:shaddiadmin/ManageFrontPage/MessageMainScreen.dart';
import 'package:shaddiadmin/ManageFrontPage/Orders.dart';
import 'package:shaddiadmin/ManageFrontPage/PhotoApproval.dart';
import 'package:shaddiadmin/ManageFrontPage/Premiumplans.dart';
import 'package:shaddiadmin/ManageFrontPage/Stories.dart';
import 'package:shaddiadmin/ManageFrontPage/UsersList.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/dash.dart';
import 'package:shaddiadmin/ui/collapsing_list_tile.dart';

class Navigation extends StatefulWidget {
  Navigation1 createState() => Navigation1();
}

class Navigation1 extends State<Navigation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  void initState() {
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Color(0xff050A30),
        width: 270,
        height: 900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 270,
              color: Colors.blue,
              padding: EdgeInsets.only(left: 30),
              height: 70,
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "$username",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "GENERAL",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Dash1()));
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.dashboard,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Dashboard",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MEMBERS",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 250,
                      child: ExpansionTile(
                        trailing: Icon(Icons.keyboard_arrow_down_outlined,
                            color: Colors.white),
                        leading: Icon(
                          Icons.group,
                          color: Colors.white,
                        ),
                        childrenPadding: EdgeInsets.only(left: 65),
                        expandedAlignment: Alignment.topLeft,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Member()));
                                },
                                child: Text(
                                  "\nMembers\n",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Featuredmembers()));
                                  },
                                  child: Text("Featured Members\n",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15))),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MembersApproval()));
                                },
                                child: Text("Members Approval\n",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15)),
                              ),
                              GestureDetector(
                                child: Text("Photos\n",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15)),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Photoapp()));
                                },
                              )
                            ],
                          )
                        ],
                        title: Text(
                          "Members",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Premiumplan()));
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.next_plan_sharp,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Membership Plans",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Orders()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.offline_pin_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Orders",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "DEPARTMENT",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 250,
                      child: ExpansionTile(
                        trailing: Icon(Icons.keyboard_arrow_down_outlined,
                            color: Colors.white),
                        leading: Icon(
                          Icons.group,
                          color: Colors.white,
                        ),
                        childrenPadding: EdgeInsets.only(left: 65),
                        expandedAlignment: Alignment.topLeft,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Text(
                                  "\nDepartment\n",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DepartmentList()));
                                },
                              ),
                              GestureDetector(
                                child: Text("Users\n",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16)),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UserList()));
                                },
                              )
                            ],
                          )
                        ],
                        title: Text(
                          "Department",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "EARNING",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Earning()));
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Earning",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "SUCCESS STORIES",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Stories()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.approval,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Success Stories",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "VIDEOS",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Stories()));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Testimonial Videos",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
