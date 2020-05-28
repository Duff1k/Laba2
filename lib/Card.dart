import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labtwo/TestAPI.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Cards extends StatelessWidget {
  final Data data;
  const Cards({Key key, this.data,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    var sheight = size.height * 0.72;
    var swidth = size.width * 0.75;
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.only(right: 20, left: 4),
        curve: Curves.easeOutQuint,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255,150,51, 0.85), 
              Color.fromRGBO(255,194,61,0.85)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
            
          ),
          boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 25, offset: Offset(15, 11))],
        ),
        width: swidth,
        height: sheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            Flexible(flex: 1,child: Container(
                child: FittedBox(fit:BoxFit.fill,child:ClipRRect(child:CachedNetworkImage(
                  imageUrl: '${JsonAPI.imageURL}${data.graphic}',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Container(padding: EdgeInsets.only(left: 18, right: 18), child: Icon(Icons.error_outline)),),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft:Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                  
                ),),
              width: swidth,
              height: sheight*0.55,
              padding: EdgeInsets.only(top:20, left:20, right:20, bottom:12),
            
            ),
             
              ),
             
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(data.name, style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(text:'helptext: ', style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
                  TextSpan(text: data.helptext, style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                  ))
                ], style: DefaultTextStyle.of(context).style)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(text:'flags: ', style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                  
                  
                )),
                  TextSpan(text: data.flags.toString(), style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ))
                ], style: DefaultTextStyle.of(context).style)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(text:'req1: ', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                )),
                  TextSpan(text: data.req1.toString(), style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ))
                ], style: DefaultTextStyle.of(context).style)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text.rich(TextSpan(children: <TextSpan>[
                  TextSpan(text:'req2: ', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                )),
                  TextSpan(text: data.req2.toString(), style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                
                )
                )
                ]
            ),
           ),
              )
         ],
      ),
              
    )
    );
  }
}