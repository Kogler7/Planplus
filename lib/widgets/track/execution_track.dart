import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_planplus/index.dart';

class ExecutionTrack extends StatefulWidget {
  ExecutionTrack({
    Key key,
    this.frameSzie,
    this.scrollStream,
  }) : super(key: key);
  final Size frameSzie;
  final StreamController scrollStream;

  @override
  _ExecutionTrackState createState() => _ExecutionTrackState();
}

class _ExecutionTrackState extends State<ExecutionTrack> {
  final _scrollController = ScrollController();

  void initState() {
    super.initState();
    widget.scrollStream.stream.listen((offset) {
      _scrollController.jumpTo(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    double radius = 25;
    return IgnorePointer(
      ignoring: false,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
        ),
        child: Material(
          child: Container(
            width: widget.frameSzie.width,
            height: widget.frameSzie.height,
            child: ListView(
              controller: _scrollController,
              children: [
                Column(
                  children: [
                    ExecutionState(
                      title: '高等数学',
                      subTitle: '定时',
                      finished: true,
                      progress: 1,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '高等代数',
                      subTitle: '定时',
                      finished: true,
                      progress: 1,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '大学物理',
                      subTitle: '定时',
                      finished: true,
                      progress: 1,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '英语演讲与辩论',
                      subTitle: '自动完成',
                      finished: true,
                      progress: 1,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '中午自习',
                      subTitle: '无任务量限制',
                      finished: true,
                      progress: 1,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '数学作业',
                      subTitle: '任务量未达标',
                      finished: false,
                      progress: 0.3,
                      hasQuery: false,
                    ),
                    ExecutionState(
                      title: '步道乐跑',
                      subTitle: '打卡成功',
                      finished: true,
                      progress: 1,
                      hasQuery: true,
                    ),
                    ExecutionState(
                      title: '自习时间',
                      subTitle: '正在进行',
                      finished: false,
                      progress: 0.5,
                      hasQuery: true,
                      running: true,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12, left: 20),
                  child: Text(
                    '抽象任务',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
                ExecutionState(
                  title: '每周读书计划',
                  subTitle: '目标：1000页《三体》',
                  finished: false,
                  progress: 0.6,
                  hasQuery: true,
                  running: true,
                ),
                ExecutionState(
                  title: '每周跑步计划',
                  subTitle: '目标：12公里',
                  finished: false,
                  progress: 0.3,
                  hasQuery: true,
                  running: true,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
