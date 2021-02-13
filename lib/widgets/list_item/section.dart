import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
