import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';

class SectionBar extends StatefulWidget {
  SectionBar({
    Key key,
    @required this.title,
    this.suHeight = 110,
    this.suWidth = 750,
    this.onPressed,
    this.onLongPressed,
    this.shadowed = false,
    this.sizeFactor = 1.0,
  }) : super(key: key);

  final bool shadowed;
  final double sizeFactor;

  final String title;

  final double suHeight;
  final double suWidth;

  Function() onPressed = () {};
  Function() onLongPressed = () {};

  @override
  _SectionBarState createState() => _SectionBarState();
}

class _SectionBarState extends State<SectionBar> with SingleTickerProviderStateMixin {
  double _height;
  double _width;

  int _duration = 200;

  bool _unfolded = false;

  AnimationController _controller;
  Animation<double> _animation;

  Color _bkColor = Colors.white;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_animation)..addListener(() {});
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          color: _bkColor,
          boxShadow: [
            widget.shadowed
                ? BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1.0,
                    blurRadius: 5.0,
                    offset: Offset(0, 0),
                  )
                : BoxShadow(color: Colors.white)
          ],
        ),
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _bkColor = Colors.black12;
                      _unfolded = !_unfolded;
                    });
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        _bkColor = Colors.white;
                      });
                      widget.onPressed();
                    });
                  },
                ),
              ),
            ),
            Row(
              children: <Widget>[
                IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: _unfolded ? 0.0 : 1.0,
                    duration: Duration(milliseconds: _duration),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: _duration),
                      height: _height,
                      width: _unfolded ? _height / 2 : _height,
                      child: Icon(
                        Icons.dns_rounded,
                        color: KColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IgnorePointer(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _unfolded ? 1.0 : 0.0,
                  duration: Duration(milliseconds: _duration),
                  child: SizedBox(
                    height: _height,
                    width: _height,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        type: MaterialType.circle,
                        clipBehavior: Clip.antiAlias,
                        child: Ink(
                          child: InkWell(
                            onTap: (){},
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  child: SizedBox(
                    height: _height,
                    width: _height,
                    child: TweenAnimationBuilder(
                      duration: Duration(milliseconds: _duration),
                      tween: Tween(begin: 0.0, end: _unfolded ? -1.57 : 0.0),
                      builder: (BuildContext ctx, value, Widget child) {
                        return Center(
                          child: Transform.rotate(
                            angle: value,
                            child: Icon(Icons.arrow_left, color: Colors.black54),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onLongPress: widget.onLongPressed,
    );
  }
}
