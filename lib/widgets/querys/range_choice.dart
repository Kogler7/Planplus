import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/tiles/basic/trans_tile.dart';

class RangedQueryChoice extends StatelessWidget {
  final double height;
  final int optionNum;
  final String title;
  final Color textColor;

  const RangedQueryChoice({
    Key key,
    this.height = 90,
    this.optionNum = 5,
    this.title = '打分题',
    this.textColor = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransListTile(
          title: Text(''),
          leading: Text(
            '1',
            style: TextStyle(color: textColor),
          ),
          trailing: Text(
            optionNum.toString(),
            style: TextStyle(color: textColor),
          ),
          basicPadding: 25,
          height: 36,
          headIndent: 10,
          endIndent: 10,
        ),
        SizedBox(
          height: height - 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                optionNum,
                (index) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Theme.of(context).primaryColor.withOpacity(0.7),
                  ),
                  onPressed: () {},
                  child: Text((index + 1).toString()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
