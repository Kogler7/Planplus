import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/index.dart';

class TrackView extends StatefulWidget {
  TrackView({
    Key key,
    this.initScale = 4,
    @required this.startTiming,
    @required this.context,
  }) : super(key: key);

  final DateTime startTiming;
  final int initScale;

  final BuildContext context;

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  ///存储推荐的间隔时间值，用于[TimeRuler]刻度控制
  static const IntervalList = <int>[5, 10, 15, 20, 30, 45, 60, 90, 120, 150, 180, 240];

  final _scrollController = ScrollController(); //滑动控制器
  final _scrollStream = StreamController.broadcast(); //滑动通知

  double _quarterHeight;
  double _totalHeight;
  int _scaleFactor = 4;
  var _frameSize = Size(360, 610);

  @override
  void initState() {
    setScale(widget.initScale, init: true);
    //将scrollStream与scrollController相关联,实时传递位置数据
    _scrollController.addListener(() {
      _scrollStream.sink.add(_scrollController.offset);
    });
    //延迟获取控件排布尺寸
    Future.delayed(Duration(milliseconds: 200), () => _frameSize = widget.context.size);
    super.initState();
  }

  void animateTo(double offset, Function() then) {
    _scrollController
        .animateTo(
      offset,
      duration: Duration(milliseconds: 700),
      curve: Curves.decelerate,
    )
        .then((value) {
      then();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollStream.close();
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
    _totalHeight = _quarterHeight * 96;
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
            scrollStream: _scrollStream,
            quarterHeight: _quarterHeight,
            startTiming: widget.startTiming,
          ),
        ),
        NotificationListener(
          child: TimeRuler(
            frameSize: _frameSize,
            scrollStream: _scrollStream,
            quarterHeight: _quarterHeight,
            interval: IntervalList[_scaleFactor],
          ),
          onNotification: (ScrollRequest note) {
            animateTo(note.target, note.onFinished);
            return false; //阻止继续向上冒泡
          },
        ),
        Positioned(
          child: ExecutionTrack(
            scrollStream: _scrollStream,
            frameSzie: _frameSize,
          ),
          left: 200,
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: _totalHeight,
            )
          ],
          controller: _scrollController,
        )
      ],
    );
  }
}
