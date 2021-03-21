import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'dart:math';

class TimeSpanSelector extends StatefulWidget {
  final double height;

  TimeSpanSelector({@required this.height});

  @override
  _TimeSpanSelectorState createState() => _TimeSpanSelectorState();
}

class _TimeSpanSelectorState extends State<TimeSpanSelector> {
  Offset _centerOffset;
  Offset _lastPos;

  CenterCoord _centerCoord = CenterCoord(0, 0);
  Rect _outerRect;
  double _outerRadius;
  double _innerRadius;

  double _startAngle = 0;
  double _endingAngle = pi / 3;

  HitState _hitState = HitState.none;

  @override
  void initState() {
    _outerRadius = widget.height / 2 - 10;
    _innerRadius = _outerRadius / 5 * 3;
    _centerOffset = Offset(widget.height / 2 - 10, widget.height / 2 - 10);
    _outerRect = Rect.fromCircle(center: _centerOffset, radius: _outerRadius / 6 * 5 - 5);
    CenterCoord.centerOffset = _centerOffset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            height: widget.height - 20,
            child: Row(
              children: [
                Listener(
                  child: Container(
                    width: _outerRadius * 2,
                    height: _outerRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: _innerRadius * 2,
                            height: _innerRadius * 2,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.grey[400],
                              ),
                            ]),
                            child: DefaultTextStyle(
                              style: TextStyle(color: Colors.black54),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, -0.85),
                                    child: Text('00:00'),
                                  ),
                                  Align(
                                    alignment: Alignment(0.8, 0),
                                    child: Text('03:00'),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.8, 0),
                                    child: Text('09:00'),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0.85),
                                    child: Text('06:00'),
                                  ),
                                  CustomPaint(
                                    size: Size(_innerRadius * 2, _innerRadius * 2),
                                    painter: DialPainter(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomPaint(
                          size: Size(_outerRadius * 2, _outerRadius * 2),
                          painter: SpanPainter(
                            rect: _outerRect,
                            startAngle: _startAngle,
                            endingAngle: _endingAngle,
                            strokeWidth: _outerRadius / 3 - 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  onPointerDown: (e) {
                    ///命中测试（低效算法）
                    RenderBox box = context.findRenderObject();
                    var pos = box.globalToLocal(e.position);
                    _lastPos = pos;
                    var hitPolar = PolarCoord.from(CenterCoord.of(pos));
                    var distance = hitPolar.distance;
                    if (distance >= _outerRadius / 5 * 3 && distance <= _outerRadius) {
                      var angle = hitPolar.direction;
                      var alpha = pi / 12;
                      var hitList = <double>[
                        _startAngle - alpha,
                        _startAngle + alpha,
                        _endingAngle - alpha,
                        _endingAngle + alpha,
                      ];
                      if (angle >= hitList[0]) {
                        if (angle <= hitList[1])
                          _hitState = HitState.head;
                        else if (angle <= hitList[2])
                          _hitState = HitState.body;
                        else if (angle <= hitList[3])
                          _hitState = HitState.tail;
                        else
                          _hitState = HitState.none;
                      }
                      print('${_hitState.toString()}::'
                          '${hitPolar.direction.toStringAsFixed(3)} '
                          '(${hitList[0].toStringAsFixed(3)},${hitList[3].toStringAsFixed(3)}); '
                          'Sweep:${(hitList[3] - hitList[0]).toStringAsFixed(3)}; '
                          'distance:${hitPolar.distance.toStringAsFixed(3)}');
                    }
                  },
                  onPointerMove: (e) {
                    ///移动（低效算法）
                    RenderBox box = context.findRenderObject();
                    var pos = box.globalToLocal(e.position);
                    print('{${_startAngle.toStringAsFixed(3)},${_endingAngle.toStringAsFixed(3)}}');
                    switch (_hitState) {
                      case HitState.none:
                        break;
                      case HitState.head:
                        int rounds = (_startAngle % pi).toInt();
                        _startAngle = PolarCoord.from(CenterCoord.of(pos)).direction + rounds * pi;
                        break;
                      case HitState.body:
                        if (e.delta.dx != 0 && e.delta.dy != 0) {
                          double delta = PolarCoord.from(CenterCoord.of(pos)).direction - PolarCoord.from(CenterCoord.of(_lastPos)).direction;
                          _startAngle += delta;
                          _endingAngle += delta;
                        }
                        break;
                      case HitState.tail:
                        int rounds = (_startAngle % pi).toInt();
                        _endingAngle = PolarCoord.from(CenterCoord.of(pos)).direction + rounds * pi;
                        break;
                    }
                    _lastPos = pos;
                    setState(() {});
                  },
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      width: 20,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum HitState {
  head,
  body,
  tail,
  none,
}

class DialPainter extends CustomPainter {
  Offset _centerOffset;

  @override
  void paint(Canvas canvas, Size size) {
    ///此处代码有待优化
    _centerOffset = Offset(size.width / 2, size.height / 2);
    Offset temp = CenterCoord.centerOffset;
    CenterCoord.centerOffset = _centerOffset;
    var paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 60; i++) {
      var polar1 = PolarCoord(i * pi / 30, size.height / 2 - 2);
      var polar2 = PolarCoord(i * pi / 30, size.height / 2 - (i % 5 == 0 ? 8 : 4));
      canvas.drawLine(CenterCoord.from(polar1).offset, CenterCoord.from(polar2).offset, paint);
    }
    CenterCoord.centerOffset = temp;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///SpanPainter
class SpanPainter extends CustomPainter {
  Rect rect;
  double strokeWidth;
  double startAngle;
  double endingAngle;

  SpanPainter({
    this.rect,
    this.strokeWidth,
    this.startAngle,
    this.endingAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black38
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    double sweepAngle = endingAngle - startAngle;
    startAngle -= pi / 2;
    assert(sweepAngle > 0, 'SpanPainter: SweepAngle <= 0');
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    paint.color = Colors.white;
    paint.strokeWidth -= 4;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PolarCoord {
  double direction;
  double distance;

  static double angleDiff = -pi / 2;

  PolarCoord(this.direction, this.distance);

  PolarCoord.from(CenterCoord coord) {
    var temp = Offset(coord.x, coord.y);
    distance = temp.distance;
    var dirc = temp.direction;
    //角度坐标转换（转折点精度有待提高）
    if (dirc < 0) dirc += 2 * pi;
    if (dirc >= 1.5 * pi)
      direction = dirc - 1.5 * pi;
    else
      direction = dirc - angleDiff;
  }

  double get angle => direction + angleDiff;
}

class CenterCoord {
  double x;
  double y;

  static var centerOffset = Offset(155, 155);

  CenterCoord(this.x, this.y);

  CenterCoord.of(Offset offset) {
    x = offset.dx - centerOffset.dx;
    y = offset.dy - centerOffset.dy;
  }

  CenterCoord.centerOf(Offset offset) {
    x = offset.dx;
    y = offset.dy;
  }

  CenterCoord.from(PolarCoord polar) {
    x = polar.distance * sin(polar.direction);
    y = -polar.distance * cos(polar.direction);
  }

  Offset get offset => Offset(centerOffset.dx + x, centerOffset.dy + y);
}
