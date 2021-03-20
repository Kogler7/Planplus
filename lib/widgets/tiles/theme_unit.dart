import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/image.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/global.dart';

class ThemeDisplayUnit extends StatelessWidget {
  final int index;
  final double width;
  final double height;
  final double padding;

  ThemeDisplayUnit({this.index = 0, this.width = 120, this.height = 240, this.padding = 3});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: () {
            themeIndexStream.sink.add(index);
            initMainBackIndex = index;
          },
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                child: Image(
                  image: KImage.mainBack(index),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Container(
                  width: width,
                  height: height / 8,
                  color: Colors.grey.withOpacity(0.4),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Text(
                      KString.Themes[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                bottom: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
