import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './routes.dart';

import 'package:flutter_planplus/widgets/expect.dart';
import 'package:flutter_planplus/page/index.dart';

class FluroConfigor{
  static var routers = {
    "${Routes.root}": Handler(
      handlerFunc: (ctx, params) => SplashPage(),
    ),
    "${Routes.login}": Handler(
      handlerFunc: (ctx, params) => LoginPage(),
    ),
    "${Routes.home}": Handler(
      handlerFunc: (ctx, params) => HomePage(),
    ),
    "${Routes.expect}": Handler(
      handlerFunc: (ctx, params) => Scaffold(
        body: Expect(),
      ),
    ),
    "${Routes.aboutUs}": Handler(
      handlerFunc: (ctx, params) => AboutUs(),
    ),
    "${Routes.readMe}": Handler(
      handlerFunc: (ctx, params) => ReadMe(),
    ),
    "${Routes.groupPage}": Handler(
      handlerFunc: (ctx, params) => GroupDetailPage(),
    ),
  };
  //静态方法
  static void configureRoutes(FluroRouter router){//路由配置
    //依次遍历定义
    routers.forEach((key, value) {
      router.define(key, handler: value);
    });
    //找不到路由
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          return Center(
              child: Text('Not Found.')
          );
        }
    );
  }
}