import 'package:flutter/material.dart';

class TextQueryBlank extends StatelessWidget {
  //高度
  final double height;

  //提示文本
  final String hintText;
  final String helperText;

  //输入实时回调
  final Function(String) onChanged;

  final int maxLines;
  final int maxLength;
  final double basicPadding;
  final double circular;

  TextQueryBlank({
    Key key,
    this.height = 80,
    this.onChanged,
    this.hintText = '',
    this.helperText = '',
    this.maxLines = 1,
    this.maxLength = 24,
    this.basicPadding = 10,
    this.circular = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //构建输入框
    return Padding(
      padding: EdgeInsets.all(basicPadding),
      child: Container(
        height: height,
        child: TextField(
          //实时输入回调
          onChanged: onChanged ?? (String str) {},
          //文本样式
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14.0,
          ),
          maxLines: maxLines,
          maxLength: maxLength,
          //输入框的边框
          decoration: InputDecoration(
            //提示文本
            labelText: hintText,
            //提示文本的样式
            labelStyle: TextStyle(color: Theme.of(context).accentColor),
            //可编辑时的提示文本的颜色
            focusColor: Theme.of(context).accentColor,
            //填充
            filled: true,
            helperText: helperText,
            //可编辑时 无边框样式
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(circular),
              borderSide: BorderSide(color: Colors.black54),
            ),

            //获取输入焦点时的边框样式
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circular),
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
        ),
      ),
    );
  }
}
