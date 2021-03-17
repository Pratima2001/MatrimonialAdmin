import 'package:flutter/material.dart';
import 'package:shaddiadmin/ui/collapsing_navigation_drawer.dart';

class Memberslist extends StatefulWidget {
  Memberslist1 createState() => Memberslist1();
}

class Memberslist1 extends State<Memberslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CollapsingNavigationDrawer(),
        Expanded(
            child: Container(
          child: Center(child: Text("Members List")),
        )),
      ],
    ));
  }
}
