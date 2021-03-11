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

  Widget abstractTaskTrackBuilder() {
    return Stack();
  }

  Widget taskLayoutTrackBuilder() {
    return ListView.builder(
      //controller: widget.scrollController,
      itemCount: 5,
      itemBuilder: (ctx, index) => TaskTile(),
    );
  }

  Widget triggersTrackBuilder() {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (ctx, index) => Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        abstractTaskTrackBuilder(),
        taskLayoutTrackBuilder(),
        triggersTrackBuilder(),
      ],
    );
  }
}
