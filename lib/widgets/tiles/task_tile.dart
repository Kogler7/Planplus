import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';

enum TaskState {
  waiting,
  executing,
  done,
  failed,
}

class TaskTile extends StatefulWidget {
  TaskState taskState;

  TaskTile({this.taskState});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  double _height = 100;
  double _width = 300;
  Color _headColor;

  @override
  Widget build(BuildContext context) {
    _headColor = KColor.taskTileHeadColors[widget.taskState.index];
    return Container(
      height: _height,
      width: _width,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Container(
              width: 10,
              color: _headColor,
            ),
            Expanded(
              child: Container(
                color: Colors.yellow.withOpacity(0.4),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('data'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
