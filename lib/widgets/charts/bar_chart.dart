import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';

class FLBarChart extends StatefulWidget {
  @override
  _FLBarChartState createState() => _FLBarChartState();
}

class _FLBarChartState extends State<FLBarChart> {
  @override
  Widget build(BuildContext context) {
    return BluryListCard(
      title: '近七天任务完成量走向',
      titleLeading: Icon(
        Icons.equalizer,
        color: Colors.blue[500],
      ),
      children: [
        Container(
          width: 310,
          height: 220,
          padding: EdgeInsets.all(10),
          child: getBarChart(),
        ),
      ],
    );
  }
}

BarChart getBarChart(){
  return BarChart(BarChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.black12,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.black12,
          strokeWidth: 1,
        );
      },
    ),
  ));
}
