import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/color.dart';
import 'package:flutter_planplus/config/image.dart';

class GlassicGround extends StatelessWidget {
  final Widget child;
  final double blur;

  GlassicGround({
    Key key,
    this.child,
    this.blur = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}

class GlassicContainer extends StatelessWidget {
  final Key key;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final Matrix4 transform;
  final Widget child;
  final double borderRadius;
  final BoxShape shape;
  final double border;
  final double blur;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;

  GlassicContainer({
    this.key,
    this.child,
    this.alignment,
    this.padding,
    this.shape = BoxShape.rectangle,
    this.constraints,
    this.margin,
    this.transform,
    @required this.width,
    @required this.height,
    @required this.borderRadius,
    @required this.linearGradient,
    @required this.border,
    @required this.blur,
    @required this.borderGradient,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid()),
        super(key: key);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, showName: false, defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding, defaultValue: null));
    properties.add(DiagnosticsProperty<BoxConstraints>('constraints', constraints, defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin, defaultValue: null));
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      alignment: alignment,
      height: height,
      transform: transform,
      child: Stack(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur * 2),
              child: Container(
                alignment: alignment ?? Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: linearGradient,
                ),
              ),
            ),
          ),
          GlassicBorder(
            strokeWidth: border,
            radius: borderRadius,
            width: width,
            height: height,
            gradient: borderGradient,
          ),
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class GlassicBorder extends StatelessWidget {
  final _GradientPainter _painter;
  final double _radius;
  final width;
  final height;

  GlassicBorder({
    @required double strokeWidth,
    @required double radius,
    @required Gradient gradient,
    @required this.height,
    @required this.width,
  })  : this._painter = _GradientPainter(strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      size: MediaQuery.of(context).size,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
        ),
        width: width,
        height: height,
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({@required double strokeWidth, @required double radius, @required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;
  final Paint paintObject = Paint();
  final Paint paintObject2 = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    RRect innerRect2 = RRect.fromRectAndRadius(
        Rect.fromLTRB(strokeWidth, strokeWidth, size.width - (strokeWidth), size.height - (strokeWidth)), Radius.circular(radius - strokeWidth));

    RRect outerRect = RRect.fromRectAndRadius(Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(radius));
    paintObject.shader = gradient.createShader(Offset.zero & size);

    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath2 = Path()..addRRect(innerRect2);
    canvas.drawPath(Path.combine(PathOperation.difference, outerRectPath, Path.combine(PathOperation.intersect, outerRectPath, innerRectPath2)), paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
