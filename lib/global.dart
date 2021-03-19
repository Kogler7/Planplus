import 'dart:async';

Stream secondPeriodicStream;
Stream minutePeriodicStream;

///Settings
final themeIndexStream = StreamController.broadcast();
int initMainBackIndex = 2;
