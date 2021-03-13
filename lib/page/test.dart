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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeSpanSelector(
                  radius: 130,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                        onPressed: () {print(1);}),
                  ),
                ),
              ],
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
