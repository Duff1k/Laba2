import 'package:flutter/material.dart';
import 'main.dart';
import 'TestAPI.dart';
import 'Card.dart';


class SecondPage extends StatelessWidget {
  final ListData data;
  final int current;
  const SecondPage({Key key, this.data, this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: Stack(children:<Widget>[
      backGround(size),
      PageView.builder(
      itemCount: data.data.length,
      controller: PageController(initialPage: current, keepPage: true, viewportFraction: 0.84),
      itemBuilder: (BuildContext context, index){
        return Stack(children: <Widget>[
          Cards(data: data.data[index],),
        ],);    

      },
    ),
    ]
    )
    );
  }
}