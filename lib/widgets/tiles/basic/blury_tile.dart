import 'dart:ui';

import 'package:flutter/material.dart';

class BluryListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;

  final Widget subtitle;
  final Widget trailing;

  final double height;
  final double blur;
  final double opacity;
  final double basicPadding;
  final double borderRadius;

  final Color backColor;

  final void Function() onTap;

  BluryListTile({
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.height = 66.0,
    this.blur = 3,
    this.opacity = 0.5,
    this.basicPadding = 20,
    this.borderRadius = 14,
    this.backColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: onTap ?? () {},
              child: Container(
                color: backColor.withOpacity(opacity),
                height: height,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: basicPadding), child: leading ?? SizedBox(width: 0)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: basicPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title,
                            subtitle ?? SizedBox(height: 0),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: basicPadding), child: trailing ?? SizedBox(width: 0)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
