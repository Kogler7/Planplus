import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_planplus/config/image.dart';
import 'package:flutter_planplus/config/index.dart';

class CardScroll extends StatelessWidget {
  final double currentCard;
  final double padding = 20.0;
  final double verticalInset = 20.0;
  final double cardAspectRatio = 0.618;
  double widgetAspectRatio;
  List<Widget> cardList = [];

  CardScroll({Key key, this.currentCard}) : super(key: key) {
    widgetAspectRatio = cardAspectRatio * 1.1;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = safeHeight * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<String> weekdays = [
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
            'Sunday',
          ];

          for (int i = 0; i < 7; i++) {
            var delta = i - currentCard;
            bool isOnRight = delta > 0;

            var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 36 : 1), 0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
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
                          image: KImage.mainBack(6 - currentCard.toInt()),
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
                                  KString.Themes[6 - currentCard.toInt()], //待修改
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