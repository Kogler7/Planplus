///用于控制显示动画
import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';

class DialogBase extends StatefulWidget {
  @override
  _DialogBaseState createState() => _DialogBaseState();
}

class _DialogBaseState extends State<DialogBase> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: GlassicLayer(
            color: Colors.black,
            opacity: 0.5,
          ),
        ),
      ],
    );
  }
}
