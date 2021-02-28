import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';

class FixedItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback callback;
  final Color color;

  FixedItem({
    this.title,
    this.iconData,
    this.callback,
    this.color = Colors.black54,
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
              margin: EdgeInsets.only(left: 35.0.w),
              child: Icon(
                iconData,
                size: 50.0.w,
                color: color,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 35.0.w)),
            Text(
              title,
              style: TextStyle(fontSize: ScreenUtil().setSp(28.0), color: KColor.gotoItemTextColor),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 30.0.w),
                child: Icon(
                  KIcon.GotoArrow,
                  color: KColor.gotoItemIconColor,
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
