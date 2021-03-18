import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

Offset calculateXY(double speed, double theta) => Offset(speed * cos(theta), speed * sin(theta));

class FloatingBubblesLayer extends StatefulWidget {
  final int bubbleNum;
  final double maxRadius;
  final double maxSpeed;
  final double maxTheta;
  final int internal;

  FloatingBubblesLayer({
    Key key,
    this.bubbleNum = 20,
    this.maxRadius = 100,
    this.maxSpeed = 0.7,
    this.maxTheta = 2 * pi,
    this.internal = 16,
  });

  @override
  _FloatingBubblesLayerState createState() => _FloatingBubblesLayerState();
}

class _FloatingBubblesLayerState extends State<FloatingBubblesLayer> {
  //气泡集合
  List<BubbleBean> _list = [];

  //随机数
  Random _random = Random(DateTime.now().microsecondsSinceEpoch);

  //重绘更新流
  Stream _repaintStream;

  @override
  void initState() {
    super.initState();

    _repaintStream = Stream.periodic(Duration(milliseconds: widget.internal), (int) => 1);

    for (var i = 0; i < widget.bubbleNum; i++) {
      BubbleBean particle = new BubbleBean()
        //获取随机透明度的白色颜色
        ..color = Color.fromARGB(_random.nextInt(190) + 10, 255, 255, 255)
        //指定一个位置 每次绘制时还会修改
        ..postion = Offset(-1, -1)
        //气泡运动速度
        ..speed = _random.nextDouble() * widget.maxSpeed
        //随机角度
        ..theta = _random.nextDouble() * widget.maxTheta
        //随机半径
        ..radius = _random.nextDouble() * widget.maxRadius;
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
      //计算偏移
      var velocity = calculateXY(element.speed, element.theta);
      //新的坐标 微偏移
      var dx = element.postion.dx + velocity.dx;
      var dy = element.postion.dy + velocity.dy;
      //x轴边界计算
      if (element.postion.dx < 0 || element.postion.dx > size.width) {
        dx = random.nextDouble() * size.width;
      }
      //y轴边界计算
      if (element.postion.dy < 0 || element.postion.dy > size.height) {
        dy = random.nextDouble() * size.height;
      }
      //新的位置
      element.postion = Offset(dx, dy);
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
