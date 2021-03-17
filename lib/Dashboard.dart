import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaddiadmin/Memberslist.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> k = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: k,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xff050A30),
            ),
            onPressed: () => k.currentState.openDrawer()),
      ),
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xff050A30),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.card_membership,
                  color: Colors.white,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.dashboard_customize,
                  color: Colors.white,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
                title: Text(
                  "Members",
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Memberslist()));
                    },
                    title: Text("Free members",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text("Premium Members",
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text("Add members",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.next_plan,
                  color: Colors.white,
                ),
                title: Text(
                  "Premium Plans",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.amp_stories,
                  color: Colors.white,
                ),
                title: Text(
                  "Stories",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.money,
                  color: Colors.white,
                ),
                title: Text(
                  "Earnings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                title: Text(
                  "Contact Messages",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.sms,
                  color: Colors.white,
                ),
                title: Text(
                  "Send sms",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                title: Text(
                  "Language",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_applications,
                  color: Colors.white,
                ),
                title: Text(
                  "Manage Admin page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_drive,
                  color: Colors.white,
                ),
                title: Text(
                  "Advertisement",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Site Configuration",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Site Statistics",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text("Hii"),
      ),
    );
  }
}
