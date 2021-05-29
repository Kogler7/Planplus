import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';
import 'package:flutter_planplus/widgets/buttons/trans/double_txt.dart';
import 'package:flutter_planplus/widgets/buttons/trans/single_txt.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';

///上方警示

class CustomAlertDialog extends CustomDialog {
  CustomAlertDialog() {
    backOpacity = 0.3;
    attachPadding = 20;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: 310,
        child: BluryListCard(
          blur: 4,
          titleHeight: 70,
          centralHeaded: true,
          title: "新建任务",
          subTitle: '从标记的模板中快速新建任务',
          children: [
            SingleTextButton(
              text: '艾宾浩斯子任务模板',
            ),
            SingleTextButton(
              text: '番茄任务模板（25min）',
            ),
            SingleTextButton(
              text: '碎片时间利用模板（读书）',
            ),
            SingleTextButton(
              text: '临时会议模板',
            ),
            SingleTextButton(
              text: '打开参数选择器',
              bold: true,
            ),
            DoubleTextButton(
              textLeft: '取消',
              textRight: '确定',
            ),
          ],
        ),
      ),
    );
  }
}
