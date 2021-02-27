import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_planplus/config/image.dart';
import 'package:flutter_planplus/config/index.dart';

class CardScroll extends StatefulWidget {
  CardScroll({Key key}) : super(key: key);

  @override
  _CardScrollState createState() => _CardScrollState();
}

class _CardScrollState extends State<CardScroll> {
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
          StackedCard(currentCard: currentCard),
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

class StackedCard extends StatelessWidget {
  final double currentCard;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  final double cardAspectRatio = 0.618;
  double widgetAspectRatio;
  List<Widget> cardList = [];

  StackedCard({Key key, this.currentCard}) : super(key: key) {
    widgetAspectRatio = cardAspectRatio * 1.1;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraint) {
          var width = constraint.maxWidth;
          var height = constraint.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = safeHeight * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          for (int i = 0; i < 7; i++) {
            var delta = currentCard - i;
            bool isOnLeft = delta > 0;
            var index = 6 - i;
            //向左偏移量计算
            var start = padding + max(primaryCardLeft - horizontalInset * delta * (isOnLeft ? 1 : 36), 0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(delta, 0.0),
              bottom: padding + verticalInset * max(delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image(
                          image: KImage.mainBack(index),
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: Text(
                                  KString.Themes[index], //待修改
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    //fontFamily:
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 22.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    'Test',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }

          return Stack(children: cardList);
        },
      ),
    );
  }
}
