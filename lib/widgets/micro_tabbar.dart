import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';

class MicroTabBar extends StatelessWidget{
  final double width;
  final double height;
  final Color bkColor;
  final double elevation;
  final double circular;
  final List<Widget> tabs;
  List<Widget> dividers = [];

  @override
  MicroTabBar({Key key,
    this.tabs,this.width,this.height,
    this.bkColor = KColor.primaryColor,
    this.circular = 12.0,
    this.elevation = 3.0
  }):super(key: key) {
    for (int i = 1; i < tabs.length; i++) {
      dividers.add(
          Padding(
            padding: EdgeInsets.only(left: width / tabs.length - 3),
            child: Center(
              child: SizedBox(
                width: 1,
                height: height/3*2-6,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
              ),
            ),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
        color: bkColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(circular))),
        child: ClipRRect(
            child:Stack(
              children: <Widget>[
                TabBar(tabs: tabs),
                Row(children: dividers),
              ],
            ),
          borderRadius: BorderRadius.circular(circular),
        ),
      ),
    );
  }
}