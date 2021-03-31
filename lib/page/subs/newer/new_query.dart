import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/widgets/querys/range_choice.dart';
import 'package:flutter_planplus/widgets/querys/single_option.dart';
import 'package:flutter_planplus/widgets/querys/text_blank.dart';

class NewQueryPage extends StatefulWidget {
  @override
  _NewQueryPageState createState() => _NewQueryPageState();
}

class _NewQueryPageState extends State<NewQueryPage> {
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
            title: Text('新建问卷'),
          ),
          body: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                BluryListCard(
                  title: '心得速记',
                  subTitle: '填空题',
                  titleLeading: Icon(
                    Icons.comment,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TextQueryBlank(
                      height: 80,
                      maxLines: 1,
                      helperText: '记下你的心得吧！',
                    ),
                  ],
                ),
                BluryListCard(
                  title: '记录下你的学习状态',
                  subTitle: '单选题，数据链接至：七日学习状态分布图',
                  titleLeading: Icon(
                    Icons.access_time,
                    color: Colors.blue[500],
                  ),
                  children: [
                    SingleQueryOption(
                      text: '专注高效',
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '正常状态',
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '有些分心',
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '有些散漫',
                      chosen: false,
                      hasDivider: false,
                    ),
                  ],
                ),
                BluryListCard(
                  title: '学习状态打分',
                  subTitle: '打分题，数据链接至：七日学习状态趋势图',
                  titleLeading: Icon(
                    Icons.clear_all,
                    color: Colors.blue[500],
                  ),
                  children: [
                    RangedQueryChoice(),
                  ],
                ),
                BluryListCard(
                  title: '多选题展示',
                  subTitle: '多选题，支持自定义',
                  titleLeading: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue[500],
                  ),
                  children: [
                    SingleQueryOption(
                      text: '选项 1',
                      multiStyle: true,
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项 2',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项 3',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项 4',
                      multiStyle: true,
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项 5',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: false,
                    ),
                  ],
                ),
                BluryListCard(
                  title: '对明天的自己想说的话',
                  subTitle: '填空题，将添加至：明日提醒',
                  titleLeading: Icon(
                    Icons.comment,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TextQueryBlank(
                      maxLines: 3,
                      maxLength: 120,
                      height: 120,
                      helperText: '给明天的自己一点激励~',
                    ),
                  ],
                ),
                BluryListCard(
                  title: '每日三问',
                  subTitle: '每日固定问卷，必填',
                  titleLeading: Icon(
                    Icons.comment,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TextQueryBlank(
                      maxLines: 1,
                      maxLength: 25,
                      height: 80,
                      helperText: '我今天有朝着自己的目标努力吗？',
                    ),
                    TextQueryBlank(
                      maxLines: 1,
                      maxLength: 25,
                      height: 80,
                      helperText: '我的学问有没有进步？',
                    ),
                    TextQueryBlank(
                      maxLines: 1,
                      maxLength: 25,
                      height: 80,
                      helperText: '我有没有坚持良好的习惯？',
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(height: 50),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class QueryHead extends StatefulWidget {
  @override
  _QueryHeadState createState() => _QueryHeadState();
}

class _QueryHeadState extends State<QueryHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
    );
  }
}
