import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/tiles/basic/trans_tile.dart';

class ListCard extends StatelessWidget {
  final double elevation;
  final double circular;
  final double basicPadding;
  final String title;
  final String subTitle;
  final Widget titleLeading;
  final List<Widget> children;
  final double titleHeight;
  final Color color;

  ListCard({
    this.elevation = 15.0,
    this.circular = 14.0,
    this.basicPadding = 10,
    this.title,
    this.subTitle,
    this.titleLeading,
    @required this.children,
    this.color = Colors.white,
    this.titleHeight = 56,
  });

  @override
  Widget build(BuildContext context) {
    bool hasTitle = (title == null) ? false : true;
    return Padding(
      padding: EdgeInsets.only(left: basicPadding, top: basicPadding, right: basicPadding),
      child: Card(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(circular))),
        child: Column(
          children: [
            hasTitle
                ? TransListTile(
                    height: titleHeight,
                    title: Text(title, style: new TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: subTitle != null ? Text(subTitle) : SizedBox(height: 0),
                    leading: titleLeading ?? SizedBox(width: 0),
                  )
                : SizedBox(height: 0),
            hasTitle
                ? Divider(
                    height: 2,
                    thickness: 1,
                  )
                : SizedBox(height: 0),
            ...children,
          ],
        ),
      ),
    );
  }
}
