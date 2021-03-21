import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/widgets/querys/single_option.dart';

enum TaskState {
  waiting,
  executing,
  done,
  failed,
}

class TaskTile extends StatefulWidget {
  TaskState state;
  final String title;
  final String subtitle;
  final List<String> subTasks;
  final double span;

  TaskTile({
    this.state,
    this.title = '任务',
    this.subtitle = '副标题',
    this.subTasks,
    this.span = 100,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  double _height;
  double _width = 300;
  Color _headColor;

  @override
  Widget build(BuildContext context) {
    _height = widget.span;
    _headColor = KColor.taskTileHeadColors[widget.state.index];
    if (widget.subTasks != null) _height += (widget.subTasks.length * 60).toDouble();
    return Container(
      height: _height,
      width: _width,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                color: _headColor,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  widget.subtitle,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(icon: Icon(Icons.radio_button_unchecked), onPressed: () {}),
                        ],
                      ),
                    ),
                    ...List.generate(
                      widget.subTasks.length ?? 0,
                      (index) {
                        return SingleQueryOption(
                          text: widget.subTasks[index],
                          hasDivider: index == widget.subTasks.length - 1 ? false : true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
