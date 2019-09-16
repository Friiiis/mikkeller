import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/pages/About.dart';
import 'package:mikkeller/pages/Beers.dart';
import 'package:mikkeller/pages/Locations.dart';
import 'package:mikkeller/pages/Page.dart';
import 'package:mikkeller/widgets/BottomNav.dart';
import 'package:mikkeller/widgets/BottomNavIcon.dart';
import 'package:mikkeller/widgets/MikkellerAppBar.dart';
import 'package:mikkeller/Model.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mikkeller',
      theme: ThemeData(
        primarySwatch: ColorPicker.scrollOverflowColor,
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
  List<Page> pages = List();

  double _appBarHeight = 100;
  double _tabBarHeight = 75;

  int _currentIndex = 0;

  PageController _pageController;

  final Model model = Model();

  void bottomNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _setPages() {
    pages.add(
      Page(
        title: 'Mikkeller',
        tabBarTitle: 'Beers',
        tabBarIcon: 'assets/images/beer_navbar.png',
        page: BeersPage(),
      ),
    );
    pages.add(
      Page(
        title: 'Locations',
        tabBarIcon: 'assets/images/map_navbar.png',
        page: LocationsPage(),
        // model: model,
      ),
    );
    pages.add(
      Page(
        title: 'The Story',
        tabBarTitle: 'About',
        tabBarIcon: 'assets/images/henry_pic.png',
        page: AboutPage(),
      ),
    );
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _setPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.mainBackgroundColor,
      body: Stack(
        children: <Widget>[
          // Content
          Container(
            padding: EdgeInsets.only(top: _appBarHeight-1, bottom: _tabBarHeight),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: pages,
            ),
          ),
          // App bar
          Positioned(
            child: MikkellerAppBar(
              height: _appBarHeight,
              title: pages[_currentIndex].getTitle(),
              backgroundColor: _currentIndex == 0
                  ? ColorPicker.beerPageGreen
                  : ColorPicker.mainBackgroundColor,
              textColor: ColorPicker.mainFontColor,
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
                  text: pages[0].getTabBarTitle(),
                  asset: pages[0].getTabBarIcon(),
                ),
                BottomNavIcon(
                  text: pages[1].getTabBarTitle(),
                  asset: pages[1].getTabBarIcon(),
                ),
                BottomNavIcon(
                  text: pages[2].getTabBarTitle(),
                  asset: pages[2].getTabBarIcon(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
