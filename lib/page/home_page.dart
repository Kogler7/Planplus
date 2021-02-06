//Planplus主页

import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/index.dart';
import './list_page.dart';
import './track_page.dart';
import './judge_page.dart';
import 'package:flutter_planplus/page/user_drawer.dart';
import 'package:flutter_planplus/model/built_in/dev_info.dart';

class HomePage extends StatefulWidget{
  final String barTitle;

  HomePage({Key key,this.barTitle}) : super(key:key);

  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.barTitle
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: (){})
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              ListPage(),
              TrackPage(),
              JudgePage()
            ],
          ),
          drawer: UserDrawer(user: DevInfo.Kogler),
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(color: KColor.bottomNavigationBar),
            child: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(KIcon.ListsPage),),
                Tab(icon: Icon(KIcon.PETrackPage),),
                Tab(icon: Icon(KIcon.JudgePage),),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child: Icon(Icons.add),
          ),
        ),
    );
  }
}