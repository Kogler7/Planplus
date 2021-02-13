import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/widgets/index.dart';

class ListPage extends StatefulWidget{
  ListPage({Key key}):super(key: key);

  @override
  _ListPageState createState()=>_ListPageState();
}

class _ListPageState extends State<ListPage>{

  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Item(),
        Item(),
        Item(),
        Item(),
        Item(),
      ],
    );
  }
}