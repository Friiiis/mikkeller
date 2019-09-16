import 'package:flutter/material.dart';
import 'package:mikkeller/widgets/EventsCard.dart';
import 'package:mikkeller/widgets/ShowOnMapButton.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ShowOnMapButton(),
        EventsCard(
          color: Colors.redAccent,
          eventLocation: 'Kvalifik',
          eventName: 'Dojo challenge',
          eventDate: '17. sep 10:00',
          distance: 0.7,
        ),
        EventsCard(
          color: Colors.greenAccent,
          eventLocation: 'Baghaven',
          eventName: 'Guided beer tasting',
          eventDate: '29. nov 17:00',
          distance: 2.2,
        ),
        EventsCard(
          color: Colors.yellowAccent,
          eventLocation: 'Oksnehallen',
          eventName: 'MBCC',
          eventDate: '1. dec 19:00',
          distance: 5.7,
        ),
        Container(
          height: 50,
        ),
      ],
    );
  }
}
