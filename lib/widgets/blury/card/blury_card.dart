import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/basic/head/center_head.dart';
import 'package:flutter_planplus/widgets/blury/basic/head/tile_head.dart';
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
  final bool centralHeaded;

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
    this.centralHeaded = false,
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
                    ? centralHeaded
                        ? CentralCardHeading(
                            height: titleHeight,
                            title: title,
                            subTitle: subTitle,
                          )
                        : TitleCardHeading(
                            height: titleHeight,
                            title: title,
                            subTitle: subTitle,
                            leading: titleLeading ?? SizedBox.shrink(),
                          )
                    : SizedBox.shrink(),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
