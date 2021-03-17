import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/Navigationdrawer.dart';

import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class EditProfile extends StatefulWidget {
  String profile;
  String id,
      profilefor,
      about,
      age,
      religion,
      mothertongue,
      disablity,
      as,
      birth,
      city,
      college,
      community,
      username,
      email,
      gender,
      password,
      first,
      country,
      state,
      weight,
      lastname,
      marital,
      height,
      mobile,
      bloodgrp;

  EditProfile(
      {this.id,
      this.profile,
      this.username,
      this.first,
      this.lastname,
      this.email,
      this.profilefor,
      this.password,
      this.mobile,
      this.marital,
      this.gender,
      this.disablity,
      this.height,
      this.bloodgrp,
      this.about,
      this.religion,
      this.community,
      this.mothertongue,
      this.country,
      this.state,
      this.weight});

  Editprofile1 createState() => Editprofile1(id);
}

class Editprofile1 extends State<EditProfile>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  String id,
      marital1,
      disability,
      ma,
      profilefor1,
      height,
      bloodgp,
      gender1,
      mothert,
      rel;

  TabController _controller;

  int _value = 1;
  TextEditingController _userid,
      about,
      username,
      profile,
      password,
      mobile,
      country,
      marital,
      state,
      weight,
      firstname,
      lastname,
      email,
      comm;
  void initState() {
    super.initState();
    _controller = TabController(length: 1, vsync: this);
    _userid = TextEditingController(text: widget.id);
    password = TextEditingController(text: widget.password);
    mobile = TextEditingController(text: widget.mobile);
    firstname = TextEditingController(text: widget.first);
    lastname = TextEditingController(text: widget.lastname);
    email = TextEditingController(text: widget.email);
    about = TextEditingController(text: widget.about);
    comm = TextEditingController(text: widget.community);
    country = TextEditingController(text: widget.country);
    state = TextEditingController(text: widget.state);
    weight = TextEditingController(text: widget.weight);
  }

  Editprofile1(String id) {
    this.id = id;
  }
  update() async {
    if (gender1 == null) {
      gender1 = widget.gender;
    }
    if (disability == null) {
      disability = widget.disablity;
    }
    if (marital1 == null) {
      marital1 = widget.marital;
    }
    if (profilefor1 == null) {
      profilefor1 = widget.profilefor;
    }
    if (rel == null) {
      rel = widget.religion;
    }
    if (mothert == null) {
      mothert = widget.mothertongue;
    }
    if (height == null) {
      height = widget.height;
    }
    if (bloodgp == null) {
      bloodgp = widget.bloodgrp;
    }
    Map<String, dynamic> m = {
      "userId": _userid.text,
      "firstName": firstname.text,
      "lastName": lastname.text,
      "email": email.text,
      "mobileNo": mobile.text,
      "country": country.text,
      "state": state.text,
      "aboutYou": about.text,
      "gender": gender1,
      "anyDisablity": disability,
      "maritalStatus": marital1,
      "profileFor": profilefor1,
      "religion": rel,
      "community": comm.text,
      "motherTongue": mothert,
      "bodyWeight": weight.text,
      "height": height,
      "bloodGroup": bloodgp
    };
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(widget.id)
        .update(m);
  }

  @override
  Widget build(BuildContext context) {
    List g = ["Male", "Female"];

    String profile = widget.profilefor, a = "5ft 7in", bloodgrp = "Select";
    String birthdate = "1993-01-31 00:00:00.000";
    DateTime _dateTime = DateTime.now();
    return Scaffold(
      body: Row(
        children: [
          Container(width: 270, child: Navigation()),
          Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 0, top: 30),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 15),
                        margin: EdgeInsets.only(top: 15),
                        width: 750,
                        height: MediaQuery.of(context).size.height - 50,
                        child: Scrollbar(
                            controller: scrollController,
                            isAlwaysShown: true,
                            child: Center(
                                child: ListView(
                              controller: scrollController,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(0),
                                  height: 1200,
                                  width: 500,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 95,
                                            backgroundImage:
                                                NetworkImage(widget.profile),
                                          ),
                                          Text(
                                            widget.id,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Developer",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 150,
                                            child: RaisedButton(
                                              onPressed: () {},
                                              color: Colors.green,
                                              child: Text(
                                                "Approve",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 150,
                                            child: RaisedButton(
                                              onPressed: () {},
                                              color: Colors.blueAccent,
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: 3000,
                                        padding: EdgeInsets.only(
                                            left: 10, right: 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Account Information\n",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "User Id",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                      height: 25,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                      ),
                                                      child: TextField(
                                                        controller: _userid,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: widget.id,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "First Name",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 200,
                                                    child: TextField(
                                                      controller: firstname,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: widget.first,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Last Name",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 200,
                                                    child: TextField(
                                                      controller: lastname,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            widget.lastname,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Email",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 200,
                                                    child: TextField(
                                                      controller: email,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: widget.email,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Password",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                      height: 25,
                                                      width: 200,
                                                      padding: EdgeInsets.zero,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                      ),
                                                      child: TextField(
                                                        enabled: false,
                                                        obscureText: true,
                                                        controller: password,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              widget.password,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Mobile No",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 200,
                                                    child: TextField(
                                                      controller: mobile,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: widget.mobile,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "\nAbout",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Container(
                                              height: 100,
                                              child: TextField(
                                                maxLines: 5,
                                                controller: about,
                                                decoration: InputDecoration(
                                                    border:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText: widget.about),
                                              ),
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("\nCountry\n",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    Container(
                                                        height: 25,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: TextField(
                                                          controller: country,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "",
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("\nState\n",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    Container(
                                                        width: 120,
                                                        height: 25,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: TextField(
                                                          controller: state,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText: "",
                                                          ),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\nGender",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  width: 150,
                                                  height: 30,
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    hint: gender1 == null
                                                        ? Text(
                                                            widget.gender,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(gender1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                    isExpanded: true,
                                                    iconSize: 20.0,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    items:
                                                        ['Male', 'Female'].map(
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
                                                        gender1 =
                                                            val.toString();
                                                      });
                                                    },
                                                  )),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\nBirth Date",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  "\n" + birthdate,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\nAny Disability",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  width: 150,
                                                  height: 30,
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    hint: disability == null
                                                        ? Text(
                                                            widget.disablity,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(disability,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                    isExpanded: true,
                                                    iconSize: 20.0,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    items: [
                                                      'Select',
                                                      'No Health Problems',
                                                      'HIV Positive',
                                                      'Diabetes',
                                                      'Low BP',
                                                      'High Bp',
                                                      'Health Aliments',
                                                      'Other'
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
                                                        disability =
                                                            val.toString();
                                                      });
                                                    },
                                                  )),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\nMarital Status",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  width: 150,
                                                  height: 30,
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    hint: marital1 == null
                                                        ? Text(
                                                            widget.marital,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(marital1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                    isExpanded: true,
                                                    iconSize: 20.0,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    items: [
                                                      'Never Married',
                                                      'Divorced',
                                                      'Awaiting Divorced'
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
                                                        marital1 =
                                                            val.toString();
                                                        print(marital1);
                                                      });
                                                    },
                                                  )),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\nProfile Created By",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  width: 150,
                                                  height: 30,
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                    hint: profilefor1 == null
                                                        ? Text(
                                                            widget.profilefor,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : Text(profilefor1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                    isExpanded: true,
                                                    iconSize: 20.0,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    items: [
                                                      'Self',
                                                      'Parent / Guardian',
                                                      'Sibling',
                                                      'Friend',
                                                      'Other'
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
                                                        profilefor1 =
                                                            val.toString();
                                                      });
                                                    },
                                                  )),
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: 350,
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Religion",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 150,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton(
                                                      hint: rel == null
                                                          ? Text(
                                                              widget.religion,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          : Text(rel,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                      isExpanded: true,
                                                      iconSize: 20.0,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      items: [
                                                        'Hindu',
                                                        'Muslim',
                                                        'Christian',
                                                        'Sikh',
                                                        'Parsi',
                                                        'Jain',
                                                        'Buddhist',
                                                        'Jewish',
                                                        'No Religion',
                                                        'Spiritual'
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
                                                          rel = val.toString();
                                                        });
                                                      },
                                                    )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Community",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                      height: 25,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                      ),
                                                      child: TextField(
                                                        controller: comm,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              widget.community,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Mother Tongue",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 150,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton(
                                                      hint: mothert == null
                                                          ? Text(
                                                              widget
                                                                  .mothertongue,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          : Text(mothert,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                      isExpanded: true,
                                                      iconSize: 20.0,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      items: [
                                                        'Hindi',
                                                        'Marathi',
                                                        'Pungabi',
                                                        'Bengali',
                                                        'Gugrati',
                                                        'Urdu',
                                                        'Telgu',
                                                        'Kannada',
                                                        'English',
                                                        'Tamil',
                                                        'Odia',
                                                        'Marwari',
                                                        'Aka',
                                                        'Arabic',
                                                        'Arunachali',
                                                        'Assamese',
                                                        'Awadhi',
                                                        'Baluchi',
                                                        'Bengali',
                                                        'Bhojpuri'
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
                                                          mothert =
                                                              val.toString();
                                                        });
                                                      },
                                                    )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("\nWeight\n",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    Container(
                                                        height: 30,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: TextField(
                                                            controller: weight,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number))
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("\nHeight",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 20),
                                                      width: 100,
                                                      height: 30,
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                        hint: height == null
                                                            ? Text(
                                                                widget.height,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            : Text(height,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                        isExpanded: true,
                                                        iconSize: 20.0,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        items: [
                                                          '5ft 7in',
                                                          '5ft 8in',
                                                          '5ft 9in',
                                                          '5ft 10in',
                                                          '5ft 11in',
                                                          '6ft',
                                                          '6ft 1in',
                                                          '6ft 2in',
                                                          '6ft 3in',
                                                          '6ft 4in',
                                                          '6ft 5in',
                                                          '6ft 7in',
                                                          '6ft 8in',
                                                          '6ft 9in',
                                                          '6ft 10in',
                                                          '6ft 11in',
                                                          '7ft'
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
                                                            height =
                                                                val.toString();
                                                          });
                                                        },
                                                      )),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("\nBlood Grp\n",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    Container(
                                                        width: 120,
                                                        height: 30,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            isExpanded: true,
                                                            hint:
                                                                bloodgp == null
                                                                    ? Text(
                                                                        widget
                                                                            .bloodgrp,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      )
                                                                    : Text(
                                                                        bloodgp,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                            onChanged: (String
                                                                newValue) {
                                                              setState(() {
                                                                bloodgp =
                                                                    newValue;
                                                              });
                                                            },
                                                            items: <String>[
                                                              'Select',
                                                              "Don't know",
                                                              'A+',
                                                              'A-',
                                                              'B+',
                                                              'B-',
                                                              'AB+',
                                                              'AB-',
                                                              'O+',
                                                              'O-'
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                ),
                                                RaisedButton(
                                                  onPressed: () {
                                                    update();
                                                  },
                                                  color: Colors.blue,
                                                  child: Text(
                                                    "Update",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            )))),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
