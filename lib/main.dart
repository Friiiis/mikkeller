import 'package:flutter/material.dart';
import 'package:mikkeller/widgets/BottomNav.dart';
import 'package:mikkeller/widgets/BottomNavIcon.dart';
import 'package:mikkeller/widgets/MikkellerAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mikkeller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarHeight = 120;
  double _tabBarHeight = 75;

  int _currentIndex = 0;

  PageController _pageController;

  void bottomNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Content
          Container(
            padding: EdgeInsets.only(top: _appBarHeight, bottom: _tabBarHeight),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                Center(
                  child: Text(
                    'Cybeerspace',
                    style: TextStyle(fontFamily: 'Mikkeller'),
                  ),
                ),
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontFamily: 'Mikkeller'),
                  ),
                ),
                Center(
                  child: Text(
                    'Locations',
                    style: TextStyle(fontFamily: 'Mikkeller'),
                  ),
                ),
              ],
            ),
          ),
          // App bar
          Positioned(
            child: MikkellerAppBar(
              height: _appBarHeight,
              title: 'Mikkeller',
              backgroundColor: Colors.white,
              textColor: Color(0xff424242),
            ),
          ),
          // Bottom navigation
          Positioned(
            bottom: 0,
            child: MikkellerBottomNav(
              height: _tabBarHeight,
              currentIndex: _currentIndex,
              onIndexChanged: (index) => bottomNavigationTapped(index),
              backgroundColor: Colors.white,
              fontColor: Color(0xff424242),
              items: [
                BottomNavIcon(
                  text: 'Cybeerspace',
                  asset: 'assets/images/beer_navbar.png',
                ),
                BottomNavIcon(
                  text: 'Profile',
                  asset: 'assets/images/henry_pic.png',
                ),
                BottomNavIcon(
                  text: 'Locations',
                  asset: 'assets/images/map_navbar.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
