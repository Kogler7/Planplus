import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/index.dart';

class GroupDetailPage extends StatefulWidget {
  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          child: Text(
            '测试',
            style: TextStyle(fontSize: 36),
          ),
        ),
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
      ],
    );
  }
}

