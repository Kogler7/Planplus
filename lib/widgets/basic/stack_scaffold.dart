///层叠框架
import 'package:flutter/material.dart';

class StackedScaffold extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final Color backgroundColor;
  final Color appBarColor;
  final Color bottomAppBarColor;
  final Widget bottomAppBarChild;
  final NotchedShape bottomAppBarShape;
  final Clip bottomAppBarClipBehavior;
  final double notchMargin;

  final double appBarElevation;
  final double bottomAppBarElevation;
  final bool appBarCenterTitle;

  final Widget appBarTitle;
  final List<Widget> backLayer;
  final List<Widget> foreLayer;
  final List<Widget> appBarActions;

  const StackedScaffold({
    Key key,
    @required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.backLayer,
    this.foreLayer,
    this.backgroundColor = Colors.white,
    this.appBarElevation = 3,
    this.bottomAppBarElevation = 3,
    this.appBarColor = Colors.blue,
    this.bottomAppBarColor = Colors.blue,
    this.bottomAppBarChild,
    this.bottomAppBarShape,
    this.bottomAppBarClipBehavior = Clip.none,
    this.notchMargin = 4.0,
    this.appBarCenterTitle,
    this.appBarTitle,
    this.appBarActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasBackLayer = backLayer != null;
    return Stack(
      fit: StackFit.expand,
      children: [
        ...backLayer ?? [SizedBox.expand()],
        Scaffold(
          backgroundColor: _hasBackLayer ? Colors.transparent : backgroundColor,
          appBar: AppBar(
            backgroundColor: _hasBackLayer ? Colors.transparent : appBarColor,
            elevation: _hasBackLayer ? 0 : appBarElevation,
            title: appBarTitle,
            centerTitle: appBarCenterTitle,
            actions: appBarActions,
          ),
          body: body,
          bottomNavigationBar: BottomAppBar(
            color: _hasBackLayer ? Colors.transparent : bottomAppBarColor,
            elevation: _hasBackLayer ? 0 : appBarElevation,
            notchMargin: notchMargin,
            child: bottomAppBarChild,
            clipBehavior: bottomAppBarClipBehavior,
            shape: bottomAppBarShape,
          ),
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
        ),
        ...foreLayer ?? [SizedBox.expand()],
      ],
    );
  }
}
