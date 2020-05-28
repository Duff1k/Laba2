import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'SplashScreen.dart';
import 'TestAPI.dart';
import 'package:gradient_widgets/gradient_widgets.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        title: 'Welcome futter',
        home: SplashScreen());
  }
}

class MainApp extends StatelessWidget {
  final ListData data;
  const MainApp({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
            child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            backGround(size),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                    centerTitle: true,
                    expandedHeight: 150,
                    backgroundColor: Colors.black,
                    flexibleSpace: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text('Лабораторная работа 2',
                              //style:
                                  //TextStyle(fontSize: 26, color: Colors.white)),
                          Text('Сигалов Д.И',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text('ИКБО-03-18',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    )),
                SliverList(
                    
                    delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      
                      return GradientCard(
                          gradient: LinearGradient(colors: [
                            
                            Color.fromARGB(200, 144, 155, 255),
                            Color.fromARGB(200, 144, 155, 255)
                          ],),
                          margin: EdgeInsets.only(
                              bottom: 0, top:0,  left: 0),
                          shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                           ),
                          
                          child: ListTile(

                              onTap: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) =>
                                          SecondPage(data: data, current: index,))),
                              contentPadding: EdgeInsets.only(
                                  left: 25, top: 25, bottom: 25),
                              title: Text(
                                data.data[index].name,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 21, color: Colors.white),
                              ),
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                      topLeft: Radius.circular(100)),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          '${JsonAPI.imageURL}${data.data[index].graphic}',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Container(padding: EdgeInsets.only(left: 18, right: 19), child: Icon(Icons.error_outline)),
                                      height: 64,
                                      width: 64,
                                      fit: BoxFit.fill)
                              )
                          )
                        );
                  },
                  childCount: data.data.length,
                  )
                )
              ],
            ),
          ],
        )
      )
    );
  }
}


Widget backGround(size){
  return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [ 
                  Color.fromRGBO(184, 78, 255, 1),
                  Color.fromRGBO(255, 30, 209, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.repeated,
              )),
              height: size.height,
              width: size.width,
            );
}