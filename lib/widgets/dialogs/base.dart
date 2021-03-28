///用于控制显示动画
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/dialogs/alert.dart';
import 'package:flutter_planplus/widgets/dialogs/dialog.dart';

class CustomDialogBase extends StatefulWidget {
  final Stream<CustomDialog> dialogStream;
  final StreamSink outputs;
  final CustomDialog dialog;

  const CustomDialogBase({
    Key key,
    this.dialogStream,
    this.outputs,
    this.dialog,
  }) : super(key: key);

  @override
  _CustomDialogBaseState createState() => _CustomDialogBaseState();
}

class _CustomDialogBaseState extends State<CustomDialogBase> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: CustomAlertDialog(),
      builder: (ctx, AsyncSnapshot<CustomDialog> snap) {
        double _top = 0.0;
        double _bottom = 0.0;
        if (snap.data.align == MainAxisAlignment.start)
          _top = snap.data.attachPadding;
        else if (snap.data.align == MainAxisAlignment.end) _bottom = snap.data.attachPadding;
        return Stack(
          children: [
            IgnorePointer(
              child: GlassicLayer(
                color: snap.data.backColor,
                opacity: snap.data.backOpacity,
              ),
            ),
            Column(
              mainAxisAlignment: snap.data.align,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: _top, bottom: _bottom),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [snap.data.build(ctx)],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
