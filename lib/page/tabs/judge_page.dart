import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/page/index.dart';
import 'package:flutter_planplus/widgets/glassic_box.dart';

class JudgePage extends StatefulWidget {
  JudgePage({Key key}) : super(key: key);

  @override
  _JudgePageState createState() => _JudgePageState();
}

class _JudgePageState extends State<JudgePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (ctx, index) {
        return GlassicContainer(
          padding: EdgeInsets.only(top: 100),
          width: 200,
          height: 200,
          borderRadius: 15,
          linearGradient: LinearGradient(colors: [Colors.white54, Colors.black54]),
          border: 5,
          blur: 3,
          borderGradient: LinearGradient(colors: [Colors.black54, Colors.white54]),
        );
      },
    );
  }
}
