import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:flutter_planplus/utils/index.dart';

class Item extends StatefulWidget {
  Item({Key key}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> with SingleTickerProviderStateMixin {
  double _height = 135.0.w;
  double _xVal = 0;
  double _nowX = 0;
  double _dx = 0;
  double _radius = 0;
  bool _rightWard = false;
  bool _choosed = false;

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
          if (_choosed)
            _xVal = ((1.0 - _animation.value) * (720.w - _nowX.abs()) + _nowX.abs()) * (_rightWard ? 1 : -1);
          else
            _xVal = _animation.value * _nowX;
        });
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
    _radius = _xVal.abs() > 280.0.w ? (_xVal.abs() - 280.0.w) * 3.5 : 0;
    return SizedBox(
      height: _height,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: <Widget>[
                  Container(decoration: BoxDecoration(color: Colors.black12)),
                  Positioned(
                    child: Container(
                      height: _radius * 2,
                      width: _radius * 2,
                      decoration: BoxDecoration(
                        color: _rightWard ? Colors.blueAccent : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    left: _rightWard ? _xVal - _radius - 36 : null,
                    right: _rightWard ? null : _xVal.abs() - _radius - 36,
                    top: _height / 2 - _radius - 3,
                  ),
                  Positioned(
                    child: IconButton(
                      icon: Icon(_rightWard ? Icons.star : Icons.delete),
                      onPressed: () {
                        setState(() {
                          _xVal = 0;
                        });
                      },
                      color: Colors.white,
                    ),
                    left: _rightWard ? _xVal - 60.0 : null,
                    right: _rightWard ? null : _xVal.abs() - 60.0,
                    top: _height / 2 - 27.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              child: Container(
                width: 710.w,
                height: _height - 11.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.5.w),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.radio_button_unchecked, color: Colors.black54),
                      onPressed: () {},
                      iconSize: 60.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '写作业',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '日期：2021年2月13日；已标记',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.black54),
                      onPressed: () {},
                      iconSize: 36.w,
                    ),
                  ],
                ),
              ),
              onTap: (){
                ToastUtil.showBtmToast('已选择');
              },
              onPanDown: (DragDownDetails e) {
                _controller.reset();
                _xVal = 0;
              },
              onPanUpdate: (DragUpdateDetails e) {
                _dx += e.delta.dx;
                _rightWard = _dx > 0 ? true : false;
                setState(() {
                  _xVal += e.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails e) {
                _rightWard = _dx > 0 ? true : false;
                _dx = 0;
                _nowX = _xVal;
                if (_radius > _height / 2)
                  _choosed = true;
                else
                  _choosed = false;
                _controller.forward();
              },
            ),
            left: _xVal + 20.0.w,
          ),
        ],
      ),
    );
  }
}
