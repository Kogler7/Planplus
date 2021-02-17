import 'package:flutter/material.dart';
import 'list.dart';
import 'package:flutter_planplus/model/index.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return ListPage(groups: KGroupBase.taskGroups);
  }
}
