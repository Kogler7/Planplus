import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/buttons/trans/list_tile.dart';
import 'package:flutter_planplus/widgets/buttons/trans/list_tile.dart';

class BluryListCard extends StatelessWidget {
  final double blur;
  final double circular;
  final double basicPadding;
  final String title;
  final String subTitle;
  final Widget titleLeading;
  final List<Widget> children;
  final double opacity;
  final double titleHeight;
  final Color color;

  BluryListCard({
    this.blur = 0,
    this.circular = 14.0,
    this.basicPadding = 16,
    this.title,
    this.subTitle,
    this.titleLeading,
    @required this.children,
    this.opacity = 0.7,
    this.titleHeight = 56,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    bool hasTitle = (title == null) ? false : true;
    return Padding(
      padding: EdgeInsets.only(left: basicPadding, top: basicPadding, right: basicPadding),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(circular),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: color.withOpacity(opacity),
            child: Column(
              children: [
                hasTitle
                    ? TransListTile(
                        height: titleHeight,
                        dividerHeight: 2,
                        headIndent: 0,
                        title: Text(title, style: new TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: subTitle != null
                            ? Text(
                                subTitle,
                                style: TextStyle(color: Colors.black38, fontSize: 10),
                              )
                            : SizedBox(height: 0),
                        leading: titleLeading ?? SizedBox(width: 0),
                        enabled: false,
                      )
                    : SizedBox(height: 0),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
