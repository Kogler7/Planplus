import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/page/index.dart';

class JudgePage extends StatefulWidget {
  JudgePage({Key key}) : super(key: key);

  @override
  _JudgePageState createState() => _JudgePageState();
}

class _JudgePageState extends State<JudgePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.primaryColor,
      child: GroupDetailPage(),
    );
  }
}
