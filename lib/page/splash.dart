import 'package:flutter/material.dart';
import '../router/index.dart';

class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState()=>_SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Applicat.goTo(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: const <Widget>[
              FlutterLogo(size: 48),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Loding...',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}