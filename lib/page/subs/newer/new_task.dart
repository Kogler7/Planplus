import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';
import 'package:flutter_planplus/widgets/buttons/trans/list_tile.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/widgets/para_selector/index.dart';
import 'package:flutter_planplus/widgets/querys/text_blank.dart';

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
        ),
      ],
    );
  }

  ListView getSelectorList() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        BluryListCard(
          title: '应用模板',
          subTitle: '参数模板如下',
          titleLeading: Icon(
            Icons.device_hub,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('每日读书计划任务', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '时间、子任务、重复、问卷已覆盖',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.adjust,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('添加模板', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '每日读书任务',
          titleLeading: Icon(
            Icons.chat_bubble_outline,
            color: Colors.blue[500],
          ),
          children: [
            TextQueryBlank(
              maxLines: 2,
              maxLength: 60,
              height: 80,
              helperText: '简要说明',
            ),
            TransListTile(
              title: Text('已关联数据', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '倒计时（天）；坚持时间',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.attach_file,
                color: Colors.blue[500],
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
            TransListTile(
              title: Text('开始时间', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '自动开始；05:00，开始不早于00:00，开始不晚于06:00',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.done_outline,
                color: Colors.blue[500],
              ),
              hasDivider: true,
            ),
            TransListTile(
              title: Text('结束时间', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '自动结束；07:00，结束不早于02:00，结束不晚于08:00',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.done_all,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '子任务',
          subTitle: '具体的执行步骤',
          titleLeading: Icon(
            Icons.list,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('进入状态', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '自动完成；问卷待填写',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
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
              title: Text('认真读书', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '问卷（关联）待填写',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
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
              title: Text('记录心得', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '问卷待填写',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.radio_button_unchecked,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              hasDivider: true,
            ),
            TransListTile(
              title: Text('添加子任务', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
                color: Colors.blue[500],
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
                '周一、周三、周五',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
              hasDivider: true,
            ),
            TransListTile(
              title: Text('跳过节假日', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '周末及法定节假日',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.access_time,
                color: Colors.blue[500],
              ),
              hasDivider: true,
            ),
            TransListTile(
              title: Text('添加重复条件', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '任务标签',
          titleLeading: Icon(
            Icons.wallpaper,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('每日任务', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '已收录并关联至“每日任务”清单',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
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
              hasDivider: true,
            ),
            TransListTile(
              title: Text('添加标签', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),

        BluryListCard(
          title: '关联问卷',
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
              title: Text('进入状态调查', style: TextStyle(color: Colors.black54)),
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
              title: Text('专注度调查', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '触发条件：任务结束后',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.help_outline,
                color: Colors.blue[500],
              ),
              hasDivider: true,
            ),
            TransListTile(
              title: Text('添加问卷', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
                color: Colors.blue[500],
              ),
              hasDivider: false,
            ),
          ],
        ),
        BluryListCard(
          title: '关联统计数据',
          titleLeading: Icon(
            Icons.data_usage,
            color: Colors.blue[500],
          ),
          children: [
            TransListTile(
              title: Text('倒计时', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '单位：天；添加至任务描述',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.hourglass_top,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('坚持时间', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '单位：天；添加至任务描述',
                style: TextStyle(color: Colors.black38, fontSize: 8),
              ),
              leading: Icon(
                Icons.hourglass_bottom,
                color: Colors.blue[500],
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
            TransListTile(
              title: Text('继承数据', style: TextStyle(color: Colors.black54)),
              subtitle: Text(
                '关联问卷数据：每天实际读书量',
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
              hasDivider: true,
            ),
            TransListTile(
              title: Text('添加数据关联', style: TextStyle(color: Colors.black54)),
              leading: Icon(
                Icons.control_point_duplicate_outlined,
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
