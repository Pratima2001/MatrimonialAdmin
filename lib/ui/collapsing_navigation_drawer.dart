import 'package:flutter/material.dart';
import 'package:shaddiadmin/ManageAddPage/AddUser.dart';
import 'package:shaddiadmin/ManageFrontPage/DepartmentList.dart';
import 'package:shaddiadmin/ManageFrontPage/PhotoApproval.dart';
import 'package:shaddiadmin/ManageFrontPage/UsersList.dart';
import 'package:shaddiadmin/Memberslist.dart';
import 'package:shaddiadmin/ManageFrontPage/Premiumplans.dart';
import 'package:shaddiadmin/ManageFrontPage/Stories.dart';
import 'package:shaddiadmin/ManageFrontPage/Members.dart';

import '../models/navigation_item.dart';
import '../ui/collapsing_list_tile.dart';
import '../ui/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double _maxWidth = 250;
  double _minWidth = 70;
  bool _isCollapsed = false;
  AnimationController _animationController;
  Animation<double> _withAnimation;

  bool setnav() {
    bool s = _isCollapsed;
    return s;
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _withAnimation =
        Tween(begin: _maxWidth, end: _minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(BuildContext context, Widget widget) {
    return Material(
      elevation: 80,
      child: Container(
        width: _withAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CollapsingListTile(
              title: "Username",
              icon: Icons.account_circle,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 12,
                  );
                },
                itemBuilder: (context, index) {
                  return CollapsingListTile(
                    title: navigationItems[index].title,
                    icon: navigationItems[index].icon,
                    animationController: _animationController,
                    isSelected: current == index,
                    onTab: () {
                      setState(() {
                        current = index;
                        if (current == 0) {
                        } else if (current == 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Member()));
                          current = 1;
                        } else if (current == 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Premiumplan()));
                          current = 2;
                        } else if (current == 3) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Photoapp()));
                          current = 3;
                        } else if (current == 4) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Stories()));
                          current = 4;
                        } else if (current == 5) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DepartmentList()));
                          current = 5;
                        } else if (current == 6) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UserList()));
                          current = 6;
                        }
                      });
                    },
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isCollapsed = !_isCollapsed;
                  nav = _isCollapsed;
                  a1 = _animationController;
                  _isCollapsed ? a1.forward() : a1.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 40,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
