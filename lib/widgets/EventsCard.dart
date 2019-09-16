import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';

class EventsCard extends StatelessWidget {
  final double distance;
  final String eventImage;
  final String eventName;
  final String eventLocation;
  final String eventDate;
  final Color color;

  const EventsCard(
      {Key key,
      this.distance,
      this.eventImage,
      this.eventName,
      this.eventLocation,
      this.color,
      this.eventDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: Styles.strokeAndHardShadow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
            ),
            Container(
              height: 1,
              color: ColorPicker.mainFontColor,
            ),
            Container(
              child: Text(
                eventName,
                style: Styles.mikkellerText(36),
              ),
              margin: EdgeInsets.only(bottom: 5, left: 15, top: 10),
            ),
            Container(
              child: Text(
                eventDate,
                style: Styles.mikkellerText(26),
              ),
              margin: EdgeInsets.only(left: 15),
            ),
            Container(
              child: Text(
                distance.toString() + ' km // ' + eventLocation,
                style: Styles.mikkellerText(26),
              ),
              margin: EdgeInsets.only(bottom: 10, left: 15),
            ),
          ],
        ),
      ),
    );
  }
}
