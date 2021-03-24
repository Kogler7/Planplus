import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/index.dart';
import 'package:flutter_planplus/config/color.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primaryColor,
      body: Center(
        child: Container(
          child: Center(
            child: TimeSpanSelector(
              height: 260,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


