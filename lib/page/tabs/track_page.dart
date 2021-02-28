import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import './tracks/track_view.dart';

class TrackPage extends StatefulWidget {
  TrackPage({Key key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {

  @override
  Widget build(BuildContext context) {
    return TrackView();
  }
}
