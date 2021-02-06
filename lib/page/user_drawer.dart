import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/model/user_info.dart';
import 'package:flutter_planplus/widgets/goto_iconedtext.dart';

class UserDrawer extends StatelessWidget{
  final UserInfo user;

  UserDrawer({Key key,this.user}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: user.avatar,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: user.bkground,
                fit: BoxFit.cover
              )
            ),
          ),
          GotoIconedText(
            title: '用户反馈',
            iconData: Icons.feedback,
            callback: (){},
          ),
          GotoIconedText(
            title: '用户必读',
            iconData: KIcon.ReadMe,
            callback: (){},
          ),
          GotoIconedText(
            title: '关于我们',
            iconData: KIcon.AboutUs,
            callback: (){},
          ),
          Divider(),
          GotoIconedText(
            title: '注销',
            iconData: KIcon.CheckOut,
            callback: (){},
          ),
        ],
        padding: EdgeInsets.all(0),
      ),
    );
  }
}