import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  double _height = 100;
  double _width = 300;

  @override
  Widget build(BuildContext context) {
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
              color: Colors.greenAccent,
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
