import 'package:flutter/material.dart';
import 'package:mikkeller/pages/About.dart';
import 'package:mikkeller/pages/Beers.dart';
import 'package:mikkeller/pages/Locations.dart';
import 'package:mikkeller/pages/Page.dart';
import 'package:mikkeller/model/Place.dart';

class Model {
  List<Page> pages = List();
  List<Place> places = List();

  Model() {
    places.add(Place(
        'La Neta',
        'assets/images/LaNetaLogo.png',
        'Mexican taqueira & craft beer',
        'Fantasivej 23, 2000 Frederiksberg',
        0.7,
        '22:00'));
    places.add(Place(
        'Warpigs',
        'assets/images/WarpigsLogo.png',
        'Texas bbq brewpup',
        'Fantasivej 23, 2000 Frederiksberg',
        1.7,
        '02:00'));
    places.add(Place(
        'Mikkeller & Friends',
        'assets/images/MikkellerFriendsLogo.png',
        '40 different tap beers',
        'Fantasivej 23, 2000 Frederiksberg',
        2.4,
        '02:00'));
    places.add(Place(
        'Ol og Brod',
        'assets/images/OlOgBrodLogo.png',
        'Classic danish food, snaps and beer',
        'Fantasivej 23, 2000 Frederiksberg',
        3.9,
        '02:00'));
  }

   List<Place> getPlaces(){
     return places;
   }

  void setupModel() {
    // _setPages();
    // _setPlaces();
  }
}
