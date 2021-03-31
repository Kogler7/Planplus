import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/basic/divider.dart';

class TransListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;

  final Widget subtitle;
  final Widget trailing;

  final double height;
  final double basicPadding;
  final double headIndent;
  final double endIndent;
  final double dividerHeight;
  final double thickness;
  final double dividerOpacity;
  final bool hasDivider;
  final bool enabled;

  final void Function() onTap;

  TransListTile({
    @required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.height = 60.0,
    this.basicPadding = 20,
    this.hasDivider = true,
    this.headIndent = 60,
    this.endIndent = 0,
    this.dividerHeight = 1,
    this.dividerOpacity = 0.2,
    this.thickness = 1,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap ?? () {},
            child: Container(
              color: Colors.transparent,
              height: height,
              child: Column(
                children: [
                  Expanded(
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
                  TransDivider(
                    thickness: thickness,
                    headIndent: headIndent,
                    endIndent: endIndent,
                    enabled: hasDivider,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
