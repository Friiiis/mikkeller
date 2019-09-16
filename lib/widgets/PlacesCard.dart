import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';
import 'package:mikkeller/model/Place.dart';
import 'package:mikkeller/pages/locations/Restaurant.dart';

class PlacesCard extends StatelessWidget {
  final Place place;

  const PlacesCard({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      padding: EdgeInsets.only(top: 25, bottom: 20, left: 15, right: 15),
      decoration: Styles.strokeAndHardShadow,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => RestaurantPage(
              place: place,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              child: Hero(
                tag: place.name + 'logo',
                child: Image.asset(place.assetPath),
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Container(
              child: Text(
                place.description,
                style: Styles.mikkellerText(26),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      'Distance:\n' + place.distance.toString() + ' km',
                      style: Styles.mikkellerText(26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  color: ColorPicker.mainFontColor,
                  width: 1,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                ),
                Container(
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      'Open until:\n' + place.closingHour,
                      style: Styles.mikkellerText(26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
