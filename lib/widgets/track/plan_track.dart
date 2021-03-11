import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';

class PlanedTaskTrack extends StatefulWidget {
  PlanedTaskTrack({
    Key key,
    @required this.scrollStream,
    @required this.startTiming,
    @required this.quarterHeight,
  }) : super(key: key);

  final DateTime startTiming;
  final double quarterHeight;

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
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Container(
            height: 500,
            color: Colors.red.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget taskLayoutTrackBuilder() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 35,
      itemBuilder: (ctx, index) => Padding(
        padding: EdgeInsets.only(top: 20),
        child: TaskTile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        abstractTaskTrackBuilder(),
        taskLayoutTrackBuilder(),
      ],
    );
  }
}
