import 'package:flutter/material.dart';
import 'package:flutter_planplus/index.dart';
import 'package:flutter_planplus/widgets/list_item/sect_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'group.dart';

class ListPage extends StatefulWidget {
  final List<GroupBase> groups;

  ListPage({Key key, @required this.groups}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with SingleTickerProviderStateMixin {
  ///
  ///变量声明
  ///
  final ScrollController _scrollController = ScrollController();
  AnimationController _transController;
  Animation<double> _animation;

  var _list = <GroupBase>[];
  var _fixedList = <GroupBase>[];
  var _flexList = <GroupBase>[];
  var _clipList = <GroupBase>[]; //剪切板
  var _sectMap = <String, bool>{}; //记录sects，<分区标题，是否展开>

  final double _appBarHeight = 50;
  final double _itemHeight = 110.w;
  final double _dividerHeight = 2;
  double _expandedHeight; //固定列表所在的滑动栏高度

  int _chosenIndex = -1; //选中的item序号
  int _matchedIndex = -1; //匹配到的item序号
  int _tempIndex = 0; //在页面自动滚动时储存滑动匹配的item序号

  int _duration = 200; //动画时长，在不需要过渡动画时被设为0

  bool _onMove = false; //用于标记选中item并拖动的状态
  bool _onScroll = false; //用于在页面自动滚动时暂停匹配动画，以提升性能
  bool _onBack = false; //用于在回返时禁止不必要的匹配

  bool _barSelected = false; //用于区分所选item

  double _chosenOffset = 0; //选中的item偏移量
  double _tempOffset = 0; //储存临时偏移
  ///
  ///统一格式列表[_list]与操作列表[_fixedList]、[_flexList]互相转化，同时记录[_sectMap]
  ///
  void enList() {
    //正向
    for (int i = 0; i < _list.length; i++) {
      _list[i].index = i;
    }
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
    _expandedHeight = 50 + _itemHeight * _fixedList.length + _dividerHeight;
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
    for (int i = 0; i < _list.length; i++) {
      _list[i].index = i;
    }
    _expandedHeight = _appBarHeight + _itemHeight * _fixedList.length + _dividerHeight;
  }

  ///
  ///针对flexList的元素处理，包括自动化的增、删、改、查
  ///
  int getLengthAt(index) {
    if (_flexList[index].section != '_SECT') return 1;
    int num = 1;
    _flexList.forEach((element) {
      if (element.section == _flexList[index].title) num++;
    });
    return num;
  }

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

  void adaptAt(index) {
    ///前面无分区时，分区无需适应，普通组一律取消分区
    if (index == 0 || _flexList[index - 1].section == '') {
      if (_flexList[index].section != '_SECT') {
        _flexList[index].section = '';
      }
      return;
    }
    if (_flexList[index - 1].section == '_SECT') {
      ///当前面是分区栏（bar）时
      if (!_sectMap[_flexList[index - 1].title]) return; //分区未展开，无需适应
      if (_flexList[index].section != '_SECT')
        _flexList[index].section = _flexList[index - 1].title; //单组适应
      else {
        //分区适应
        _flexList.forEach((element) {
          //分区体适应
          if (element.section == _flexList[index].title) element.section = _flexList[index - 1].title;
        });
        _sectMap.remove(_flexList[index].title);
        _flexList.removeAt(index); //删除分区头
      }
    } else {
      ///当前面是分区体时
      if (!_sectMap[_flexList[index - 1].section]) return; //分区未展开，无需适应
      if (_flexList[index].section != '_SECT')
        _flexList[index].section = _flexList[index - 1].section; //单组适应
      else {
        //分区适应
        _flexList.forEach((element) {
          //分区体适应
          if (element.section == _flexList[index].title) element.section = _flexList[index - 1].section;
        });
        _sectMap.remove(_flexList[index].title);
        _flexList.removeAt(index); //删除分区头
      }
    }
  }

  void moveTo(int chosen, int target) {
    if (chosen == target) return;
    if (chosen < target) target -= getLengthAt(chosen);
    cutAt(chosen);
    pasteAt(target);
    adaptAt(target);
  }

  ///
  ///针对index的相关量计算
  ///
  //性质判断
  bool isNal(index) => _flexList[index].section == '';

  bool isBar(index) => _flexList[index].section == '_SECT';

  bool isMem(index) => (!isNal(index) && !isBar(index));

  bool isHidMem(index) => (isMem(index) && !_sectMap[_flexList[index].section]);

  bool isHidMap(index) => _sectMap.containsKey(_flexList[index].section) && !_sectMap[_flexList[index].section];

  //获取flexlist元素的偏移
  double indexOffset(index) {
    int _num = index;
    for (int i = 0; i < index; i++) {
      if (isHidMap(i)) _num--;
    }
    return _num * _itemHeight - _scrollController.offset + _expandedHeight + _dividerHeight;
  }

  //临近可见索引（要求本身可见，不会去检查讨论自身可见性）
  int lastIndex(index) {
    if (index == 0) return 0; //避免越界
    for (int i = index - 1; i >= 0; i++) {
      if (!isHidMem(i)) return i; //极简算法，消耗一定性能
    }
  }

  int nextIndex(index) {
    if (index + 1 >= _flexList.length) return _flexList.length - 1; //避免越界
    for (int i = index + 1; i < _flexList.length; i++) {
      if (!isHidMem(i)) return i; //极简算法，消耗一定性能
    }
  }

  ///
  ///页面滑动控制
  ///
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

  ///
  ///初始化，回收处理
  ///
  @override
  void initState() {
    //list处理
    _list = widget.groups;
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
          int _targetIndex = _matchedIndex > _chosenIndex ? lastIndex(_matchedIndex) : _matchedIndex;
          //位置更新
          _chosenOffset = (indexOffset(_targetIndex) - _tempOffset) * _animation.value + _tempOffset;
          print('chosen:$_chosenIndex($_chosenOffset);matched:$_matchedIndex;target:$_targetIndex;temp:$_tempIndex($_tempOffset)');
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _onBack = false;
            //回返后对列表元素进行重排序
            moveTo(_chosenIndex, _matchedIndex);
            _chosenIndex = _matchedIndex = -1;
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

  ///
  ///渲染构建
  ///
  @override
  Widget build(BuildContext context) {
    bool _actorAlive = _onMove || _onBack;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Listener(
        child: Stack(
          children: [
            PrimaryScrollController(
              controller: _scrollController,
              child: CupertinoScrollbar(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      leading: Icon(
                        Icons.lock,
                        color: KColor.primaryColor,
                      ),
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                          onPressed: () {},
                        )
                      ],
                      title: Text(
                        "固定组",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      expandedHeight: _expandedHeight,
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
                      delegate: generateFlexGroups(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _actorAlive ? _chosenOffset : 0,
              child: _barSelected
                  ? SectionBar(
                      sizeFactor: _actorAlive ? 1.0 : 0,
                      title: _actorAlive ? _flexList[_chosenIndex].title : '',
                      shadowed: true,
                    )
                  : SectableItem(
                      sizeFactor: _actorAlive ? 1.0 : 0,
                      title: _actorAlive ? _flexList[_chosenIndex].title : '',
                      shadowed: true,
                    ),
            ),
          ],
        ),
        onPointerMove: (e) {
          if (_onMove) {
            setState(() {
              _duration = 200;
              _chosenOffset += e.delta.dy;

              ///辅助滑动
              if (_chosenOffset <= 150.h && _tempIndex > 0)
                scrollAlong(-_itemHeight * 2);
              else if (_chosenOffset >= 1000.h && _tempIndex < _list.length - 1) scrollAlong(_itemHeight * 2);

              ///判断匹配
              for (int i = 0; i <= _list.length; i++) {
                //跳过部分
                if (i == _chosenIndex) continue;
                if (isHidMap(i)) continue;
                //寻找最近算法
                if ((_chosenOffset - indexOffset(i > _chosenIndex ? lastIndex(i) : i)).abs() <= 10) {
                  if (_onScroll) {
                    _tempIndex = i;
                    _matchedIndex = -1;
                  } else
                    _tempIndex = _matchedIndex = i;
                }
              }
            });
          }
        },
        onPointerUp: (e) {
          if (_onMove) {
            _duration = 0;
            _tempOffset = _chosenOffset;
            if (_onScroll) _matchedIndex = _tempIndex; //就近找地方安置
            _transController.reset(); //保证控制器顺利启动
            _transController.forward();
            _onMove = false;
            _onBack = true; //回弹
          }
        },
      ),
    );
  }

  ///
  ///关于list的渲染逻辑
  ///
  //生成固定组列表
  List<Widget> generateFixedGroups() {
    var list = <Widget>[];
    list.add(
      ShadowedDivider(
        height: _dividerHeight,
      ),
    );
    _fixedList.forEach((element) {
      list.add(SectableItem(
        title: element.title,
        leadingIndex: element.iconRef,
        colorLeading: KRndColor.newColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupPage(groupBase: element),
            ),
          );
        },
      ));
    });
    return list;
  }

  //逐一生成非固定组
  SliverChildBuilderDelegate generateFlexGroups() {
    return SliverChildBuilderDelegate(
      (BuildContext context, num index) {
        var _index = index - 1; //去掉divider的实际索引
        var _element = _flexList[index > 0 ? _index : 0];
        var _sected = _sectMap.containsKey(_element.section);
        var _unfolded = _element.section == '_SECT' ? _sectMap[_element.title] : _sectMap[_element.section];
        var _matched = _index == _matchedIndex;
        var _chosen = _index == _chosenIndex;
        return index == 0
            ? ShadowedDivider(height: _dividerHeight)
            : AnimatedPadding(
                padding: EdgeInsets.only(top: _matched ? _itemHeight : 0),
                duration: Duration(milliseconds: _duration),
                curve: Curves.decelerate,
                child: _element.section == '_SECT'
                    ? SectionBar(
                        title: _element.title,
                        unfolded: _unfolded,
                        sizeFactor: _chosen ? 0 : 1,
                        onPressed: () {
                          setState(() {
                            _sectMap[_element.title] = !_unfolded;
                          });
                        },
                        onLongPressed: () {
                          setState(() {
                            _sectMap[_element.title] = false; //先将展开的分区关闭
                            _barSelected = true;
                            _chosenIndex = _index;
                            _matchedIndex = nextIndex(_index);
                            _chosenOffset = indexOffset(_chosenIndex);
                            _duration = 0;
                            _onMove = true;
                          });
                        },
                      )
                    : AnimatedOpacity(
                        opacity: 1.0 *
                            (_sected
                                ? _unfolded
                                    ? 1.0
                                    : 0.0
                                : 1.0),
                        duration: Duration(milliseconds: _duration),
                        curve: Curves.easeInExpo,
                        child: AnimatedContainer(
                          height: _itemHeight *
                              (_chosen
                                  ? 0
                                  : _sected
                                      ? _unfolded
                                          ? 1
                                          : 0
                                      : 1),
                          duration: Duration(milliseconds: _chosen ? 0 : 250),
                          curve: Curves.decelerate,
                          child: SectableItem(
                            title: _sected
                                ? _unfolded
                                    ? _element.title
                                    : ''
                                : _element.title,
                            colorLeading: KRndColor.newColor,
                            sected: _sected,
                            sizeFactor: _chosen ? 0 : 1.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GroupPage(groupBase: _element),
                                ),
                              );
                              _duration = 0;
                            },
                            onLongPressed: () {
                              setState(() {
                                _barSelected = false;
                                _chosenIndex = _index;
                                _matchedIndex = nextIndex(_index);
                                _chosenOffset = indexOffset(_chosenIndex);
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
    );
  }
}

///
/// ShadowedDivider
///
class ShadowedDivider extends StatelessWidget {
  final double height;
  final bool hidden;

  const ShadowedDivider({
    Key key,
    @required this.height,
    this.hidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      indent: 16,
      color: hidden ? Colors.white : Colors.black12,
      thickness: height / 2,
    );
  }
}
