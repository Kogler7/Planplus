import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/tiles/theme_unit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showThemeDialog(BuildContext ctx) async {
  int index = await showDialog<int>(
    context: ctx,
    builder: (BuildContext ctx) {
      var child = SizedBox(
        height: 800.h,
        child: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '选择一种背景主题',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              width: double.infinity,
            ),
            Container(
              height: 720.h,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: ListView(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 16,
                      children: List.generate(
                        10,
                        (index) => ThemeDisplayUnit(
                          index: index,
                          width: 130,
                          height: 170,
                          padding: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      return Dialog(
        child: child,
      );
    },
  );
}
