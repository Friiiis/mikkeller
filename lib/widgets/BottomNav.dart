import 'package:flutter/material.dart';
import 'BottomNavIcon.dart';

class MikkellerBottomNav extends StatefulWidget {
  /// Height of the navigation bar item
  final double height;

  /// The background color of the BottomNavigationBar
  final Color backgroundColor;

  /// Color of the text
  final Color fontColor;

  /// The elevation of the navigation bar
  final double elevation;

  /// Items in the navigation bar
  final List<BottomNavIcon> items;

  /// The selected index of the bar
  final int currentIndex;

  /// Callback when an item is selected
  final ValueChanged<int> onIndexChanged;

  static const fontHex = Color(0xff4a4a4a);

  MikkellerBottomNav({
    this.height = 75,
    this.backgroundColor = Colors.white,
    this.fontColor = fontHex,
    this.elevation = 2,
    @required this.items,
    @required this.currentIndex,
    @required this.onIndexChanged,
  }) : assert(items.length >= 2 && items.length <= 5);

  @override
  State<StatefulWidget> createState() {
    return _MikkellerBottomNavState();
  }
}

class _MikkellerBottomNavState extends State<MikkellerBottomNav>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height + 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: screenWidth,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border(
                top: BorderSide(
                  color: widget.fontColor,
                  width: 1,
                ),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 5, color: Colors.black26, offset: Offset(0, 0))
              ]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.items.map((item) {
                int index = widget.items.indexOf(item);
                return InkWell(
                  onTap: () {
                    widget.onIndexChanged(index);
                  },
                  child: Container(
                    height: widget.height,
                    width: screenWidth / widget.items.length,
                    padding: EdgeInsets.only(
                      top: widget.height / 10,
                    ),
                    child: BottomNavIcon(
                      height: widget.height,
                      text: item.text,
                      asset: item.asset,
                      // style: widget.currentIndex == index ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(),
                      iconOpacity: widget.currentIndex == index ? 1 : 0.5,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          AnimatedPositioned(
            bottom: widget.height -
                (57 /
                    widget.items
                        .length), // dette alligner Henry så han passer på toppen af baren
            left: screenWidth / widget.items.length * widget.currentIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: Image.asset(
              'assets/images/mikkeller_mand.png',
              width: screenWidth / widget.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
