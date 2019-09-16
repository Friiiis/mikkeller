import 'package:flutter/material.dart';
import 'package:mikkeller/pages/locations/Places.dart';
import 'package:mikkeller/pages/locations/Events.dart';
import 'package:mikkeller/widgets/TabNavigator.dart';

class LocationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationsPageState();
  }
}

class _LocationsPageState extends State<LocationsPage> {
  int _currentPage = 0;

  PageController _pageController;

  void tabBarTapped(int index) {
    setState(() {
      _currentPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabNavigator(
          items: ['Places', 'Events'],
          currentIndex: _currentPage,
          onIndexChanged: (index) => tabBarTapped(index),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              PlacesPage(),
              EventsPage(),
            ],
          ),
        ),
      ],
    );
  }
}
