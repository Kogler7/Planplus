import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';

class PlanedTaskTrack extends StatefulWidget {
  PlanedTaskTrack({
    Key key,
    @required this.scrollStream,
    @required this.startTiming,
    @required this.quarterHeight,
    @required this.totalHeight,
  }) : super(key: key);

  final DateTime startTiming;
  final double quarterHeight;
  final double totalHeight;

  final StreamController scrollStream;

  @override
  _PlanedTaskTrackState createState() => _PlanedTaskTrackState();
}

class _PlanedTaskTrackState extends State<PlanedTaskTrack> {
  final _scrollController = ScrollController();

  void initState() {
    super.initState();
    widget.scrollStream.stream.listen((offset) {
      _scrollController.jumpTo(offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget abstractTaskTrackBuilder() {
    return StreamBuilder(
        stream: widget.scrollStream.stream,
        initialData: 0.0,
        builder: (ctx, snap) {
          return Stack(
            children: [
              ...List.generate(
                tempAbstractList.length,
                (index) => Positioned(
                  left: 10,
                  right: 0,
                  top: tempAbstractList[index].padding,
                  child: Container(
                    color: tempAbstractList[index].color.withOpacity(0.3),
                    height: tempAbstractList[index].span,
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget taskLayoutTrackBuilder() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: tempTasks.length,
      itemBuilder: (ctx, index) {
        if (index < tempTasks.length)
          return Padding(
            padding: EdgeInsets.only(top: tempTasks[index].padding),
            child: TaskTile(
              title: tempTasks[index].title,
              subtitle: tempTasks[index].subTitle,
              subTasks: tempTasks[index].subTasks,
              state: tempTasks[index].state,
              span: tempTasks[index].span,
            ),
          );
        else
          return Padding(
            padding: EdgeInsets.only(top: 1000),
            child: TaskTile(),
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          abstractTaskTrackBuilder(),
          taskLayoutTrackBuilder(),
        ],
      ),
    );
  }
}

class AbstractTempTaskLayout {
  final double padding;
  final double span;
  Color color;

  AbstractTempTaskLayout({
    this.padding = 20,
    this.span = 100,
    this.color,
  }) {
    color = color ?? KRndColor.newColor;
  }
}

class TempTaskLayout {
  final String title;
  final String subTitle;
  final List<String> subTasks;
  final TaskState state;
  final double padding;
  final double span;

  TempTaskLayout({
    this.title = '任务',
    this.subTitle = '',
    this.state = TaskState.waiting,
    this.subTasks,
    this.padding = 20,
    this.span = 100,
  });
}

List<TempTaskLayout> tempTasks = <TempTaskLayout>[
  TempTaskLayout(
    title: '英语试卷',
    subTitle: '继承自：三月刷题计划；共享：套卷数量',
    padding: 90,
    subTasks: [],
    state: TaskState.done,
    span: 150,
  ),
  TempTaskLayout(
    title: '临时番茄任务',
    subTitle: '使用模板：番茄任务',
    padding: 70,
    subTasks: [],
    state: TaskState.failed,
    span: 100,
  ),
  TempTaskLayout(
    title: '高等数学',
    subTitle: 'SX202，重复：每周一、四',
    padding: 110,
    subTasks: [],
    state: TaskState.executing,
    span: 200,
  ),
  TempTaskLayout(
    title: '每日读书',
    subTitle: '继承自：每周读书计划；共享：页数目标',
    padding: 240,
    subTasks: [],
    state: TaskState.waiting,
    span: 80,
  ),
  TempTaskLayout(
    title: '艾宾浩斯复习任务',
    subTitle: '附带模板：艾宾浩斯子任务',
    padding: 320,
    subTasks: [
      '百词计划：1',
      '百词计划：2',
      '百词计划：3',
      '百词计划：4',
      '百词计划：5',
    ],
    state: TaskState.waiting,
    span: 70,
  ),
];

List<AbstractTempTaskLayout> tempAbstractList = <AbstractTempTaskLayout>[
  AbstractTempTaskLayout(
    padding: 0,
    span: 2000,
  ),
  AbstractTempTaskLayout(
    padding: 100,
    span: 200,
  ),
  AbstractTempTaskLayout(
    padding: 600,
    span: 300,
  ),
  AbstractTempTaskLayout(
    padding: 1000,
    span: 500,
  ),
];
