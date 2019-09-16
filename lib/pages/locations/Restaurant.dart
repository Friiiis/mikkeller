import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';
import 'package:mikkeller/model/Place.dart';

class RestaurantPage extends StatefulWidget {
  final Place place;

  const RestaurantPage({Key key, this.place}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RestaurantPageState(place: place);
  }
}

class _RestaurantPageState extends State<RestaurantPage> {
  final Place place;
  double xAlignment = 10;
  double opacity = 0;

  _RestaurantPageState({Key key, this.place});

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => popContext(),
      child: Scaffold(
        backgroundColor: ColorPicker.mainBackgroundColor,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 130, bottom: 40),
                    child: Center(
                      child: Hero(
                        tag: place.name + 'logo',
                        child: Image.asset(place.assetPath),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: opacity,
                    child: Column(
                      children: <Widget>[
                        Text(
                          place.description,
                          style: Styles.mikkellerText(26),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                          ),
                          child: Image.asset(
                            'assets/images/menu_button.png',
                            width: 250,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Image.asset(
                            'assets/images/beer_button.png',
                            width: 250,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              place.address +
                                  '\nOpen untill ' +
                                  place.closingHour,
                              style: Styles.mikkellerText(26),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: Styles.strokeAndHardShadow,
                          child: Text(
                            'Get directions',
                            style: Styles.mikkellerText(28),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: InkWell(
                splashColor: ColorPicker.mainBackgroundColor,
                highlightColor: ColorPicker.mainBackgroundColor,
                onTap: () => popContext(),
                child: Image.asset(
                  'assets/images/backarrow.png',
                  width: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> popContext() {
    setState(() {
      opacity = 0;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pop(context);
    });
  }
}
