import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_planplus/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeRuler extends StatefulWidget {
  final Size frameSize;

  final Stream timeStream = minutePeriodicStream;
  final StreamController scrollStream;

  final double quarterHeight;
  final int interval; //minutes

  TimeRuler({
    Key key,
    @required this.frameSize,
    @required this.quarterHeight,
    @required this.scrollStream,
    this.interval = 15,
  }) : super(key: key);

  @override
  _TimeRulerState createState() => _TimeRulerState();
}

class _TimeRulerState extends State<TimeRuler> {
  final _pointerMoveController = StreamController(); //指针控制流
  final _showVicePointerController = StreamController<bool>(); //副指针控制流
  final _scrollController = ScrollController();

  int _nowTime = 0; //当前时刻的分钟总数
  double _nowTimeOffset = 0; //当前时刻的偏移（绝对）

  int _itemCount;
  double _itemHeight;
  double _tipHeight = 15;
  double _tipPadding;
  double _pointerLeftPadding = 70;

  bool _isOnBack = false; //view是否在回返
  bool _isViceVisible = false; //用来记录其状态

  @override
  void initState() {
    super.initState();

    _itemCount = 24 * 60 ~/ widget.interval;
    _itemHeight = widget.quarterHeight / 15 * widget.interval;
    _tipPadding = _itemHeight - _tipHeight;

    widget.scrollStream.stream.listen((offset) {
      _scrollController.jumpTo(offset);
    });

    widget.timeStream.listen((value) {
      //更新当前时间
      getNowTime();
      //更新指针位置
      if (isPointerHidden()) viewCentralize();
      _pointerMoveController.sink.add(1);
    });

    _scrollController.addListener(() {
      //更新指针位置
      _pointerMoveController.sink.add(1);
      //决定是否显示vicePointer
      if (!_isOnBack && !_isViceVisible) {
        _showVicePointerController.sink.add(true);
        _isViceVisible = true;
      }
    });

    getNowTime();
    viewCentralize();
  }

  @override
  void dispose() {
    _pointerMoveController.close();
    _showVicePointerController.close();
    super.dispose();
  }

  void getNowTime() {
    var temp = DateTime.now();
    _nowTime = temp.minute + temp.hour * 60;
    //计算时刻偏移
    _nowTimeOffset = (_nowTime ~/ widget.interval) * _itemHeight + _nowTime % widget.interval / 15 * widget.quarterHeight;
  }

  String getTimeByIndex(int index) {
    var time = DateTime(0);
    var duration = Duration(minutes: widget.interval * index);
    time = time.add(duration);
    var hour = time.hour < 10 ? '0' + time.hour.toString() : time.hour.toString();
    var minute = time.minute < 10 ? '0' + time.minute.toString() : time.minute.toString();
    return '$hour:$minute';
  }

  double getCentralizedOffset() => _nowTimeOffset - widget.frameSize.height / 2;

  double getPointerOffset() => _nowTimeOffset - _scrollController.offset;

  bool isPointerHidden() {
    double temp = getPointerOffset();
    return temp < 0 || temp > widget.frameSize.height;
  }

  void viewCentralize() {
    _isOnBack = true;

    ///加入事件循环，延后执行
    Future(() => ScrollRequest(
          target: getCentralizedOffset(),
          onFinished: () {
            _isOnBack = false;
            _showVicePointerController.sink.add(false);
            _isViceVisible = false;
          },
        ).dispatch(context));
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
            ///此处回弹范围不足，时区的顶部和底部有选择盲区
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: _itemCount,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20, bottom: _tipPadding),
                child: SizedBox(
                  height: _tipHeight,
                  child: Text(getTimeByIndex(index)),
                ),
              );
            },
          ),
          StreamBuilder(
            stream: _pointerMoveController.stream,
            builder: (ctx, snapshot) {
              return Positioned(
                top: getPointerOffset(),
                left: _pointerLeftPadding,
                child: Pointer(
                  height: _tipHeight,
                  color: Colors.red,
                ),
              );
            },
          ),
          StreamBuilder(
            stream: _showVicePointerController.stream,
            initialData: false,
            builder: (ctx, snap) {
              return Positioned(
                top: widget.frameSize.height / 2,
                left: _pointerLeftPadding,
                child: Pointer(
                  height: _tipHeight,
                  color: Colors.lightGreenAccent,
                  visible: snap.data,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Pointer extends StatelessWidget {
  final double height;
  final Color color;
  final bool visible;

  Pointer({
    this.height = 20,
    this.color = Colors.red,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 560.w,
      child: Visibility(
        visible: visible,
        child: Row(
          children: [
            Container(
              height: height * 2 / 3,
              width: height * 2 / 3,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Divider(
                height: height,
                thickness: height / 10,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollRequest extends Notification {
  final double target;
  final Function() onFinished;

  ScrollRequest({this.target, this.onFinished});
}
