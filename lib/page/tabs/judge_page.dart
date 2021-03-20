import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/charts/bar_chart.dart';
import 'package:flutter_planplus/widgets/charts/line_chart.dart';
import 'package:flutter_planplus/widgets/charts/pie_chart.dart';

class JudgePage extends StatefulWidget {
  JudgePage({Key key}) : super(key: key);

  @override
  _JudgePageState createState() => _JudgePageState();
}

class _JudgePageState extends State<JudgePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        FLLineChart(),
        FLPieChart(),
        FLBarChart(),
      ],
    );
  }
}
