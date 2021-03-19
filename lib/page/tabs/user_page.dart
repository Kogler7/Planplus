import 'package:flutter/material.dart';
import 'package:flutter_planplus/utils/simple_dialog.dart';
import 'package:flutter_planplus/widgets/tiles/basic/blury_card.dart';
import 'package:flutter_planplus/widgets/tiles/basic/trans_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/model/index.dart';
import 'package:flutter_planplus/widgets/index.dart';
import 'package:flutter_planplus/utils/index.dart';
import 'package:flutter_planplus/router/index.dart';

class UserPage extends StatelessWidget {
  final UserInfo user;

  UserPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: user.avatar),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name, style: TextStyle(color: Colors.black, fontSize: 22)),
                  Text(user.email, style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        BluryListCard(
          title: '设置',
          titleLeading: Icon(
            Icons.settings,
            color: Colors.black54,
          ),
          children: [
            ArrowedTile(
              title: '主题选择',
              iconData: Icons.invert_colors,
              onTap: () {
                ToastUtil.showBtmToast('颜色主题');
                showThemeDialog(context);
              },
            ),
            ArrowedTile(
              title: '用户设置',
              iconData: Icons.settings,
              onTap: () {},
            ),
            ArrowedTile(
              title: '隐私保护',
              iconData: Icons.beenhere,
              onTap: () {},
            ),
          ],
        ),
        BluryListCard(
          title: '关于',
          titleLeading: Icon(
            KIcon.AboutUs,
            color: Colors.black54,
          ),
          children: [
            ArrowedTile(
              title: '用户必读',
              iconData: KIcon.ReadMe,
              onTap: () {
                ToastUtil.showBtmToast('用户必读');
                Applicat.pageTo(context, Routes.readMe);
              },
            ),
            ArrowedTile(
              title: '版权信息',
              iconData: Icons.bookmark,
              onTap: () {
                ToastUtil.showBtmToast('版权信息');
                Applicat.pageTo(context, Routes.readMe);
              },
            ),
            ArrowedTile(
              title: '关于我们',
              iconData: Icons.build,
              onTap: () {
                ToastUtil.showBtmToast('关于我们');
                Applicat.pageTo(context, Routes.aboutUs);
              },
            ),
          ],
        ),
        BluryListCard(
          children: [
            ArrowedTile(
              title: '重新登陆',
              iconData: Icons.cached,
              onTap: () {
                ToastUtil.showMidToast('已注销');
              },
            ),
            ArrowedTile(
              title: '注销',
              iconData: KIcon.CheckOut,
              onTap: () {
                ToastUtil.showMidToast('已注销');
              },
            ),
          ],
        ),
      ],
      padding: EdgeInsets.all(0),
    );
  }
}

class ArrowedTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function() onTap;

  ArrowedTile({this.title, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TransListTile(
      leading: Icon(iconData, color: Colors.black54),
      title: Text(
        title,
        style: TextStyle(fontSize: ScreenUtil().setSp(28.0), color: KColor.gotoItemTextColor),
      ),
      trailing: Icon(
        KIcon.GotoArrow,
        color: KColor.gotoItemIconColor,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
