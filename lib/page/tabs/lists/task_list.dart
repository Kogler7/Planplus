import 'package:flutter/material.dart';
import 'list.dart';
import 'package:flutter_planplus/widgets/index.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SectionBar(
        title: 'Bar',
      ),
    );
  }
}
