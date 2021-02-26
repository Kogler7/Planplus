import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/string.dart';

Future<void> showThemeDialog(BuildContext ctx) async {
  int index = await showDialog<int>(
    context: ctx,
    builder: (BuildContext ctx) {
      var child = SizedBox(
        height: 800.h,
        child: Column(
          children: [
            ListTile(title: Text('选择一种背景主题')),
            SizedBox(
              height: 700.h,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext ctx, int index) {
                  return ListTile(
                    title: Text(KString.Themes[index]),
                    onTap: () {
                      themeIndexStream.sink.add(index);
                    },
                  );
                },
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
