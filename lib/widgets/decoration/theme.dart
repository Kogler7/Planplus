import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/global.dart';

class MainBackImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: initMainBackIndex,
        stream: mainBackChangeStream.stream,
        builder: (ctx, snap) {
          return Image(
            image: KImage.mainBack(snap.data),
            fit: BoxFit.fill,
          );
        });
  }
}
