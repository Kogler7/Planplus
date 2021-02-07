import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';
//toast提示组件显示工具
class ToastUtil{
  static  showMidToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb:1,
      backgroundColor: KColor.toastBgColor,
      textColor: KColor.toastTextColor,
      fontSize: ScreenUtil().setSp(28)
    );
  }
  static  showBtmToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb:1,
        backgroundColor: KColor.toastBgColor,
        textColor: KColor.toastTextColor,
        fontSize: ScreenUtil().setSp(28)
    );
  }
}