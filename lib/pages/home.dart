import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/Search.dart';


class Home extends StatefulWidget{
  State<StatefulWidget> createState()=>_Home();
}
class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: HomeSearch(),
        backgroundColor: Color.fromRGBO(	248,248,255, 1.0)
      ),

      body:Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
//class HomeSwiper extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ;
//  }
//}