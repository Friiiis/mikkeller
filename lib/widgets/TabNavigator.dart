import 'package:flutter/material.dart';
import 'package:mikkeller/ColorPicker.dart';
import 'package:mikkeller/Styles.dart';

class TabNavigator extends StatefulWidget {
final Color backgroundColor;
  final Color fontColor;
  final List<String> items;
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  const TabNavigator(
      {Key key,
      this.backgroundColor,
      this.fontColor,
      this.items,
      this.currentIndex,
      this.onIndexChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = 50;

    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: ColorPicker.mainFontColor,
          width: 1,
        ),
      )),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return InkWell(
            onTap: () {
              widget.onIndexChanged(index);
            },
            child: Container(
              height: height,
              width: screenWidth / widget.items.length,
              padding: EdgeInsets.only(
                top: height / 10,
              ),
              alignment: Alignment.center,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: index == widget.currentIndex ? 1 : 0.5,
                child: Text(
                  item,
                  style: Styles.mikkellerText(28),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
