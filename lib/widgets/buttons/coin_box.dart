import 'package:flutter/material.dart';

class CoinBoxButton extends StatelessWidget {
  //按钮高度
  final double height;

  //按钮上的文字
  final String label;

  //是否填充背景
  final bool bordered;

  //点击事件回调
  final GestureTapCallback onTap;

  CoinBoxButton({
    Key key,
    @required this.label,
    this.bordered = false,
    this.height = 50,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        //边框
        decoration: BoxDecoration(
          //定义填充颜色
          color: bordered ? Colors.white : Theme.of(context).accentColor,
          //点击事件高亮的边框圆角
          borderRadius: BorderRadius.circular(10),
          //边框设置
          border: bordered
              ? Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        //事件监听回调
        child: buildInkWell(context),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      //事件回调
      onTap: onTap,
      //点击的水波纹与高亮颜色 与Ink设置的背景圆角一致
      borderRadius: BorderRadius.circular(10),
      //按钮样式
      child: Container(
        height: height,
        child: Center(
          child: Text(
            //文本内容
            label,
            //文本样式
            style: TextStyle(
              //文本颜色
              color: bordered ? Theme.of(context).accentColor : Colors.white,
              //加粗
              fontWeight: FontWeight.w600,
              //文字大小
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
