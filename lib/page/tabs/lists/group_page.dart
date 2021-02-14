import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/index.dart';
import 'package:flutter_planplus/model/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<ItemBase> itemList = [
  ItemBase(title: 'Monday', subTitle: ''),
  ItemBase(title: 'Tuesday', subTitle: '哈哈哈'),
  ItemBase(title: 'Wednesday', subTitle: ''),
  ItemBase(title: 'Thursday', subTitle: '我是魏振杰'),
  ItemBase(title: 'Friday', subTitle: ''),
  ItemBase(title: 'Saturday', subTitle: '你好呀'),
  ItemBase(title: 'Sunday', subTitle: ''),
  ItemBase(title: 'Monday', subTitle: '你是谁？'),
  ItemBase(title: 'Tuesday', subTitle: ''),
  ItemBase(title: 'Wednesday', subTitle: '不不不'),
  ItemBase(title: 'Thursday', subTitle: ''),
  ItemBase(title: 'Friday', subTitle: '我是你'),
  ItemBase(title: 'Saturday', subTitle: ''),
  ItemBase(title: 'Sunday', subTitle: '略略略'),
];

class GroupDetailPage extends StatefulWidget {
  final String groupName;

  GroupDetailPage({Key key, this.groupName = 'Test'}) : super(key: key);

  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  final _controller = ScrollController();

  List<ItemBase> _list = itemList;

  int matchedIndex = -1;
  int chosedIndex = -1;

  bool onMove = false;

  double chosedOffset = 0;

  double indexoffset(index) {
    return index * 145.0.w + 10.0 - _controller.offset;
  }

  void goTo(offset) => _controller.animateTo(
        offset,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );

  void goAlong(bool downWard) {
    _controller.animateTo(
      downWard ? _list.length * 145.w : -20,
      duration: Duration(milliseconds: (chosedIndex - matchedIndex).abs() * 500),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(widget.groupName),
          onTap: () {
            _controller.animateTo(
              -20.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          },
        ),
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
      ),
      body: Listener(
        child: Stack(
          children: [
            Scrollbar(
              child: ListView.builder(
                controller: _controller,
                padding: EdgeInsets.only(top: 10.0, bottom: 60.0),
                physics: BouncingScrollPhysics(),
                itemCount: _list.length,
                itemBuilder: (ctx, index) {
                  return AnimatedPadding(
                    padding: EdgeInsets.only(top: index == matchedIndex ? 145.0.w : 0),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.decelerate,
                    child: ItemWidget(
                      title: _list[index].title + '+$index',
                      subTitle: _list[index].subTitle,
                      sizeFactor: index == chosedIndex ? 0 : 1.0,
                      onPressed: () {
                        setState(() {
                          //onMoveIndex = index;
                        });
                      },
                      onLongPressed: () {
                        setState(() {
                          onMove = true;
                          chosedIndex = index;
                          matchedIndex = index + 1;
                          chosedOffset = indexoffset(chosedIndex);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: onMove ? chosedOffset : 0,
              child: ItemWidget(
                sizeFactor: onMove ? 1.0 : 0,
                title: onMove ? _list[chosedIndex].title : 'Test',
                subTitle: onMove ? _list[chosedIndex].subTitle : '',
                leadingIndex: 1,
                locked: true,
              ),
            ),
          ],
        ),
        onPointerMove: (e) {
          if (onMove) {
            setState(() {
              /*if (_list.length - chosedIndex > 5 && chosedOffset >= 1000.h)
                goAlong(true);
              else if (chosedIndex > 5 && chosedOffset <= 300.w) goAlong(false);*/
              chosedOffset += e.delta.dy;
              for (int i = 0; i < _list.length; i++)
                if (i != chosedIndex && (chosedOffset - indexoffset(i > chosedIndex ? i - 1 : i)).abs() <= 25) matchedIndex = i;
            });
          }
        },
        onPointerUp: (e) {
          if (onMove) {
            setState(() {
              onMove = false;
              if (chosedIndex > matchedIndex) {
                _list.insert(matchedIndex, _list[chosedIndex]);
                _list.removeAt(chosedIndex + 1);
              } else if (chosedIndex < matchedIndex) {
                _list.insert(chosedIndex, _list[matchedIndex]);
                _list.removeAt(matchedIndex + 1);
              }
              chosedIndex = matchedIndex = -1;
            });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          goTo(_controller.offset + 300.w);
        },
      ),
      backgroundColor: KColor.primaryColor,
    );
  }
}
