import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';

///上方警示

class CustomAlertDialog extends CustomDialog{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: Container(
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
    );
  }
}
