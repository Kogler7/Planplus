import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/tiles/basic/trans_tile.dart';

class SingleQueryOption extends StatelessWidget {
  final bool multiStyle;
  final bool chosen;
  final bool hasDivider;
  final String text;
  final Color leadingColor;
  final Color textColor;

  const SingleQueryOption({
    Key key,
    this.multiStyle = false,
    this.chosen = false,
    this.hasDivider=true,
    this.leadingColor = Colors.black54,
    this.text = '选项',
    this.textColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData = multiStyle
        ? chosen
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank
        : chosen
            ? Icons.radio_button_checked
            : Icons.radio_button_unchecked;
    return TransListTile(
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      leading: Icon(iconData),
      hasDivider: hasDivider,
    );
  }
}
