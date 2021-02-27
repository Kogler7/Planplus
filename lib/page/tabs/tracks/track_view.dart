import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/index.dart';

class TaskSpan extends StatefulWidget {
  TaskSpan({Key key}) : super(key: key);

  @override
  _TaskSpanState createState() => _TaskSpanState();
}

class _TaskSpanState extends State<TaskSpan> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TimeRuler(),
        PlanTrack(),
        ExecutionTrack(),
      ],
    );
  }
}
