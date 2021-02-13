import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:flutter_planplus/config/index.dart';
import 'package:flutter_planplus/widgets/card_scroll.dart';

class TrackPage extends StatefulWidget {
  TrackPage({Key key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  var currentCard = 0.0; //当前卡片

  @override
  Widget build(BuildContext context) {
    PageController cardController = PageController(
      initialPage: 0, //初始的显示页面
    );
    cardController.addListener(() {
      setState(() {
        currentCard = cardController.page;
      });
    });
    return Center(
      child: Stack(
        children: <Widget>[
          CardScroll(currentCard: currentCard),
          Positioned.fill(
            child: PageView.builder(
              itemCount: 7,
              controller: cardController,
              reverse: true,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
