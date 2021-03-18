import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/router/index.dart';
import 'package:flutter_planplus/widgets/blanks/login_box.dart';
import 'package:flutter_planplus/widgets/buttons/coin_box.dart';
import 'package:flutter_planplus/widgets/decoration/bubble.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';

/// 气泡背景的登录页面

final tag = UniqueKey();

class SharedBackLayer extends StatelessWidget {
  final tag;

  SharedBackLayer({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Stack(
        children: [
          Positioned.fill(
            child: MainBackImage(),
          ),
          FloatingBubblesLayer(),
          GlassicLayer(
            blur: 0.3,
            opacity: 0.2,
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _opacity = 0;
  SharedBackLayer _backLayer;

  @override
  void initState() {
    Future(() => setState(() => _opacity = 1));
    _backLayer = SharedBackLayer(tag: tag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Stack(
        children: [
          //气泡背景
          _backLayer,
          //展示信息
          buildInforLayer(),
          //按钮
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 1000),
            child: buildColumn(context),
          )
        ],
      ),
    );
  }

  Positioned buildInforLayer() {
    //顶部对齐
    return Positioned(
      top: 110,
      left: 0,
      right: 0,
      child: Text(
        'Planplus',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 50.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36),
      child: Column(
        //子Widget 底部对齐
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: LoginBoxBlank(
              hintText: '邮箱',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 50,
            child: LoginBoxBlank(
              hintText: '密码',
              obscureText: true,
              prefixIconData: Icons.lock_outline,
              suffixIconData: Icons.visibility,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '忘记密码?',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CoinBoxButton(
            label: '登录',
            onTap: () {
              Applicat.goTo(context, Routes.home);
            },
            bordered: false,
          ),
          SizedBox(
            height: 10.0,
          ),
          CoinBoxButton(
            label: '注册',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return Stack(
                    children: [
                      _backLayer,
                      LoginSubPage(),
                    ],
                  );
                }),
              );
            },
            bordered: true,
          ),
        ],
      ),
    );
  }
}

class LoginSubPage extends StatefulWidget {
  @override
  _LoginSubPageState createState() => _LoginSubPageState();
}

class _LoginSubPageState extends State<LoginSubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black54,
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class RegisterSubPage extends StatefulWidget {
  @override
  _RegisterSubPageState createState() => _RegisterSubPageState();
}

class _RegisterSubPageState extends State<RegisterSubPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
