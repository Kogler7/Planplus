import 'dart:ui';

import 'package:flutter/material.dart';

class TransListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;

  final Widget subtitle;
  final Widget trailing;

  final double height;
  final double basicPadding;

  final void Function() onTap;

  TransListTile({
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.height = 66.0,
    this.basicPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: onTap ?? () {},
          child: Container(
            color: Colors.transparent,
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
    );
  }
}
