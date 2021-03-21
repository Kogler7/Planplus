import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectableItem extends StatefulWidget {
  SectableItem({
    Key key,
    @required this.title,
    this.tip = '',
    this.suHeight = 110,
    this.suWidth = 750,
    this.leadingIndex = 0,
    this.markIndex = 0,
    this.colorLeading = Colors.lightBlue,
    this.colorMark = Colors.yellow,
    this.colorBack = Colors.transparent,
    this.onPressed,
    this.onLongPressed,
    this.sected = false,
    this.shadowed = false,
    this.sizeFactor = 1.0,
  }) : super(key: key);

  final bool sected;
  final bool shadowed;
  final double sizeFactor;

  final String title;
  final String tip;

  final double suHeight;
  final double suWidth;

  final int leadingIndex;
  final int markIndex;

  final Color colorLeading;
  final Color colorMark;
  final Color colorBack;

  Function() onPressed = () {};
  Function() onLongPressed = () {};

  @override
  _SectableItemState createState() => _SectableItemState();
}

class _SectableItemState extends State<SectableItem> with SingleTickerProviderStateMixin {
  static List<IconData> _icons = [
    Icons.format_list_bulleted,
    Icons.delete_forever,
    Icons.star_border,
    Icons.star,
    Icons.alarm,
    Icons.access_time,
    Icons.add_circle_outline,
    Icons.assessment_outlined,
    Icons.assignment,
    Icons.cake,
    Icons.calendar_today_outlined,
    Icons.business_center_outlined,
  ];

  double _height;
  double _width;

  Color _bkColor;

  @override
  void initState() {
    _bkColor = widget.colorBack;
    super.initState();
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
                : BoxShadow(color: widget.colorBack)
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
                    });
                    Future.delayed(Duration(milliseconds: 300), () {
                      setState(() {
                        _bkColor = widget.colorBack;
                      });
                    });
                    widget.onPressed();
                  },
                ),
              ),
            ),
            IgnorePointer(
              child: Row(
                children: <Widget>[
                  widget.sected
                      ? Container(
                          height: _height,
                          width: 2,
                          margin: EdgeInsets.only(left: 20),
                          color: Colors.black12,
                        )
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  SizedBox(
                    height: _height,
                    width: _height,
                    child: widget.sizeFactor != 0
                        ? Icon(
                            _icons[widget.leadingIndex],
                            color: widget.colorLeading,
                          )
                        : Container(),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 16,color: Colors.black54),
                    ),
                  ),
                  widget.markIndex != 0
                      ? Icon(_icons[widget.markIndex], color: widget.colorMark)
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ),
                  SizedBox(
                    height: _height,
                    width: _height,
                    child: Center(
                      child: Text(
                        widget.tip != '' ? widget.tip : '0',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onLongPress: widget.onLongPressed,
    );
  }
}
