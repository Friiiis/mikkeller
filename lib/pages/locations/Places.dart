import 'package:flutter/material.dart';
import 'package:mikkeller/Model.dart';
import 'package:mikkeller/Styles.dart';
import 'package:mikkeller/widgets/PlacesCard.dart';
import 'package:mikkeller/widgets/ShowOnMapButton.dart';

class PlacesPage extends StatelessWidget {
  Model model = Model();

  // PlacesPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        ShowOnMapButton(),
        PlacesCard(
          place: model.getPlaces()[0],
        ),
        PlacesCard(
          place: model.getPlaces()[1],
        ),
        PlacesCard(
          place: model.getPlaces()[2],
        ),
        PlacesCard(
          place: model.getPlaces()[3],
        ),
        Container(
          height: 50,
        ),
      ],
    );
  }
}
