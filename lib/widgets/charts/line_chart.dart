import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';

class FLLineChart extends StatefulWidget {
  @override
  _FLLineChartState createState() => _FLLineChartState();
}

class _FLLineChartState extends State<FLLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return BluryListCard(
      title: '近七天执行力统计',
      titleLeading: Icon(
        Icons.timeline_rounded,
        color: Colors.blue[500],
      ),
      children: [
        Container(
          width: 310,
          height: 220,
          padding: EdgeInsets.all(10),
          child: getLineChart(),
        ),
      ],
    );
  }

  LineChart getLineChart() {
    return LineChart(LineChartData(
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
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
          getTitles: (value) {
            if (value.toInt() == 6)
              return '今日';
            else
              return (7 - value).toInt().toString() + '日';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 3:
                return '3';
              case 5:
                return '5';
            }
            return '';
          },
          reservedSize: 0,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: linesBarData(),
    ));
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(1, 2),
          FlSpot(2, 5),
          FlSpot(3, 3),
          FlSpot(4, 4),
          FlSpot(5, 5),
          FlSpot(6, 2),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
      LineChartBarData(
        spots: [
          FlSpot(0, 1),
          FlSpot(1, 3),
          FlSpot(2, 2),
          FlSpot(3, 5),
          FlSpot(4, 2),
          FlSpot(5, 1),
          FlSpot(6, 6),
        ],
        isCurved: true,
        colors: [
          const Color(0xffaa4cfc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors.map((color) => color.withOpacity(0.7)).toList(),
        ),
      ),
    ];
  }
}
