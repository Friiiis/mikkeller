import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/widgets/MikkellerAppBar.dart';
import 'package:mikkeller/widgets/RestaurantBeerCard.dart';

class BeersTypePage extends StatefulWidget {
  final String type;

  const BeersTypePage({Key key, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BeersTypePageState();
  }
}

class _BeersTypePageState extends State<BeersTypePage> {
  double opacity = 0;

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
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: opacity,
                child: Column(
                  children: getCards(widget.type),
                ),
              ),
            ),
            MikkellerAppBar(
              backgroundColor: ColorPicker.mainBackgroundColor,
              height: 100,
              textColor: ColorPicker.mainFontColor,
              title: getTitle(widget.type),
              verticalPadding: 100,
            ),
            // Back button
            Positioned(
              top: 30,
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
            // Hero animation
            Positioned(
              top: 40,
              right: 25,
              child: Hero(
                tag: getImageAsset(widget.type),
                child: Transform.rotate(
                  angle: 320,
                  child: Image.asset(
                    getImageAsset(widget.type),
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getCards(type) {
    List<Widget> list = List();

    list.add(Container(
      height: 115,
    ));

    for (var i = 0; i < 3; i++) {
      var t = "assets/images/" + type + ".PNG";
      if (type == "tap") {
        t = null;
      }
      list.add(
        RestaurantBeerCard(
          beerName: 'Organic German Pilsner',
          beerDescription:
              'Fresh Organic German-style pilsner.\n\nBecause if its fresh and organic everything tastes better. Crisp German Style Pilsner brewed only with Organic ingredients which provide a more intense and pure flavor. Floral, herbal and cereal is what you are going to find in the aroma and taste wise.\n\nSimply satisfying.',
          showBottomBorder: false,
          tapColor: Colors.amberAccent,
          tags: ["Light", "Fruity", "4,0%"],
          imageAsset: t,
        ),
      );
    }

    list.add(Container(
      height: 40,
    ));

    return list;
  }

  String getTitle(String type) {
    if (type == "bottle") {
      return "Bottled Beers";
    } else if (type == "can") {
      return "Canned Beers";
    } else {
      return "Beers on tap";
    }
  }

  String getImageAsset(String type) {
    if (type == "bottle") {
      return "assets/images/mediumbottle.png";
    } else if (type == "can") {
      return "assets/images/mediumcan.png";
    } else {
      return "assets/images/mediumtap.png";
    }
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
