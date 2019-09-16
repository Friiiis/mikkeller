import 'package:flutter/material.dart';
import 'package:mikkeller/Styles.dart';

class ShowOnMapButton extends StatelessWidget {
  final Function onTap;

  const ShowOnMapButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        left: (screenWidth - 200) / 2,
        right: (screenWidth - 200) / 2,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: Styles.strokeAndHardShadow,
      child: InkWell(
        onTap: () => onTap,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        child: Center(
          child: Text(
            'Show on map',
            style: Styles.mikkellerText(26),
          ),
        ),
      ),
    );
  }
}
