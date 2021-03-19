import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class FloatingBubblesLayer extends StatefulWidget {
  final int bubbleNum;
  final double maxRadius;
  final double maxSpeed;
  final int internal;
  final Size initField;

  FloatingBubblesLayer({
    Key key,
    this.bubbleNum = 20,
    this.maxRadius = 100,
    this.maxSpeed = 1.0,
    this.internal = 16,
    this.initField,
  });

  @override
  _FloatingBubblesLayerState createState() => _FloatingBubblesLayerState();
}

class _FloatingBubblesLayerState extends State<FloatingBubblesLayer> {
  //气泡集合
  List<BubbleBean> _list = [];
  Size _initField;

  //随机数
  Random _random = Random(DateTime.now().microsecondsSinceEpoch);

  //重绘更新流
  Stream _repaintStream;

  @override
  void initState() {
    super.initState();
    _initField = widget.initField ?? Size(400, 700);
    _repaintStream = Stream.periodic(Duration(milliseconds: widget.internal), (int) => 1);

    for (var i = 0; i < widget.bubbleNum; i++) {
      BubbleBean particle = new BubbleBean()
        //获取透明度随机的白色
        ..color = Color.fromARGB(_random.nextInt(190) + 10, 255, 255, 255)
        //随机指定一个位置
        ..postion = Offset(_random.nextDouble() * _initField.width, _random.nextDouble() * _initField.height)
        //随机半径
        ..radius = _random.nextDouble() * widget.maxRadius
        //随机角度
        ..theta = _random.nextDouble() * 2 * pi;
      //指定速度
      particle.speed = widget.maxSpeed - particle.radius / widget.maxRadius * widget.maxSpeed;
      //集合保存
      _list.add(particle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _repaintStream,
      builder: (ctx, snap) {
        //自定义画板
        return CustomPaint(
          //自定义画布
          painter: BubblePainter(
            list: _list,
            random: _random,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
          ),
        );
      },
    );
  }
}

class BubblePainter extends CustomPainter {
  //创建画笔
  Paint _paint = Paint();

  //气泡集合
  List<BubbleBean> list;

  //随机数
  Random random;

  BubblePainter({this.list, this.random});

  @override
  void paint(Canvas canvas, Size size) {
    //每次绘制都重新计算位置
    list.forEach((element) {
      //新的坐标
      var nowX = element.postion.dx + element.speed * cos(element.theta);
      var nowY = element.postion.dy + element.speed * sin(element.theta);
      //x轴边界计算
      if (element.postion.dx + element.radius < 0) {
        nowX = size.width + element.radius;
        element.theta = random.nextDouble() * 2 * pi;
      } else if (element.postion.dx - element.radius > size.width) {
        nowX = -element.radius;
        element.theta = random.nextDouble() * 2 * pi;
      }
      if (element.postion.dy + element.radius < 0) {
        nowY = size.height + element.radius;
        element.theta = random.nextDouble() * 2 * pi;
      } else if (element.postion.dy - element.radius > size.height) {
        nowY = -element.radius;
        element.theta = random.nextDouble() * 2 * pi;
      }
      //新的位置
      element.postion = Offset(nowX, nowY);
    });

    //循环绘制所有的气泡
    list.forEach((element) {
      //画笔颜色
      _paint.color = element.color;
      //绘制圆
      canvas.drawCircle(element.postion, element.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

///气泡属性配置
class BubbleBean {
  //位置
  Offset postion;

  //颜色
  Color color;

  //运动的速度
  double speed;

  //角度
  double theta;

  //半径
  double radius;
}
