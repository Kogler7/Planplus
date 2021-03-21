import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/widgets/para_selector/index.dart';
import 'package:flutter_planplus/widgets/querys/text_blank.dart';
import 'package:flutter_planplus/widgets/tiles/basic/blury_card.dart';
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
            child: getSelectorList(),
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

  ListView getSelectorList() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        BluryListCard(
          title: '任务标签',
          titleLeading: Icon(
            Icons.access_time,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('每日任务', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.star_border,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('继承任务', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '继承自：2021读书计划',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.sort,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('应用模板', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '每日读书计划任务',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.queue,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '时间选择器',
          titleLeading: Icon(
            Icons.hourglass_bottom,
            color: Colors.blue[500],
          ),
          children: [
            TimeSpanSelector(height: 230),
          ],
        ),
        BluryListCard(
          title: '添加子任务',
          subTitle: '具体的执行步骤',
          titleLeading: Icon(
            Icons.list,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('第一步', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.radio_button_unchecked,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('第二步', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.radio_button_unchecked,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('第三步', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.radio_button_unchecked,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '选择重复',
          titleLeading: Icon(
            Icons.history,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('每周重复', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '周一、周三、周五、周日；跳过节假日',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '触发问卷',
          titleLeading: Icon(
            Icons.live_help_outlined,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('每日三问', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '触发条件：睡前；重复：每天',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.help_outline,
                color: Colors.blue[500],
              ),
            ),
            TransListTile(
              title: Text('进入学习状态调查', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '触发条件：任务开始前',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.help_outline,
                color: Colors.blue[500],
              ),
            ),
            TransListTile(
              title: Text('专心程度调查', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '触发条件：任务结束后',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.help_outline,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '备忘录',
          titleLeading: Icon(
            Icons.access_time,
            color: Colors.blue[500],
          ),
          children: [
            TextQueryBlank(
              maxLines: 3,
              maxLength: 120,
              height: 120,
              helperText: '重要的提醒',
            ),
          ],
        ),
      ],
    );
  }
}
