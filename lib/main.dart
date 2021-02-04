import 'package:flutter/material.dart';
import './Tests/list.dart';
import './config/index.dart';

void main() =>runApp(Planplus());

class Planplus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planplus',//app标识
      theme: ThemeData(
        primarySwatch: KColor.primarySwatchColor,
      ),
      home: MyHomePage(barTitle: 'Planplus'),//首页
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.barTitle}) : super(key: key);

  final String barTitle;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.barTitle),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){},
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              MovieList(),
              MovieList(),
              MovieList(),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(KString.APP_AUTHOR),
                  accountEmail: Text(KString.APP_AUTHOR_EMAIL),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: KImage.avatar
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: KImage.bkground,
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                ListTile(
                  title:Text('用户反馈'),
                  trailing: Icon(Icons.feedback),
                ),
                ListTile(
                  title:Text('系统设置'),
                  trailing: Icon(Icons.settings),
                ),
                ListTile(
                  title:Text('我要发布'),
                  trailing: Icon(Icons.send),
                ),
                Divider(),
                ListTile(
                  title:Text('注销'),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(color: KColor.bottomNavigationBar),
              child: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(KIcon.ListsPage),),
                  Tab(icon: Icon(KIcon.PETrackPage),),
                  Tab(icon: Icon(KIcon.JudgePage),),
                ],
              )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: '我是加法',
            child: Icon(Icons.add),
            //menu/calendar_today/dashboard/data_usage
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }
}
