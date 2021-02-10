// Copyright 2021 The Planplus Authors. All rights reserved.
// Snapshot 21s02b belongs to Version 0.1.0 beta 1.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import './config/index.dart';
import './page/index.dart';
import './router/index.dart';

void main() =>runApp(Planplus());

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
      child: MaterialApp(
        title: 'Planplus',//app标识
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Applicat.router.generator,//生成路由回调函数，当导航命名路由时，用此来生成界面
        theme: ThemeData(
          primarySwatch: KColor.primarySwatchColor,
        ),
        home: SplashPage(),//启动页
      ),
      designSize: Size(750,1334),
    );
  }
}
