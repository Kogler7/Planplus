import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/index.dart';

class TrackView extends StatefulWidget {
  TrackView({Key key, this.initScale = 4, @required this.startTiming}) : super(key: key);

  final DateTime startTiming;
  final int initScale;

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  ///存储推荐的间隔时间值，用于[TimeRuler]刻度控制
  static const IntervalList = <int>[5, 10, 15, 20, 30, 45, 60, 90, 120, 150, 180, 240];

  final _scrollController = ScrollController();

  double _quarterHeight;
  int _scaleFactor = 4;

  @override
  void initState() {
    setScale(widget.initScale, init: true);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///根据[_scaleFactor]设置合适的尺寸
  void setScale(int scale, {bool init = false}) {
    assert(scale >= 0 && scale < 12);
    _scaleFactor = scale;
    //基础高度值（默认80）
    _quarterHeight = 1200 / IntervalList[scale];
    //时间间隔较长时，适度放大(线性)，但不超过160
    if (scale > 6) {
      double ratio = (scale - 6) / 5 + 1;
      _quarterHeight *= ratio;
    }
    if (!init) setState(() {});
  }

  @override
  Widget build(BuildContext ctx) {
    return Stack(
      children: [
        ///此处排布算法可能会导致不同设备产生难以预料的结果
        Padding(
          padding: EdgeInsets.only(left: 80, right: 30),
          child: PlanedTaskTrack(
            scrollController: _scrollController,
            quarterHeight: _quarterHeight,
            startTiming: widget.startTiming,
          ),
        ),
        TimeRuler(
          context: ctx,
          scrollController: _scrollController,
          quarterHeight: _quarterHeight,
          interval: IntervalList[_scaleFactor],
        ),
        ExecutionTrack(),
      ],
    );
  }
}
