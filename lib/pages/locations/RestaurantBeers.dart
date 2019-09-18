import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/model/Place.dart';
import 'package:mikkeller/widgets/MikkellerAppBar.dart';
import 'package:mikkeller/widgets/RestaurantBeerCard.dart';
import 'package:mikkeller/widgets/TabNavigator.dart';

class RestaurantBeersPage extends StatefulWidget {
  final Place place;

  const RestaurantBeersPage({Key key, this.place}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RestaurantBeersPageState();
  }
}

class _RestaurantBeersPageState extends State<RestaurantBeersPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.mainBackgroundColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 165,
                ),
                RestaurantBeerCard(
                  beerName: 'Organic German Pilsner',
                  beerDescription:
                      'Fresh Organic German-style pilsner.\n\nBecause if its fresh and organic everything tastes better. Crisp German Style Pilsner brewed only with Organic ingredients which provide a more intense and pure flavor. Floral, herbal and cereal is what you are going to find in the aroma and taste wise.\n\nSimply satisfying.',
                  index: 1,
                  showBottomBorder: true,
                  tapColor: Colors.green[300],
                  tags: ["Light", "Organic", "Pilsner"],
                ),
                RestaurantBeerCard(
                  beerName: 'Proper Pint',
                  beerDescription:
                      "A smooth Dry Irish-style Stout with subtly sweet aromas and a distinctly mellow roast.",
                  index: 2,
                  showBottomBorder: true,
                  tapColor: Colors.orange[300],
                  tags: ["Dark", "Pint"],
                ),
                RestaurantBeerCard(
                  beerName: "Goose Nose Mango",
                  beerDescription:
                      "Goose style ale brewed with mango.\n\nNose is filled with citrus and mango notes. Taste is a good mix of salty brine notes mixed with a wheat and tropical fruit on the finish! Mango on the nose, mango on the palate, mango In the heart. A well balanced beer that will captivate your soul.",
                  index: 3,
                  showBottomBorder: false,
                  tapColor: Colors.amberAccent,
                  tags: ["Light", "Fruity"],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              MikkellerAppBar(
                backgroundColor: ColorPicker.mainBackgroundColor,
                height: 100,
                textColor: ColorPicker.mainFontColor,
                title: widget.place.name,
                verticalPadding: 100,
              ),
              TabNavigator(
                backgroundColor: ColorPicker.mainBackgroundColor,
                fontColor: ColorPicker.mainFontColor,
                currentIndex: _currentIndex,
                items: ['Beers on tap', 'Bottled beers'],
                onIndexChanged: (index) => print(index),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 15,
            child: InkWell(
              splashColor: ColorPicker.mainBackgroundColor,
              highlightColor: ColorPicker.mainBackgroundColor,
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/images/backarrow.png',
                width: 75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
