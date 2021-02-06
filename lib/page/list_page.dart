import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';

class ListPage extends StatefulWidget{
  ListPage({Key key}):super(key: key);

  @override
  _ListPageState createState()=>_ListPageState();
}

class _ListPageState extends State<ListPage>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('ListPage'),
    );
  }
}