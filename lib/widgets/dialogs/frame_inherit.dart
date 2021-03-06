import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';

///页面框架
///用于复杂弹出效果
class CustomFrameInheritDialog extends CustomDialog {
  CustomFrameInheritDialog() {
    backOpacity = 0.3;
    attachPadding = 0;
    align = MainAxisAlignment.end;
  }

  @override
  Widget build(BuildContext context) {
    double radius = 25;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 300,
        width: 356,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text(
                          '继承自',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                ModelChip(text: '周读书计划', selected: true),
                ModelChip(text: '年读书计划', selected: false),
                ModelChip(text: '周复习计划', selected: false),
                ModelChip(text: '学期复习计划', selected: false),
                ModelChip(text: '周健身计划', selected: false),
                ModelChip(text: '年健身计划', selected: false),
                ModelChip(text: '艾宾浩斯任务区间', selected: false),
                ModelChip(text: '任务面板', selected: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ModelChip extends StatelessWidget {
  final String text;
  final bool selected;

  const ModelChip({
    Key key,
    this.text = '模板',
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(text),
      backgroundColor: KRndColor.newColor,
      onDeleted: () {},
      onPressed: () {},
      avatar: CircleAvatar(
        child: Text(text.characters.first),
      ),
      deleteIcon: Icon(Icons.clear),
      deleteIconColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.black54,
      selected: selected,
    );
  }
}
