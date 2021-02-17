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
    this.shadowed = false,
    this.unfolded = false,
    this.sizeFactor = 1.0,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  final bool shadowed;
  final bool unfolded;
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

  int _duration = 300;

  bool _unfolded;

  Color _bkColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    _height = ScreenUtil().setWidth(widget.suHeight) * widget.sizeFactor;
    _width = ScreenUtil().setWidth(widget.suWidth) * widget.sizeFactor;
    _unfolded = widget.unfolded;
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
                    });
                    widget.onPressed();
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
                      curve: Curves.easeInOut,
                      height: _height,
                      width: _unfolded ? _height / 3 : _height,
                      child: widget.sizeFactor != 0
                          ? Icon(
                              Icons.dns_rounded,
                              color: KColor.primaryColor,
                            )
                          : Container(),
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
                            onTap: () {},
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
                      curve: Curves.easeInOut,
                      builder: (BuildContext ctx, value, Widget child) {
                        return Center(
                          child: Transform.rotate(
                            angle: value,
                            child: widget.sizeFactor != 0 ? Icon(Icons.keyboard_arrow_left, color: Colors.black54) : Container(),
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
