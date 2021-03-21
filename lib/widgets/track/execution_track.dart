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
    return IgnorePointer(
      child: Container(
        color: Colors.white12,
        width: widget.frameSzie.width,
        height: widget.frameSzie.height,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 100,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
