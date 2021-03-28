import 'package:flutter/material.dart';

///dialog抽象父类

abstract class CustomDialog {
  double backOpacity = 0.3;
  Color backColor = Colors.black;
  double attachPadding = 20;
  bool locked = false;
  Duration duration = Duration(milliseconds: 500);
  MainAxisAlignment align = MainAxisAlignment.start;
  DialogAppear appear = DialogAppear.faded;
  Size size = Size(300, 150);

  Widget build(BuildContext context);
}

enum DialogAppear {
  fromTop,
  fromBottom,
  faded,
}

enum DialogAction {
  show,
  pop,
}
