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
        borderRadius: BorderRadius.circular(16),
        child: Container(color: Colors.redAccent,),
      ),
    );
  }
}
