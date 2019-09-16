import 'package:flutter/material.dart';
import 'package:mikkeller/Model.dart';

class Page extends StatelessWidget {
  final String title;
  final String tabBarTitle;
  final String tabBarIcon;
  final Widget page;
  final Model model;

  Page({Key key, this.title, this.page, this.tabBarIcon, this.tabBarTitle, this.model})
      : super(key: key);

  String getTitle() {
    return title;
  }

  String getTabBarTitle() {
    if (tabBarTitle == null) {
      return title;
    } else {
      return tabBarTitle;
    }
  }

  String getTabBarIcon() {
    return tabBarIcon;
  }

  @override
  Widget build(BuildContext context) {
    return page;
  }
}
