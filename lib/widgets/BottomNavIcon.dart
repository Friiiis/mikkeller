import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final String asset;
  final String text;
  final TextStyle style;
  final double height;
  final double iconOpacity;

  const BottomNavIcon(
      {Key key,
      this.asset,
      this.text,
      this.style,
      this.height,
      this.iconOpacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 250),
      opacity: iconOpacity,
      child: Container(
        height: height,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                asset,
                height: height / 1.75,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                text,
                style: TextStyle(fontFamily: 'Mikkeller', fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
