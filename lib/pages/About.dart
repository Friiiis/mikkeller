import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(
                left: 25,
                right: 10,
              ),
              child: Text(
                'In 2006 he was a math and physics teacher that started experimenting with hops, malt and yeast back home in his kitchen in Copenhagen.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(
                left: 10,
                right: 25,
              ),
              child: Image.asset('assets/images/book.coaster.png'),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(
                top: 50,
                left: 25,
                right: 10,
              ),
              child: Image.asset('assets/images/Group-6467.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(
                top: 50,
                left: 10,
                right: 25,
              ),
              child: Text(
                'Today Mikkel B Bjergsø exports his micro brewed beer to 40 different countries and is internationally acclaimed as one of the most innovative and cutting edge brewers in the world.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: Image.asset(
            'assets/images/vision.png',
          ),
        ),
        title('We aim to...'),
        text('... brew beer that challenges the concept of good beer and moves people. We do this by using the best ingredients and work with the most talented and creative minds around the world.'),
        text('... make quality beers a serious alternative to wine and champagne when having gourmet food.'),
        Container(height: 50,)
      ],
    );
  }

  Widget title(String title) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Text(
          title,
          style: Styles.mikkellerText(32),
        ),
      ),
    );
  }

  Widget text(String text) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
