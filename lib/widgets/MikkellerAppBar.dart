import 'package:flutter/material.dart';
import 'package:mikkeller/Styles.dart';

class MikkellerAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double height;

  const MikkellerAppBar(
      {Key key,
      this.title,
      this.backgroundColor,
      this.height = 100,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      height: height,
      padding: EdgeInsets.only(top: 35),
      // alignment: Alignment.center,
      child: Center(
        child: Text(
          title,
          style: Styles.mikkellerText(38),
        ),
      ),
    );
  }
}
