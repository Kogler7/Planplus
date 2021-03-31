import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/widgets/blury/basic/divider.dart';

class SingleTextButton extends StatelessWidget {
  final double height;
  final double fontSize;
  final String text;
  final Color color;
  final bool bold;
  final bool hasDivider;
  final Function() onPressed;

  const SingleTextButton({
    Key key,
    this.height = 50,
    this.text = 'text',
    this.color = KColor.primaryColor,
    this.hasDivider = true,
    this.onPressed,
    this.fontSize = 18,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed ?? () {},
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          TransDivider(
            enabled: hasDivider,
          ),
        ],
      ),
    );
  }
}
