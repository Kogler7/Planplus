import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/index.dart';
import 'package:flutter_planplus/model/index.dart';
import 'package:flutter_planplus/widgets/list_item/sect_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:async';

List<GroupBase> groupList = [
  GroupBase(title: 'Monday', section: '_locked'),
  GroupBase(title: 'Tuesday', section: '_locked'),
  GroupBase(title: 'Wednesday', section: '_locked'),
  GroupBase(title: 'Thursday', section: '_locked'),
  GroupBase(title: 'Monday', section: 'Week'),
  GroupBase(title: 'Tuesday', section: 'Week'),
  GroupBase(title: 'Wednesday', section: 'Week'),
  GroupBase(title: 'Thursday', section: 'Week'),
  GroupBase(title: 'Friday', section: 'Week'),
  GroupBase(title: 'Saturday', section: 'Week'),
  GroupBase(title: 'Sunday', section: 'Week'),
  GroupBase(title: 'Monday', section: ''),
  GroupBase(title: 'Tuesday', section: ''),
  GroupBase(title: 'Wednesday', section: ''),
  GroupBase(title: 'Thursday', section: ''),
  GroupBase(title: 'Friday', section: ''),
  GroupBase(title: 'Saturday', section: ''),
  GroupBase(title: 'Sunday', section: ''),
  GroupBase(title: 'Monday', section: 'test'),
  GroupBase(title: 'Tuesday', section: 'test'),
  GroupBase(title: 'Wednesday', section: 'test'),
  GroupBase(title: 'Thursday', section: ''),
  GroupBase(title: 'Friday', section: ''),
  GroupBase(title: 'Saturday', section: ''),
  GroupBase(title: 'Sunday', section: ''),
];

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  AnimationController _transController;
  Animation<double> _animation;

  List<GroupBase> _list = groupList;
  final _groupHeight = 110.w;

  int _chosedIndex = -1; //选中的item序号
  int _matchedIndex = -1; //匹配到的item序号
  int _tempIndex = 0; //在页面自动滚动时储存滑动匹配的item序号

  int _duration = 200; //动画时长，在不需要过渡动画时被设为0

  bool _onMove = false; //用于标记选中item并拖动的状态
  bool _onScroll = false; //用于在页面自动滚动时暂停匹配动画，以提升性能
  bool _onBack = false; //用于在回返时禁止不必要的匹配

  bool _selectedBar = false; //用于区分所选item

  double _chosedOffset = 0; //选中的item偏移量
  double _tempOffset = 0; //储存临时偏移

  double indexOffset(index) {
    return index * _groupHeight + 10.0 - _scrollController.offset;
  }

  void goTo(offset) => _scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );

  void goAlong(delta) {
    if (!_onScroll) {
      _onScroll = true;
      _scrollController.animateTo(
        _scrollController.offset + delta,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      Future.delayed(Duration(milliseconds: 495), () {
        _onScroll = false;
      });
    }
  }

  @override
  void initState() {
    _transController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(parent: _transController, curve: Curves.decelerate);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animation)
      ..addListener(() {
        setState(() {
          int _targetIndex = _matchedIndex > _chosedIndex ? _matchedIndex - 1 : _matchedIndex;
          _chosedOffset = (indexOffset(_targetIndex) - _tempOffset) * _animation.value + _tempOffset;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _onBack = false;
            //回返后对列表元素进行重排序
            if (_chosedIndex > _matchedIndex) {
              _list.insert(_matchedIndex, _list[_chosedIndex]);
              _list.removeAt(_chosedIndex + 1);
            } else if (_chosedIndex < _matchedIndex) {
              _list.insert(_matchedIndex, _list[_chosedIndex]);
              _list.removeAt(_chosedIndex);
            }
            _chosedIndex = _matchedIndex = -1;
          });
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _actorAlive = _onMove || _onBack; //当拖动或回返时需要替身
    return Listener(
      child: Stack(
        children: [
          Scrollbar(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _list.length,
              itemBuilder: (ctx, index) {
                bool _matched = index == _matchedIndex;
                bool _chosed = index == _chosedIndex;
                return AnimatedPadding(
                  padding: EdgeInsets.only(top: _matched ? _groupHeight : 0),
                  duration: Duration(milliseconds: _duration),
                  curve: Curves.decelerate,
                  child: SectableItem(
                    title: _list[index].title,
                    sizeFactor: _chosed ? 0 : 1.0,
                    onPressed: () {
                      _duration = 0;
                    },
                    onLongPressed: () {
                      setState(() {
                        _chosedIndex = index;
                        _matchedIndex = index + 1;
                        _chosedOffset = indexOffset(_chosedIndex);
                        _duration = 0;
                        _onMove = true;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: _actorAlive ? _chosedOffset : 0,
            child: _selectedBar
                ? SectionBar(
                    title: _actorAlive ? _list[_chosedIndex].title : 'Test',
                    sizeFactor: _actorAlive ? 1.0 : 0,
                    shadowed: true,
                  )
                : SectableItem(
                    title: _actorAlive ? _list[_chosedIndex].title : 'Test',
                    sizeFactor: _actorAlive ? 1.0 : 0,
                    shadowed: true,
                  ),
          ),
        ],
      ),
      onPointerMove: (e) {
        if (_onMove) {
          setState(() {
            _duration = 200;
            _chosedOffset += e.delta.dy;
            //辅助滑动
            if (_chosedOffset <= 150.h && _tempIndex > 0)
              goAlong(-_groupHeight * 2);
            else if (_chosedOffset >= 1000.h && _tempIndex < _list.length - 1) goAlong(_groupHeight * 2);
            //判断匹配
            for (int i = 0; i <= _list.length; i++)
              if (i != _chosedIndex && (_chosedOffset - indexOffset(i > _chosedIndex ? i - 1 : i)).abs() <= 20) {
                if (_onScroll) {
                  _tempIndex = i;
                  _matchedIndex = -1;
                } else
                  _tempIndex = _matchedIndex = i;
              }
          });
        }
      },
      onPointerUp: (e) {
        if (_onMove) {
          _duration = 0;
          _tempOffset = _chosedOffset;
          if (_onScroll) _matchedIndex = _tempIndex; //就近找地方安置
          _transController.reset(); //保证控制器顺利启动
          _transController.forward();
          _onMove = false;
          _onBack = true; //回弹
        }
      },
    );
  }
}
