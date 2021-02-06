import 'package:flutter/material.dart';
import './config/index.dart';
import './page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_planplus/router/routers.dart';
import 'package:flutter_planplus/router/application.dart';

//定义路由
final router = Router();
//配置路由
//Routers
//指定路由至Application对象，便于调用
//生成路由回调函数，当导航命名路由时，用此来生成界面

void main() =>runApp(Planplus());

class Planplus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(maxHeight: 750,maxWidth: 600),designSize: Size(750,1334));
    return MaterialApp(
      title: 'Planplus',//app标识
      theme: ThemeData(
        primarySwatch: KColor.primarySwatchColor,
      ),
      home: HomePage(barTitle: 'Planplus'),//首页
    );
  }
}
