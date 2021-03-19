import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/widgets/para_selector/index.dart';
import 'package:flutter_planplus/widgets/tiles/basic/blury_card.dart';
import 'package:flutter_planplus/widgets/tiles/basic/list_card.dart';
import 'package:flutter_planplus/widgets/tiles/basic/trans_tile.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ThemedBackImage(),
        ThemedGlassicLayer(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('新建任务'),
          ),
          body: Container(
            child: ListView(
              children: [
                BluryListCard(
                  title: '时间选择器',
                  titleLeading: Icon(
                    Icons.access_time,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TimeSpanSelector(height: 260),
                  ],
                ),
                BluryListCard(
                  title: '测试',
                  subTitle: 'subtitle',
                  titleLeading: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TransListTile(
                      title: Text('内容一', style: new TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.contact_phone,
                        color: Colors.blue[500],
                      ),
                    ),
                    TransListTile(
                      title: Text('内容二'),
                      leading: Icon(
                        Icons.contact_mail,
                        color: Colors.blue[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
