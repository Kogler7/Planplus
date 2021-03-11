import 'package:flutter/material.dart';
import 'dart:async';

class ExecutionTrack extends StatefulWidget {
  ExecutionTrack({Key key, this.frameSzie,this.scrollStream}) : super(key: key);
  final Size frameSzie;
  final StreamController scrollStream;

  @override
  _ExecutionTrackState createState() => _ExecutionTrackState();
}

class _ExecutionTrackState extends State<ExecutionTrack> {
  final _scrollController= ScrollController();
  void initState() {
    super.initState();
    widget.scrollStream.stream.listen((offset) {
      _scrollController.jumpTo(offset);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: widget.frameSzie.width,
      height: widget.frameSzie.height,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 30,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: 100,
              height: 50,
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
