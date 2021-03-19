//Planplus主页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/page/subs/newer/new_task.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import '../global.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/page/tabs/lists/model_list.dart';
import 'package:flutter_planplus/page/tabs/lists/query_list.dart';
import 'package:flutter_planplus/page/tabs/lists/task_list.dart';
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

  //根据选择改变剩余按钮
  List<Widget> getButtons(int index) {
    return <Widget>[
      IconButton(
        icon: Icon(
          widget.icons[0],
          color: 0 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
      ),
      IconButton(
        icon: Icon(
          widget.icons[1],
          color: 1 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 1;
          });
        },
      ),
      SizedBox(width: 40),
      IconButton(
        icon: Icon(
          widget.icons[2],
          color: 2 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
      IconButton(
        icon: Icon(
          widget.icons[3],
          color: 3 == _selectedIndex ? Colors.white : Colors.black54,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 3;
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ThemedBackImage(),
          ThemedGlassicLayer(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: widget.titles[_selectedIndex],
              centerTitle: _selectedIndex == 1 ? true : false,
              actions: <Widget>[IconButton(icon: Icon(Icons.search, color: Colors.black54), onPressed: () {})],
            ),
            body: widget.pageViews[_selectedIndex],
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              shape: CircularNotchedRectangle(),
              child: Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: getButtons(_selectedIndex),
                ),
                padding: EdgeInsets.only(bottom: 8),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white60,
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NewTaskPage();
                      },
                    ),
                  );
                });
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        ],
      ),
    );
  }
}
