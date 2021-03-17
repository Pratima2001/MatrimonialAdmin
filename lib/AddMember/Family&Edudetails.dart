import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/Theme.dart';

class FamilyandEdu extends StatefulWidget {
  FamilyandEdu1 createState() => FamilyandEdu1();
}

class FamilyandEdu1 extends State {
  String education = "---Choose Education---",
      workingwith = "Select",
      height = "--Choose Height--",
      dis = "None",
      diet = "--Choose Diet--",
      health = "No Health Problems",
      blood = "--Choose Blood group--",
      pro = "---Choose Profession---";
  TextEditingController _college = TextEditingController(),
      _employee = TextEditingController(),
      _weight = TextEditingController();

  setdetails() {
    if (education == "---Choose Education---" ||
        workingwith == "Select" ||
        pro == "---Choose Profession---" ||
        _employee.text == "" ||
        height == "--Choose Height--" ||
        _weight.text == "" ||
        blood == "--Choose Blood group--" ||
        diet == "--Choose Diet--") {
      dialog("\nFill all required details");
    } else {
      adddata();
    }
  }

  dialog(String b) {
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 10, right: 10, top: 10),
      contentPadding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
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

  adddata() {
    Map<String, dynamic> map = {
      "highestQualification": education,
      "collegeAttended": _college.text,
      "worksWith": workingwith,
      "as": pro,
      "employeeName": _employee.text,
      "height": height,
      "bodyWeight": _weight.text,
      "anyDisablity": dis,
      "healthInformation": health,
      "bloodGroup": blood,
      "diet": diet
    };
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(docIduser)
        .update(map)
        .then((value) => dialog("\nInformation Added Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 800,
        child: Column(
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\nEducation Information",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("\n\nHighest Qualification\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        education,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "B.E / B.Tech",
                                        "M.E / M.Tech",
                                        "M.S Engineering",
                                        "B.Eng",
                                        'M.Eng',
                                        "Engineering Diploma",
                                        "AE",
                                        "AET",
                                        "B.A",
                                        "B.Ed",
                                        'BJMC',
                                        "BFA",
                                        "B.Arch",
                                        "B.Des",
                                        "BMM",
                                        "MFA",
                                        "M.A",
                                        "M.Ed",
                                        "MSW",
                                        "MJMC",
                                        ",M.DES",
                                        'BA',
                                        'B.Arch',
                                        "AA",
                                        "AFA",
                                        "DFA",
                                        "D.Ed",
                                        "D.Arch",
                                        "B.Com",
                                        "CA / CPA",
                                        "CFA",
                                        "CS",
                                        "BSC",
                                        "M.Com",
                                        "MSC / MFin / MS",
                                        "BCom",
                                        "BCA",
                                        "BSC",
                                        "BA Computer Science",
                                        "MCA",
                                        "PGDCA",
                                        "IT Diploma",
                                        "ADIT",
                                        "B.Sc",
                                        "M.SC",
                                        "DipSc",
                                        "AS",
                                        "'AAS",
                                        "MBBS",
                                        "BDS",
                                        "BPT",
                                        "BAMS",
                                        "BHMS",
                                        "B.Pharma",
                                        "BVSC",
                                        "BSN",
                                        "MDS",
                                        "MCh",
                                        "M.D",
                                        "M.S Medicine",
                                        "MPT",
                                        "DM",
                                        "M.Pharma",
                                        "MVSc",
                                        "PGD Medicine",
                                        "BBA",
                                        "BHM",
                                        "BBM",
                                        "MBA",
                                        "PGDM",
                                        "ABA",
                                        "ADBus",
                                        "BL / LLB",
                                        'ML/ LLB',
                                        "ALA",
                                        "Ph.D",
                                        "M.Phil",
                                        "Bachelor",
                                        "Master",
                                        "Diploma",
                                        "Honours",
                                        "Doctorate",
                                        'Associate',
                                        "High School",
                                        "Less than high school"
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
                                          education = val;
                                        });
                                      },
                                    ),
                                  )),
                              Text("\n\nCollege Attended\n"),
                              Container(
                                height: 35,
                                child: TextField(
                                  controller: _college,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                ),
                              ),
                              Text("\n\nWorking With\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        workingwith,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "Private Company",
                                        "Government / Public Sector",
                                        "Defense / Civil Services",
                                        "Business / Self Employed",
                                        "Now Working"
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
                                          workingwith = val;
                                        });
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 28,
                                ),
                                Text("\n\n\nWorking As\n"),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    height: 35,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text(
                                          pro,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        isExpanded: true,
                                        iconSize: 20.0,
                                        items: [
                                          "Banking Professional",
                                          "Charted Accountatnt",
                                          "Company Secretary",
                                          "Finance Professional",
                                          "Investment Professional",
                                          "Accounting",
                                          "Admin",
                                          "Human Resources Professional",
                                          "Actor",
                                          "Advertisiing Professional",
                                          "Entertainment professional",
                                          "Event Manager",
                                          "Journalist",
                                          "Media professional",
                                          "Public relations professional",
                                          "Farming",
                                          "Horticulturist",
                                          "Agriculture Professional",
                                          "Airline",
                                          "Pilot / Co-Pilot",
                                          "Other Airline Professional",
                                          "Interior Designer",
                                          "Artist,Animators & Web Designers"
                                              "Commericial Artist",
                                          "Web/Ux Designers",
                                          "Beautician",
                                          "Fashion Designer",
                                          "Hairstylist",
                                          "Jewellery Designer",
                                          "Designer",
                                          "BPO,KPO 7 Customer Support",
                                          "IAS / IRS / IES /IFS",
                                          "IPS",
                                          "LAW Enforcement Employee",
                                          "Defence Airforce",
                                          "Defence Services",
                                          "Lecturer",
                                          "Professor",
                                          "Research Assistant",
                                          "Research Scholar",
                                          "Teacher",
                                          "Training Professional",
                                          "Electronocs / Telecom Engineer",
                                          "Mechanical Engineer",
                                          "Non IT engineer",
                                          "Cher / Sommelier / Food critic",
                                          "Hotel & Hospitality Professional",
                                          "Software Developer",
                                          "Software Consultant",
                                          "Hardware & Networking Professional",
                                          "Legal",
                                          "Lawyer",
                                          "Legal Assistant",
                                          "Dentist",
                                          "Doctor",
                                          "Nurse",
                                          "Pharmacist",
                                          "Physicial Assistant",
                                          "Physiotherapist",
                                          "Psychologist",
                                          "Surgeon",
                                          "Medical / Healthcare Professional(Others)",
                                          "Mariner",
                                          "Marketing Professional",
                                          "Sales Professional",
                                          "Cxo/Chairman/Director/President",
                                          "VP / AVP / GM / DGM",
                                          "Sr. Manager/Manager",
                                          "Consultant / Supervisor / Team Leads",
                                          "Team Member / Staff",
                                          "Agent/ Broker / Trader / Contractor",
                                          "Business Owner",
                                          "Politician",
                                          "Sportman",
                                          "Social Worker",
                                          "Travel & Transport professional",
                                          "Writer",
                                          "Student",
                                          "Retired",
                                          "Not Working",
                                          "Select"
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
                                            pro = val;
                                          });
                                        },
                                      ),
                                    )),
                                Text("\n\nEmployee Name\n"),
                                Container(
                                  height: 35,
                                  child: TextField(
                                    controller: _employee,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ))),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Physical Information",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("\n\nHeight\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        height,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "5ft 7in",
                                        "5ft 8in",
                                        "5ft 9in",
                                        "5ft 10in",
                                        "5ft 11in",
                                        "6ft ",
                                        "6ft 1in",
                                        "6ft 2in",
                                        "6ft 3in",
                                        "6ft 4in",
                                        "6ft 5in",
                                        "6ft 7in",
                                        "6ft 8in",
                                        "6ft 9in",
                                        "6ft 10in",
                                        "6ft 11in",
                                        "7ft"
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
                                          height = val;
                                        });
                                      },
                                    ),
                                  )),
                              Text("\n\nWeight\n"),
                              Container(
                                height: 35,
                                child: TextField(
                                  controller: _weight,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                ),
                              ),
                              Text("\n\nAny Disability\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        dis,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items:
                                          ["None", "Physical Disability"].map(
                                        (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          dis = val;
                                        });
                                      },
                                    ),
                                  )),
                            ],
                          ),
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
                                height: 25,
                              ),
                              Text("\n\nHealth Info\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        health,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "Select",
                                        "No Health Problems",
                                        "HIV Positive",
                                        "Diabetes",
                                        "Low BP",
                                        "High BP",
                                        "Health Ailments",
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
                                          health = val;
                                        });
                                      },
                                    ),
                                  )),
                              Text("\n\nBlood Group\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        blood,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "Don't Know",
                                        "A+",
                                        "A-",
                                        "B+",
                                        "B-",
                                        "AB+",
                                        "AB-",
                                        "O+",
                                        "O-"
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
                                          blood = val;
                                        });
                                      },
                                    ),
                                  )),
                              Text("\n\nDiet\n"),
                              Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  height: 35,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        diet,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      isExpanded: true,
                                      iconSize: 20.0,
                                      items: [
                                        "Veg",
                                        "Non-Veg",
                                        "Ocassionally Non-Veg",
                                        "Eggetarial",
                                        "Jain",
                                        "Vegan"
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
                                          diet = val;
                                        });
                                      },
                                    ),
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                              FlatButton(
                                onPressed: () {
                                  setdetails();
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
                    )))
          ],
        ),
      ),
    ));
  }
}
