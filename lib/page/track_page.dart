import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';

class TrackPage extends StatefulWidget{
  TrackPage({Key key}):super(key: key);

  @override
  _TrackPageState createState()=>_TrackPageState();
}

class _TrackPageState extends State<TrackPage>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('TrackPage'),
    );
  }
}