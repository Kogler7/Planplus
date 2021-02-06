import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';

class GotoIconedText extends StatelessWidget{
  final IconData iconData;
  final String title;
  final VoidCallback callback;
  final Color color;

  GotoIconedText({
    this.title,
    this.iconData,
    this.callback,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100.0),
      width: double.infinity,
      child: InkWell(
        onTap: callback,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Icon(
                iconData,
                size: 40.0.w,
                color: color,
              ),
            ),
            Padding(padding: EdgeInsets.only(left:20.0.w)),
            Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26.0),
                color: KColor.gotoIconedTextColor
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 30.0.w),
                child: Icon(
                  KIcon.GotoArrow,
                  color: KColor.gotoIconColor,
                  size: 30.0.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}