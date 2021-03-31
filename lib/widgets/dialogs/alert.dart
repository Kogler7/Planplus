import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/blury/card/blury_card.dart';
import 'package:flutter_planplus/widgets/buttons/trans/double_txt.dart';
import 'package:flutter_planplus/widgets/buttons/trans/single_txt.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';

///上方警示

class CustomAlertDialog extends CustomDialog {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: BluryListCard(
        blur: 4,
        titleHeight: 70,
        centralHeaded: true,
        title: "确定删除？",
        subTitle: '被删除的物品将会被移至回收站',
        children: [
          SingleTextButton(),
          SingleTextButton(
            bold: true,
          ),
          DoubleTextButton(),
        ],
      ),
    );
  }
}
