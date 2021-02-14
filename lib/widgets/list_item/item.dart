import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:flutter_planplus/utils/index.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget({
    Key key,
    @required this.title,
    this.subTitle = '',
    this.suHeight = 145,
    this.suWidth = 750,
    this.leadingIndex = 0,
    this.taleIndex = 0,
    this.leftIndex = 0,
    this.rightIndex = 0,
    this.colorLeft = Colors.yellow,
    this.colorRight = Colors.red,
    this.onPressed,
    this.onLongPressed,
    this.onLongPressEnd,
    this.onLeftPressed,
    this.onRightPressed,
    this.onLTRDrived,
    this.onRTLDrived,
    this.locked = false,
    this.sizeFactor = 1.0,
  }) : super(key: key);

  final bool locked;
  final double sizeFactor;

  final String title;
  final String subTitle;

  final double suHeight;
  final double suWidth;

  final int leadingIndex;
  final int taleIndex;
  final int leftIndex;
  final int rightIndex;

  final Color colorLeft;
  final Color colorRight;

  Function() onPressed = () {};
  Function() onLongPressed = () {};
  Function(LongPressEndDetails) onLongPressEnd = (LongPressEndDetails) {};
  Function() onLTRDrived = () {};
  Function() onRTLDrived = () {};
  Function() onLeftPressed = () {};
  Function() onRightPressed = () {};

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> with SingleTickerProviderStateMixin {
  List<IconData> iconLeading = [
    Icons.radio_button_unchecked,
    Icons.radio_button_checked,
    Icons.check_circle,
  ];
  List<IconData> iconTale = [
    Icons.send,
    Icons.close,
  ];
  List<IconData> iconLeft = [
    Icons.star,
  ];
  List<IconData> iconRight = [
    Icons.delete,
  ];
  double _height;
  double _width;
  double _xVal = 0;
  double _nowX = 0;
  double _dx = 0;
  double _radius = 0;
  bool _rightWard = false;
  bool _chosed = false;
  bool _backWard = false;

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_animation)
      ..addListener(() {
        setState(() {
          if (_chosed)
            _xVal = ((1.0 - _animation.value) * (720.w - _nowX.abs()) + _nowX.abs()) * (_rightWard ? 1 : -1);
          else
            _xVal = _animation.value * _nowX;
        });
      });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && _chosed) {
        _nowX = _xVal;
        _chosed = false;
        _backWard = true;
        _controller.reset();
        _controller.forward();
        if (_rightWard)
          widget.onLTRDrived;
        else
          widget.onRTLDrived;
      } else if (status == AnimationStatus.completed && _backWard) _backWard = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = ScreenUtil().setWidth(widget.suHeight) * widget.sizeFactor;
    _width = ScreenUtil().setWidth(widget.suWidth) * widget.sizeFactor;
    _radius = _backWard
        ? 400.0
        : _xVal.abs() > 280.0.w
            ? (_xVal.abs() - 280.0.w) * 2.6
            : 0;
    return SizedBox(
      height: _height,
      width: _width,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Container(decoration: BoxDecoration(color: Colors.black12)),
                  Positioned(
                    child: Container(
                      height: _radius * 2,
                      width: _radius * 2,
                      decoration: BoxDecoration(
                        color: _rightWard ? widget.colorLeft : widget.colorRight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    left: _rightWard ? _xVal - _radius - 36 : null,
                    right: _rightWard ? null : _xVal.abs() - _radius - 36,
                    top: _height / 2 - _radius - 3,
                  ),
                  Positioned(
                    child: Icon(
                      _rightWard ? iconLeft[widget.leftIndex] : iconRight[widget.rightIndex],
                      color: Colors.white,
                    ),
                    left: _rightWard ? _xVal - 48.0 : null,
                    right: _rightWard ? null : _xVal.abs() - 48.0,
                    top: _height / 2 - 15.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 710.w,
                height: _height > 11.w ? _height - 11.w : 0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1.0,
                      blurRadius: 5.0,
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 5.5.w),
                child: Stack(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Ink(
                        child: InkWell(
                          onTap: widget.onPressed,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Material(
                          child: IconButton(
                            icon: Icon(iconLeading[widget.leadingIndex], color: Colors.black54),
                            onPressed: widget.onLeftPressed,
                            iconSize: 60.w,
                          ),
                          color: Colors.transparent,
                          type: MaterialType.circle,
                          clipBehavior: Clip.antiAlias,
                        ),
                        Expanded(
                          child: IgnorePointer(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(fontSize: 16),
                                ),
                                widget.subTitle != ''
                                    ? Text(
                                        widget.subTitle,
                                        style: TextStyle(fontSize: 10, color: Colors.black54),
                                      )
                                    : SizedBox(width: 0, height: 0)
                              ],
                            ),
                          ),
                        ),
                        Material(
                          child: IconButton(
                            icon: Icon(iconTale[widget.taleIndex], color: Colors.black54),
                            onPressed: widget.onRightPressed,
                            iconSize: 36.w,
                          ),
                          color: Colors.transparent,
                          type: MaterialType.circle,
                          clipBehavior: Clip.antiAlias,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onPanDown: (DragDownDetails e) {
                _controller.reset();
                _xVal = 0;
              },
              onPanUpdate: (DragUpdateDetails e) {
                if (!widget.locked) {
                  _dx += e.delta.dx;
                  _rightWard = _dx > 0 ? true : false;
                  setState(() {
                    _xVal += e.delta.dx;
                  });
                }
              },
              onPanEnd: (DragEndDetails e) {
                if (!widget.locked) {
                  _rightWard = _dx > 0 ? true : false;
                  _dx = 0;
                  _nowX = _xVal;
                  if (_radius > _height / 2)
                    _chosed = true;
                  else
                    _chosed = false;
                  _controller.forward();
                }
              },
              onLongPress: widget.onLongPressed,
              onLongPressEnd: widget.onLongPressEnd,
            ),
            left: _xVal + 20.0.w,
          ),
        ],
      ),
    );
  }
}

class ItemLongPressedNote extends Notification {
  final int index;

  ItemLongPressedNote(this.index);
}
