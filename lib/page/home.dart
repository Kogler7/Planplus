//Planplus主页
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/page/subs/newer/new_query.dart';
import 'package:flutter_planplus/page/subs/newer/new_task.dart';
import 'package:flutter_planplus/widgets/basic/stack_scaffold.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/page/tabs/lists/model_list.dart';
import 'package:flutter_planplus/page/tabs/lists/query_list.dart';
import 'package:flutter_planplus/page/tabs/lists/task_list.dart';
import 'package:flutter_planplus/widgets/dialogs/alert.dart';
import 'package:flutter_planplus/widgets/dialogs/base.dart';
import 'package:flutter_planplus/widgets/dialogs/blank.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tabs/track_page.dart';
import 'tabs/judge_page.dart';
import 'tabs/user_page.dart';
import 'package:flutter_planplus/model/built_in/dev_info.dart';
import 'package:flutter_planplus/widgets/micro_tabbar.dart';

class HomePage extends StatefulWidget {
  final String barTitle = 'Planplus';
  final Widget listPages = TabBarView(
    children: <Widget>[
      ModelListPage(),
      TaskListPage(),
      QueryListPage(),
    ],
  );
  List<Widget> pageViews = [];
  List<IconData> icons = [
    KIcon.PETrackPage,
    KIcon.ListsPage,
    KIcon.JudgePage,
    KIcon.UserPage,
  ];
  List<Widget> titles = [];

  HomePage({Key key}) : super(key: key) {
    pageViews = <Widget>[
      TrackPage(),
      listPages,
      JudgePage(),
      UserPage(user: DevInfo.Kogler),
    ];
    titles = <Widget>[
      Text('02.09 Tue', style: TextStyle(color: Colors.black54)),
      MicroTabBar(height: 66.0.h, width: 440.0.w, tabs: <Widget>[
        Tab(child: Text('模板', style: TextStyle(color: Colors.black54))),
        Tab(child: Text('任务', style: TextStyle(color: Colors.black54))),
        Tab(child: Text('问卷', style: TextStyle(color: Colors.black54))),
      ]),
      Text('Judge', style: TextStyle(color: Colors.black54)),
      Text('User', style: TextStyle(color: Colors.black54)),
    ];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var _dialogController = StreamController<CustomDialog>();

  @override
  void dispose() {
    _dialogController.close();
    super.dispose();
  }

  //根据选择改变剩余按钮
  List<Widget> getButtons(int index) {
    return <Widget>[
      IconButton(
        icon: Icon(
          widget.icons[0],
          color: 0 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          if (_selectedIndex != 0) setState(() => _selectedIndex = 0);
        },
      ),
      IconButton(
        icon: Icon(
          widget.icons[1],
          color: 1 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          if (_selectedIndex != 1) setState(() => _selectedIndex = 1);
        },
      ),
      SizedBox(width: 40),
      IconButton(
        icon: Icon(
          widget.icons[2],
          color: 2 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          if (_selectedIndex != 2) setState(() => _selectedIndex = 2);
        },
      ),
      IconButton(
        icon: Icon(
          widget.icons[3],
          color: 3 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          if (_selectedIndex != 3) setState(() => _selectedIndex = 3);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: StackedScaffold(
        backLayer: [
          ThemedBackImage(),
          ThemedGlassicLayer(),
        ],
        foreLayer: [
          CustomDialogBase(
            dialogStream: _dialogController.stream,
          ),
        ],
        appBarTitle: widget.titles[_selectedIndex],
        appBarCenterTitle: _selectedIndex == 1 ? true : false,
        appBarActions: [IconButton(icon: Icon(Icons.search, color: Colors.black54), onPressed: () {})],
        body: widget.pageViews[_selectedIndex],
        bottomAppBarShape: CircularNotchedRectangle(),
        bottomAppBarChild: Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: getButtons(_selectedIndex),
          ),
          padding: EdgeInsets.only(bottom: 8),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white60,
          ),
          onPressed: () {
            if (_selectedIndex == 2)
              _dialogController.sink.add(CustomAlertDialog());
            else if (_selectedIndex == 3)
              _dialogController.sink.add(CustomBlankDialog());
            else {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (_selectedIndex == 0) return NewTaskPage();
                      if (_selectedIndex == 1)
                        return NewQueryPage();
                      else
                        return Expect();
                    },
                  ),
                );
              });
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
