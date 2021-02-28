import 'package:flutter/material.dart';

class TimedSpan {
  var time = DateTime.now();
  var span = Duration(minutes: 5);

  TimedSpan({this.time, this.span});
}

class LimitedSpan {
  var plus = Duration(days: 1);
  var minus = Duration(days: 1);

  LimitedSpan({
    this.plus,
    this.minus,
  });

  bool get isTight => (plus == Duration.zero && minus == Duration.zero);

  void tighten() {
    plus = Duration.zero;
    minus = Duration.zero;
  }
}

enum TimeRigid {
  total,
  none,
  span,
  start,
  end,
}

class TimeConstraint {
  LimitedSpan startLimit;
  LimitedSpan endLimit;
  LimitedSpan spanLimit;

  TimeRigid timeRigid = TimeRigid.none;

  TimeConstraint({
    this.startLimit,
    this.endLimit,
    this.spanLimit,
    this.timeRigid,
  }) {
    ///rigid判断
    if (timeRigid == TimeRigid.total) {
      startLimit.tighten();
      endLimit.tighten();
      spanLimit.tighten();
    } else {
      //三个参数只接受一个，按顺序判断，其余无效
      if (timeRigid == TimeRigid.span)
        spanLimit.tighten();
      else if (timeRigid == TimeRigid.start)
        startLimit.tighten();
      else if (timeRigid == TimeRigid.end) endLimit.tighten();
    }
  }

  //设置，无冲突为true，有冲突为false，优先解决冲突
  ///尚未完成
  bool setByStart(LimitedSpan sp) {
    if (timeRigid == TimeRigid.start) return false;
  }

  bool setByEnd(LimitedSpan sp) {
    if (timeRigid == TimeRigid.end) return false;
  }

  bool setBySpan(LimitedSpan sp) {
    if (timeRigid == TimeRigid.span) return false;
  }
}

///Timing
class Timing {
  var timeSpan = TimedSpan();
  var timeConstraint = TimeConstraint();

  Timing({
    this.timeSpan,
    this.timeConstraint,
  });

  void adjust() {}

  void cut() {}
}

class Viewport {
  var timeSpan = TimedSpan();
  double quarterHeight;

  Viewport({
    this.timeSpan,
    this.quarterHeight,
  });
}

class SpaceAllocator {
  var _list = <TimedSpan>[];
}
