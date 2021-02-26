import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/model/index.dart';
import 'package:flutter_planplus/widgets/index.dart';
import 'package:flutter_planplus/utils/index.dart';
import 'package:flutter_planplus/router/index.dart';

class UserDrawer extends StatelessWidget {
  final UserInfo user;

  UserDrawer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1334.h,
      width: 750.w,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: user.avatar,
            ),
            decoration: BoxDecoration(image: DecorationImage(image: user.bkground, fit: BoxFit.cover)),
          ),
          Card(
            child: Column(
              children: <Widget>[
                FixedItem(
                  title: '用户反馈',
                  iconData: Icons.feedback,
                  callback: () {
                    ToastUtil.showBtmToast('用户反馈');
                    Applicat.pageTo(context, Routes.expect);
                  },
                ),
                FixedItem(
                  title: '用户必读',
                  iconData: KIcon.ReadMe,
                  callback: () {
                    ToastUtil.showBtmToast('用户必读');
                    Applicat.pageTo(context, Routes.readMe);
                  },
                ),
                FixedItem(
                  title: '关于我们',
                  iconData: KIcon.AboutUs,
                  callback: () {
                    ToastUtil.showBtmToast('关于我们');
                    Applicat.pageTo(context, Routes.aboutUs);
                  },
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.w, bottom: 35.0.w),
            elevation: 2.0,
          ),
          Card(
            child: Column(
              children: <Widget>[
                FixedItem(
                  title: '注销',
                  iconData: KIcon.CheckOut,
                  callback: () {
                    ToastUtil.showMidToast('已注销');
                  },
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 35.0.w),
            elevation: 2.0,
          ),
        ],
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
