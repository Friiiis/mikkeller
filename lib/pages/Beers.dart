import 'package:flutter/material.dart';
import 'package:mikkeller/Styles.dart';
import 'package:mikkeller/widgets/BeerCard.dart';

import '../ColorPicker.dart';

class BeersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Image.asset('assets/images/beers-animated.gif'),
        Expanded(
          child: ListView(
            children: <Widget>[
              BeerCard(
                imageAsset: 'assets/images/mediumbottle.png',
                title: 'Bottled beers',
              ),
              BeerCard(
                imageAsset: 'assets/images/mediumcan.png',
                title: 'Canned beers',
              ),
              BeerCard(
                imageAsset: 'assets/images/mediumtap.png',
                title: 'Beers on tap',
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: (screenWidth - 300) / 2,
                    right: (screenWidth - 300) / 2,
                  ),
                  decoration: Styles.strokeAndHardShadow,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Image.asset('assets/images/merch-animated.gif'),
                  ),
                ),
              ),
              Container(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
