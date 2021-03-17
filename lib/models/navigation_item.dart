import 'package:flutter/material.dart';

class NavigationItem {
  String title;
  IconData icon;

  NavigationItem({this.title, this.icon});
}

List<NavigationItem> navigationItems = [
  NavigationItem(title: "Dashboard", icon: Icons.dashboard),
  NavigationItem(title: "Members", icon: Icons.person),
  NavigationItem(title: "Premium Plans", icon: Icons.next_plan),
  NavigationItem(title: "Photo Approval", icon: Icons.amp_stories),
  NavigationItem(title: "Stories", icon: Icons.money),
  NavigationItem(title: "Department", icon: Icons.add_to_drive),
  NavigationItem(title: "User", icon: Icons.person),
  NavigationItem(title: "Settings", icon: Icons.settings),
];
