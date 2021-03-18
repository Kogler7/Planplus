import 'dart:async';

final themeIndexStream = StreamController();
Stream secondPeriodicStream;
Stream minutePeriodicStream;

///Settings
final mainBackChangeStream = StreamController.broadcast();
int initMainBackIndex = 7;
