import 'dart:async';
import 'package:flutter/material.dart';
import 'TestAPI.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double sideLength = 50;
  ListData a;
  @override
  void initState() {
    super.initState();
    splash().then(
      (status){  
        if(status){
          replaceMain(a);
        }
        else{
          print('b');
        }
      }
    );
  }




Future<bool> splash() async{
  try {
    a = await JsonAPI().fetchData();
        if(a != null || a.data != null || a.data.length != 0)
          return true;
        else 
          return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

replaceMain(ListData b) {
  Navigator.of(context).pushReplacement(createRoute(b));
  //Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context) => MainApp(data : b)));
}


Route createRoute(ListData b){
  return PageRouteBuilder( transitionDuration: Duration(milliseconds: 750),pageBuilder: (context, animation, secondaryAnimation) => MainApp(data: b),
    transitionsBuilder: (context, animation, secondaryAniomation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOutExpo;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition( 
        position: animation.drive(tween),
        child: child
      );
    },
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: 
    Container(
      child: 
          Opacity(
            opacity: 0.865,
            child: Image.asset("assets/wallpapersden.com_android-robot-glass_1440x2880.jpg")
          ), 
    ),
  );
}
}