import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shaddiadmin/Theme.dart';
import 'package:shaddiadmin/dash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp1(),
    );
  }
}

class Myapp1 extends StatefulWidget {
  @override
  Myapp2 createState() => Myapp2();
}

class Myapp2 extends State<Myapp1> {
  String email, pass;
  login() async {
    Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("Department")
        .doc("Users")
        .collection("UsersList")
        .get()
        .then((snap) => snap.docs.forEach((doc) {
              if (doc.data()["username"] == email &&
                  doc.data()["password"] == pass) {
                department = doc.data()["department"];
                username = doc.data()["username"];

                show1();
              }
            }));
  }

  show1() async {
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(department)
        .collection("Permissions")
        .doc("members")
        .get()
        .then((value) => {
              lmemberslist = value.data()["list"],
              lmemberadd = value.data()["add"],
              lmemberupdate = value.data()["update"],
              lmemberdelete = value.data()["delete"]
            });
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(department)
        .collection("Permissions")
        .doc("membersPlan")
        .get()
        .then((value) => {
              lplanslist = value.data()["list"],
              lplanadd = value.data()["add"],
              lplanupdate = value.data()["update"],
              lplandel = value.data()["delete"]
            });
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(department)
        .collection("Permissions")
        .doc("department")
        .get()
        .then((value) => {
              ldpartlist = value.data()["list"],
              ldepadd = value.data()["add"],
              ldepupdate = value.data()["update"],
              ldepdelete = value.data()["delete"]
            });

    await FirebaseFirestore.instance
        .collection("Department")
        .doc(department)
        .collection("Permissions")
        .doc("users")
        .get()
        .then((value) => {
              luserslist = value.data()["list"],
              lusersadd = value.data()["add"],
              lusersup = value.data()["update"],
              lusersdel = value.data()["delete"]
            });

    navigate();
  }

  navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Dash1()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/back.jpg",
            ),
            fit: BoxFit.fill,
          )),
          child: Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 400,
              height: 400,
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\nLogIn",
                        style: TextStyle(fontSize: 20),
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\nHello Let's get Started",
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      email = val;
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      pass = val;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  new SizedBox(
                    width: 300.0,
                    height: 30.0,
                    child: new RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        login();
                      },
                      child: new Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\nCan't Login",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
