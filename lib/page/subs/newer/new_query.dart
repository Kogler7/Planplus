import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/decoration/theme.dart';
import 'package:flutter_planplus/widgets/querys/range_choice.dart';
import 'package:flutter_planplus/widgets/querys/single_option.dart';
import 'package:flutter_planplus/widgets/querys/text_blank.dart';
import 'package:flutter_planplus/widgets/tiles/basic/blury_card.dart';

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
                  title: '你啥时候睡觉？',
                  subTitle: '单选题',
                  titleLeading: Icon(
                    Icons.access_time,
                    color: Colors.blue[500],
                  ),
                  children: [
                    SingleQueryOption(
                      text: '选项',
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      chosen: false,
                      hasDivider: false,
                    ),
                  ],
                ),
                BluryListCard(
                  title: '作业还剩多少？',
                  subTitle: '打分题',
                  titleLeading: Icon(
                    Icons.clear_all,
                    color: Colors.blue[500],
                  ),
                  children: [
                    RangedQueryChoice(),
                  ],
                ),
                BluryListCard(
                  title: '你喜欢吃什么？',
                  subTitle: '多选题',
                  titleLeading: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue[500],
                  ),
                  children: [
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: true,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: false,
                      hasDivider: true,
                    ),
                    SingleQueryOption(
                      text: '选项',
                      multiStyle: true,
                      chosen: true,
                      hasDivider: false,
                    ),
                  ],
                ),
                BluryListCard(
                  title: '想对我说的悄悄话',
                  subTitle: '填空题',
                  titleLeading: Icon(
                    Icons.comment,
                    color: Colors.blue[500],
                  ),
                  children: [
                    TextQueryBlank(
                      maxLines: 3,
                      maxLength: 120,
                      height: 120,
                      helperText: '我不会告诉其他人哦~',
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
