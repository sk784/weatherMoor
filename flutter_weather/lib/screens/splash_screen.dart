import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  final String nextRoute;
  SplashScreen({this.nextRoute});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () {
          Navigator.of(context).pushReplacementNamed(widget.nextRoute);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image.network(
        'https://pngimg.com/uploads/sun/sun_PNG13449.png',
        width: 200.0,
        height: 200.0,
      ),
    )
    );
  }
}