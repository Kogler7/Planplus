import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/list_item/sect_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

List<GroupBase> groupList = [
  GroupBase(title: 'Monday', section: '_FIXED', index: 1),
  GroupBase(title: 'Tuesday', section: '_FIXED', index: 2),
  GroupBase(title: 'Wednesday', section: '_FIXED', index: 3),
  GroupBase(title: 'Monday', section: 'Week'),
  GroupBase(title: 'Tuesday', section: 'Week'),
  GroupBase(title: 'Wednesday', section: 'Week'),
  GroupBase(title: 'Thursday', section: 'Kogler'),
  GroupBase(title: 'Friday', section: 'Kogler'),
  GroupBase(title: 'Saturday', section: 'Kogler'),
  GroupBase(title: 'Sunday', section: 'Kogler'),
  GroupBase(title: 'Monday', section: ''),
  GroupBase(title: 'Tuesday', section: ''),
  GroupBase(title: 'Wednesday', section: 'haha'),
  GroupBase(title: 'Thursday', section: 'haha'),
  GroupBase(title: 'Friday', section: 'lala'),
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

class QueryListPage extends StatefulWidget {
  @override
  _QueryListPageState createState() => _QueryListPageState();
}

class _QueryListPageState extends State<QueryListPage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  AnimationController _transController;
  Animation<double> _animation;

  List<GroupBase> _list = groupList;
  var _fixedList = <GroupBase>[];
  var _flexList = <GroupBase>[];
  var _clipList = <GroupBase>[]; //剪切板
  var _sectMap = <String, bool>{}; //记录sects，<分区标题，是否展开>

  final double _appBarHeight = 50;
  final double _itemHeight = 110.w;

  int _chosedIndex = -1; //选中的item序号
  int _matchedIndex = -1; //匹配到的item序号
  int _tempIndex = 0; //在页面自动滚动时储存滑动匹配的item序号

  int _duration = 200; //动画时长，在不需要过渡动画时被设为0

  bool _onMove = false; //用于标记选中item并拖动的状态
  bool _onScroll = false; //用于在页面自动滚动时暂停匹配动画，以提升性能
  bool _onBack = false; //用于在回返时禁止不必要的匹配

  bool _barSelected = false; //用于区分所选item

  double _chosedOffset = 0; //选中的item偏移量
  double _tempOffset = 0; //储存临时偏移

  void enList() {
    //正向
    _list.forEach((element) {
      if (element.section == '_FIXED')
        _fixedList.add(element);
      else {
        if (element.section != '' && !_sectMap.containsKey(element.section)) {
          _flexList.add(GroupBase(
            title: element.section,
            section: '_SECT',
          ));
          _sectMap[element.section] = false;
        }
        _flexList.add(element);
      }
    });
  }

  void deList() {
    //反向
    List<GroupBase> _tempList;
    _fixedList.forEach((element) {
      _tempList.add(element);
    });
    _flexList.forEach((element) {
      if (element.section != '_SECT') _tempList.add(element);
    });
    _list = _tempList;
  }

  //针对flexList的元素处理
  void insertAt(index, {target}) {
    if (target is GroupBase)
      _flexList.insert(index, target);
    else if (target is List<GroupBase>) {
      _flexList.insertAll(index, target);
    } else
      _flexList.insert(
        index,
        GroupBase(
          title: '新建分组',
          section: '',
        ),
      );
  }

  void deleteAt(index) {
    String mark = _flexList[index].section;
    _flexList.removeAt(index);
    if (mark == '_SECT' && _flexList[index].section != '') {
      mark = _flexList[index].section;
      _flexList.removeWhere((element) => element.section == mark);
    }
  }

  void copyAt(index) {
    String mark = _flexList[index].section;
    _clipList = [_flexList[index]];
    if (mark == '_SECT' && _flexList[index + 1].section != '') {
      mark = _flexList[index + 1].section;
      _flexList.forEach((element) {
        if (element.section == mark) _clipList.add(element);
      });
    }
  }

  void cutAt(index) {
    copyAt(index);
    deleteAt(index);
  }

  void pasteAt(index) {
    insertAt(index, target: _clipList.length > 1 ? _clipList : _clipList[0]);
  }

  void enCustomAt(index) {
    if (_flexList[index].section == '_SECT') return;
    if (index == 0) {
      _flexList[index].section = '';
      return;
    }
    _flexList[index].section = _flexList[index - 1].section == '_SECT' ? _flexList[index - 1].title : _flexList[index - 1].section;
  }

  void moveTo(int chosen, int target) {
    if (chosen == target) return;
    copyAt(chosen);
    pasteAt(target);
    enCustomAt(target);
    if (chosen > target)
      deleteAt(chosen + 1);
    else
      deleteAt(chosen);
  }

  //生成固定组列表
  List<Widget> generateFixedGroups() {
    var list = <Widget>[];
    _fixedList.forEach((element) {
      list.add(SectableItem(
        title: element.title,
        leadingIndex: element.index,
      ));
    });
    return list;
  }

  //获取flexlist元素的偏移
  double indexOffset(index) {
    return index * _itemHeight - _scrollController.offset;
  }

  void scrollTo(offset) => _scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );

  void scrollAlong(delta) {
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
    //list处理
    enList();
    //动画控制器初始化
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
            moveTo(_chosedIndex, _matchedIndex);
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
          PrimaryScrollController(
            controller: _scrollController,
            child: CupertinoScrollbar(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 5,
                    pinned: false,
                    snap: false,
                    floating: true,
                    //去掉默认leading
                    automaticallyImplyLeading: false,
                    actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
                    title: Text(
                      "固定组",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    expandedHeight: 50 + 110.w * _fixedList.length,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Column(
                            children: generateFixedGroups(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, num index) {
                        bool _matched = index == _matchedIndex;
                        bool _chosed = index == _chosedIndex;
                        var _index = index - 1;
                        var _element = _flexList[index > 0 ? _index : 0];
                        var _sected = _sectMap.containsKey(_element.section);
                        return index == 0
                            ? Divider(
                                height: 4,
                                color: Colors.black12,
                                thickness: 2,
                              )
                            : AnimatedPadding(
                                padding: EdgeInsets.only(top: _matched ? _itemHeight : 0),
                                duration: Duration(milliseconds: _duration),
                                curve: Curves.decelerate,
                                child: _element.section == '_SECT'
                                    ? SectionBar(
                                        title: _element.title,
                                        onPressed: () {
                                          setState(() {
                                            _sectMap[_element.title] = !_sectMap[_element.title];
                                          });
                                        },
                                        onLongPressed: () {
                                          setState(() {
                                            _chosedIndex = _index;
                                            _matchedIndex = _index + 1;
                                            _chosedOffset = indexOffset(_chosedIndex);
                                            _duration = 0;
                                            _onMove = true;
                                          });
                                        },
                                      )
                                    : AnimatedOpacity(
                                        opacity: 1.0 *
                                            (_sected
                                                ? _sectMap[_element.section]
                                                    ? 1.0
                                                    : 0.0
                                                : 1.0),
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeInExpo,
                                        child: AnimatedContainer(
                                          height: 110.w *
                                              (_sected
                                                  ? _sectMap[_element.section]
                                                      ? 1.0
                                                      : 0.0
                                                  : 1.0),
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.decelerate,
                                          child: SectableItem(
                                            title: _sected
                                                ? _sectMap[_element.section]
                                                    ? _element.title
                                                    : ''
                                                : _element.title,
                                            sected: _sected,
                                            onPressed: () {
                                              _scrollController.animateTo(
                                                0,
                                                duration: Duration(milliseconds: 500),
                                                curve: Curves.decelerate,
                                              );
                                              _duration = 0;
                                            },
                                            onLongPressed: () {
                                              setState(() {
                                                _chosedIndex = _index;
                                                _matchedIndex = _index + 1;
                                                _chosedOffset = indexOffset(_chosedIndex);
                                                _duration = 0;
                                                _onMove = true;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                              );
                      },
                      childCount: _flexList.length,
                    ), //子Item的个数
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: _actorAlive ? _chosedOffset : 0,
            child: _barSelected
                ? SectionBar(
                    sizeFactor: _actorAlive ? 1.0 : 0,
                    title: _actorAlive ? _flexList[_chosedIndex].title : '',
                    shadowed: true,
                  )
                : SectableItem(
                    sizeFactor: _actorAlive ? 1.0 : 0,
                    title: _actorAlive ? _flexList[_chosedIndex].title : '',
                    shadowed: true,
                  ),
          ),
        ],
      ),
    );
  }
}
