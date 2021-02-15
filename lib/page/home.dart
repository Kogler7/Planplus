//Planplus主页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/page/tabs/lists/model_list.dart';
import 'package:flutter_planplus/page/tabs/lists/query_list.dart';
import 'package:flutter_planplus/page/tabs/lists/task_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tabs/lists/list.dart';
import 'tabs/track_page.dart';
import 'tabs/judge_page.dart';
import './user.dart';
import 'package:flutter_planplus/model/built_in/dev_info.dart';
import 'package:flutter_planplus/widgets/micro_tabbar.dart';
import 'package:flutter_planplus/router/index.dart';

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
  ];
  List<Color> buttonColors = [
    KColor.fabTrack,
    KColor.fabList,
    KColor.fabJudge,
  ];
  List<Widget> titles = [];

  HomePage({Key key}) : super(key: key) {
    pageViews = <Widget>[
      TrackPage(),
      listPages,
      JudgePage(),
    ];
    titles = <Widget>[
      Text('02.09 Tue'),
      MicroTabBar(height: 66.0.h, width: 440.0.w, tabs: <Widget>[
        Tab(
          text: '模版',
        ),
        Tab(
          text: '任务',
        ),
        Tab(
          text: '问卷',
        ),
      ]),
      Text('Kogler'),
    ];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //根据选择改变剩余按钮
  List<Widget> _selectButtons(int index) {
    List<int> _index = [0, 1, 2];
    _index.remove(_selectedIndex);
    return <Widget>[
      IconButton(
        padding: EdgeInsets.only(right: 35.0.w),
        icon: Icon(
          widget.icons[_index[0]],
        ),
        color: widget.buttonColors[_index[0]],
        onPressed: () {
          setState(() {
            _selectedIndex = _index[0];
          });
        },
      ),
      IconButton(
        padding: EdgeInsets.only(left: 35.0.w),
        icon: Icon(
          widget.icons[_index[1]],
        ),
        color: widget.buttonColors[_index[1]],
        onPressed: () {
          setState(() {
            _selectedIndex = _index[1];
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KColor.primaryColor,
          title: widget.titles[_selectedIndex],
          centerTitle: true,
          actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed: () {})],
        ),
        body: widget.pageViews[_selectedIndex],
        drawer: UserDrawer(user: DevInfo.Kogler),
        bottomNavigationBar: BottomAppBar(
          color: KColor.primaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: _selectButtons(_selectedIndex),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            widget.icons[_selectedIndex],
            color: widget.buttonColors[_selectedIndex],
          ),
          onPressed: () {
            Applicat.pageTo(context, Routes.groupPage);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
