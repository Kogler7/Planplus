import 'package:flutter/material.dart';
import 'package:flutter_planplus/config/image.dart';
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
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(image: KImage.splash_bk,fit: BoxFit.cover),
              Image(image: KImage.splash_ft),
              Align(
                alignment: Alignment(-0.8,-0.8),
                child: SizedBox(
                  height: 55.0,
                  width: 55.0,
                  child: Image(
                    image: KImage.logo_t,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.7,0.97),
                child: Text(
                  'Copyright © 2021 The Planplus Authors. All rights reserved. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}