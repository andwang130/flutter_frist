import 'package:flutter/material.dart';
class Tools extends StatefulWidget{
  State<StatefulWidget> createState()=>_Tools();
}
class _Tools extends State<Tools>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
       Container(
       height: 30,
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Row(children: <Widget>[
          Icon(Icons.lightbulb_outline),
          Text("通过转换后链接所产生的订单才能计入您的佣金中")
        ],)
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child:Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          color: Colors.white,
          child:  Container(
            padding: EdgeInsets.all(10),
            child: Column(
            children: <Widget>[
              Row(children:
              <Widget>[
                Expanded(child:   Text("待转换的链接",textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),),

                Expanded(child:   Text("待转换的链接",textAlign: TextAlign.right,),),
              ],),
              Container(
                height: 200,
                child: TextField(
                  maxLength: 200,
                  maxLines: 8,
                  decoration: InputDecoration(
                      filled:true,
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                         ),
                      fillColor: Colors.white,
                      hintText:"输入原始链接或者淘口令"),),)

            ],
          ),) ),


      ),
      Padding(padding: EdgeInsets.only(top: 10),
      child: Container(
        width: 350,
        height: 45,
        child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){},
            color: Colors.yellow, 
            child: Text("转换")),
      ))

    ],);
  }
}