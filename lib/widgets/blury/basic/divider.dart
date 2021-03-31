import 'package:flutter/material.dart';

class TransDivider extends StatelessWidget {
  final bool enabled;
  final double thickness;
  final double headIndent;
  final double endIndent;

  const TransDivider({
    Key key,
    this.enabled = true,
    this.thickness = 1,
    this.headIndent = 0,
    this.endIndent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? Divider(
            height: thickness,
            thickness: thickness,
            indent: headIndent,
            endIndent: endIndent,
            color: Colors.grey.withOpacity(0.2),
          )
        : SizedBox.shrink();
  }
}
