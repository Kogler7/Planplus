import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/buttons/trans/list_tile.dart';

class TitleCardHeading extends StatelessWidget {
  final double height;
  final String title;
  final String subTitle;
  final Widget leading;

  const TitleCardHeading({
    Key key,
    this.height = 56,
    this.title = 'title',
    this.subTitle,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransListTile(
      height: height,
      dividerHeight: 2,
      headIndent: 0,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subTitle != null
          ? Text(
              subTitle,
              style: TextStyle(color: Colors.black38, fontSize: 10),
            )
          : SizedBox(height: 0),
      leading: leading ?? SizedBox.shrink(),
      enabled: false,
    );
  }
}
