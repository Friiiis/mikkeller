import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';

class RestaurantBeerCard extends StatelessWidget {
  final String beerName;
  final String beerDescription;
  final int index;
  final Color tapColor;
  final bool showBottomBorder;
  final List<String> tags;

  const RestaurantBeerCard(
      {Key key,
      this.beerName,
      this.beerDescription,
      this.index,
      this.tapColor,
      this.showBottomBorder,
      this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: 20,
        right: 30,
        left: 30,
      ),
      color: ColorPicker.mainBackgroundColor,
      child: Column(
        children: <Widget>[
          // Title
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            child: Center(
              child: Text(
                beerName,
                style: Styles.mikkellerText(32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Tap and description
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Image.asset("assets/images/mediumtap.png"),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 12,
                    child: Text(
                      index.toString(),
                      style: Styles.mikkellerText(28),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: screenWidth - 125,
                    child: Text(
                      beerDescription,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Row(
                    children: tags.map((tag) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            tag,
                            style: Styles.mikkellerText(24),
                          ),
                          tags.indexOf(tag) != tags.length - 1
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: ColorPicker.mainFontColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
          // Bottom border
          // Container(height: 20,),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 1,
            color: showBottomBorder
                ? ColorPicker.mainFontColor
                : tapColor,
          ),
        ],
      ),
    );
  }
}
