import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/back.dart';
class SearchInfo extends StatefulWidget{
   String serkey;

   SearchInfo(this.serkey){

   }
  @override
  State<StatefulWidget> createState(){
   return _SearchInfo();
  }


}
class _SearchInfo extends State<SearchInfo>{

  String _searkey;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    this._searkey=widget.serkey;
    print(this._searkey);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(


        child: AppBar(
            titleSpacing:0,
            backgroundColor: Colors.white70,
          leading: Back(context),
        title: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          ),
          child:GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:Container(
            alignment: Alignment.centerLeft,
            child: Text("去脂肪粒神器"),
          ),)
        ),


      ), preferredSize: Size.fromHeight(40)),
      body:
      Stack(),
    );

  }
}