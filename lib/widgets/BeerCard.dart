import 'package:flutter/material.dart';
import 'package:mikkeller/Styles.dart';

import '../ColorPicker.dart';

class BeerCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final Function onTap;

  const BeerCard({Key key, this.imageAsset, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 300,
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: 40,
                right: 80,
              ),
              decoration: Styles.strokeAndHardShadow,
              child: Text(
                title,
                style: Styles.mikkellerText(30),
              ),
            ),
          ),
          Positioned(
            right: 90,
            child: Hero(
              tag: imageAsset,
              child: Transform.rotate(
                angle: 320,
                child: Image.asset(
                  imageAsset,
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
