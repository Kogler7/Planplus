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

enum ActionState {
  navigate,
  login,
  register,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _opacity = 0;
  ActionState _actionState = ActionState.navigate;
  int _actionTime = 400;

  @override
  void initState() {
    Future(() => setState(() => _opacity = 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Stack(
        children: [
          //气泡背景
          BubbleBackGround(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: _actionState != ActionState.navigate ? Colors.black54 : Colors.transparent,
                onPressed: () {
                  setState(() {
                    _actionState = ActionState.navigate;
                  });
                },
              ),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                //展示信息
                buildInforLayer(),
                //按钮
                AnimatedPositioned(
                  left: 26,
                  right: 26,
                  top: _actionState == ActionState.navigate ? 400 : 100,
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(milliseconds: _actionTime),
                    child: buildActionsColumn(context),
                  ),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: _actionTime),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _actionState == ActionState.navigate
                ? FloatingActionButton.extended(
                    onPressed: () {
                      Applicat.goTo(context, Routes.home);
                    },
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: Text('直接进入'),
                  )
                : FloatingActionButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _actionState = ActionState.navigate;
                      });
                    }),
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(height: 90),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInforLayer() {
    //顶部对齐
    return AnimatedPositioned(
      top: _actionState == ActionState.navigate ? 100 : 10,
      left: 0,
      right: 0,
      duration: Duration(milliseconds: _actionTime),
      curve: Curves.decelerate,
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

  Widget buildActionsColumn(BuildContext context) {
    double _itemHeight = 50;
    return Container(
      child: Column(
        children: <Widget>[
          _actionState != ActionState.navigate
              ? LoginBoxBlank(
                  hintText: '邮箱',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  onChanged: (value) {},
                  height: _itemHeight,
                )
              : SizedBox(height: 0),
          _actionState != ActionState.navigate
              ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: LoginBoxBlank(
                    hintText: '密码',
                    obscureText: true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: Icons.visibility,
                    height: _itemHeight,
                  ),
                )
              : SizedBox(height: 0),
          _actionState == ActionState.register
              ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: LoginBoxBlank(
                    hintText: '确认密码',
                    obscureText: true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: Icons.visibility,
                    height: _itemHeight,
                  ),
                )
              : SizedBox(height: 0),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Opacity(
                opacity: _actionState == ActionState.login ? 1 : 0,
                child: Text(
                  '忘记密码?',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          _actionState != ActionState.register
              ? Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CoinBoxButton(
                    label: '登录',
                    onTap: () {
                      if (_actionState == ActionState.navigate) {
                        setState(() {
                          _actionState = ActionState.login;
                        });
                      } else
                        Applicat.goTo(context, Routes.home);
                    },
                    bordered: false,
                    height: _itemHeight,
                  ),
                )
              : SizedBox(height: 0),
          SizedBox(
            height: 10.0,
          ),
          _actionState != ActionState.login
              ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CoinBoxButton(
                    label: '注册',
                    onTap: () {
                      if (_actionState == ActionState.navigate) {
                        setState(() {
                          _actionState = ActionState.register;
                        });
                      } else
                        Applicat.goTo(context, Routes.home);
                    },
                    bordered: true,
                    height: _itemHeight,
                  ),
                )
              : SizedBox(height: 0),
        ],
      ),
    );
  }
}

class BubbleBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
