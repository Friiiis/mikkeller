import 'package:flutter/material.dart';
import 'package:mikkeller/Styles.dart';
import 'package:mikkeller/pages/beers/BeersTypePage.dart';
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
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => BeersTypePage(
                      type: "bottle",
                    ),
                  ),
                ),
              ),
              BeerCard(
                imageAsset: 'assets/images/mediumcan.png',
                title: 'Canned beers',
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => BeersTypePage(
                      type: "can",
                    ),
                  ),
                ),
              ),
              BeerCard(
                imageAsset: 'assets/images/mediumtap.png',
                title: 'Beers on tap',
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => BeersTypePage(
                      type: "tap",
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title:
                          Text("*opens the Mikkeller merch page in browser*"),
                    );
                  },
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: (screenWidth - 300) / 2,
                    right: (screenWidth - 300) / 2,
                  ),
                  decoration: Styles.strokeAndHardShadow,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
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
