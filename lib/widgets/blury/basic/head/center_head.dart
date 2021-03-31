import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/basic/divider.dart';

class CentralCardHeading extends StatelessWidget {
  final double height;
  final String title;
  final String subTitle;
  final double subPadding = 10;

  const CentralCardHeading({
    Key key,
    this.height = 70,
    this.title = 'title',
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: subPadding, right: subPadding, bottom: subPadding),
              child: Text(
                subTitle,
                style: TextStyle(color: Colors.black38, fontSize: 10),
              ),
            ),
            TransDivider(),
          ],
        ),
      ),
    );
  }
}
