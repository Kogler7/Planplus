import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/widgets/blury/basic/divider.dart';

class DoubleTextButton extends StatelessWidget {
  final double height;
  final double fontSize;
  final String textLeft;
  final String textRight;
  final Color colorLeft;
  final Color colorRight;
  final bool boldLeft;
  final bool boldRight;
  final bool hasDivider;
  final Function() leftPressed;
  final Function() rightPressed;

  const DoubleTextButton({
    Key key,
    this.height = 44,
    this.fontSize = 18,
    this.textLeft = 'Left',
    this.textRight = 'Right',
    this.colorLeft = KColor.primaryColor,
    this.colorRight = Colors.red,
    this.boldLeft = false,
    this.boldRight = true,
    this.hasDivider = false,
    this.leftPressed,
    this.rightPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      textLeft,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: colorLeft,
                        fontWeight: boldLeft ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height,
                width: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: Text(
                      textRight,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: colorRight,
                        fontWeight: boldRight ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TransDivider(
            enabled: hasDivider,
          ),
        ],
      ),
    );
  }
}
