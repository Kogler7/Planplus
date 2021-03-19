import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/global.dart';
import 'package:flutter_planplus/index.dart';

class ThemedBackImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: initMainBackIndex,
      stream: themeIndexStream.stream,
      builder: (ctx, snap) {
        return Image(
          image: KImage.mainBack(snap.data),
          fit: BoxFit.fill,
        );
      },
    );
  }
}

class ThemedGlassicLayer extends StatefulWidget {
  @override
  _ThemedGlassicLayerState createState() => _ThemedGlassicLayerState();
}

class _ThemedGlassicLayerState extends State<ThemedGlassicLayer> {
  int _nowThemeIndex = initMainBackIndex;
  double _opacity = 0.0;
  bool _updated = false;

  @override
  void initState() {
    themeIndexStream.stream.listen((event) => _updated = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: initMainBackIndex,
      stream: themeIndexStream.stream,
      builder: (ctx, snap) {
        if (_updated) {
          if (snap.data == _nowThemeIndex) {
            _opacity += 0.2;
            if (_opacity >= 1.0) {
              _opacity = 0.0;
            }
          } else {
            _opacity = 0.0;
          }
          _nowThemeIndex = snap.data;
          _updated = false;
        }
        return GlassicLayer(
          blur: 1 + _opacity,
          opacity: _opacity,
        );
      },
    );
  }
}
