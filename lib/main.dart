/// Copyright 2021 The Planplus Authors. All rights reserved.
/// Snapshot 21s06i belongs to Version 0.1.0 beta 1.
import 'package:flutter/material.dart';
import 'package:flutter_planplus/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import './config/index.dart';
import './page/index.dart';
import './router/index.dart';

void main() {
  configure(); //初始化配置
  runApp(Planplus());
}

class Planplus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //定义路由
    final router = FluroRouter();
    //配置路由
    FluroConfigor.configureRoutes(router);
    //指定路由至Application对象，便于调用
    Applicat.router = router;

    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'Planplus',
        //app标识
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Applicat.router.generator,
        ///此处theme并没有得到应用，应考虑设置默认textStyle
        theme: ThemeData(
          primarySwatch: KColor.primaryHighlightColor,
        ),
        home: SplashPage(), //启动页
      ),
      designSize: Size(750, 1334),
    );
  }
}

void configure() {
  ///尚未做销毁工作
  secondPeriodicStream = Stream.periodic(Duration(seconds: 1), (int) => 1).asBroadcastStream();
  ///尚不能准时发送消息
  minutePeriodicStream = Stream.periodic(Duration(minutes: 1), (int) => 1).asBroadcastStream();
}
