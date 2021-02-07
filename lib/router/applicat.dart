import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_planplus/page/home.dart';
import './routes.dart';

class Applicat{
  static FluroRouter router;

  static Future<dynamic> goTo(BuildContext ctx, String path) {//不得返回
    return router.navigateTo(
      ctx,
      path,
      transition: TransitionType.nativeModal,
      replace: true,
    );
  }

  static Future<dynamic> pageTo(BuildContext ctx, String path) {
    return router.navigateTo(
      ctx,
      path,
      transition: TransitionType.nativeModal,
    );
  }

  static Future<dynamic> authTo(BuildContext ctx, String path) {
    // TODO: 验证权限，再决定向哪跳转
    var auth = true;
    if (auth) {
      return router.navigateTo(
        ctx,
        path,
        transition: TransitionType.nativeModal,
      );
    } else {
      // 验证失败，跳转到首页
      return router.navigateTo(
        ctx,
        Routes.home,
        transition: TransitionType.nativeModal,
      );
    }
  }
}