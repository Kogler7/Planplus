import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/widgets/blury/tiles/blury_tile.dart';

class ExecutionState extends StatelessWidget {
  final double progress;
  final String title;
  final String subTitle;
  final bool finished;
  final bool hasQuery;
  final bool running;

  const ExecutionState({
    Key key,
    this.progress = 0.5,
    this.title = '',
    this.subTitle = '',
    this.finished = false,
    this.hasQuery = false,
    this.running = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 16;
    Color prgColor;
    if (finished)
      prgColor = Colors.blueAccent;
    else {
      if (running)
        prgColor = Colors.greenAccent;
      else
        prgColor = Colors.redAccent;
    }
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, right: 46),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: prgColor,
                borderRadius: BorderRadius.circular(radius),
              ),
              width: 290 * progress,
              height: 60,
            ),
            BluryListTile(
              leading: Icon(
                finished ? Icons.done : Icons.update,
                color: KRndColor.newColor,
              ),
              trailing: Icon(
                hasQuery ? Icons.attach_file_outlined : Icons.add_comment,
                color: KRndColor.newColor,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Colors.black38, fontSize: 10),
              ),
              backColor: Colors.white,
              borderRadius: radius,
              height: 60,
              opacity: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
