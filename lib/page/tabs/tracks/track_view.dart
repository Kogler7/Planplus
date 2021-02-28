import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/index.dart';

class TrackView extends StatefulWidget {
  TrackView({Key key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 70, right: 30),
          child: Container(color: Colors.lightGreen),
        ),
        TimeRuler(
          context: ctx,
          scrollController: _scrollController,
          quarterHeight: 30,
          interval: 30,
        ),
        ExecutionTrack(),
      ],
    );
  }
}
