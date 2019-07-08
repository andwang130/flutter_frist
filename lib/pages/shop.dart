import 'package:flutter/material.dart';
class Shop extends StatefulWidget{
  State<StatefulWidget> createState()=>_Shop();
}
class _Shop extends State<Shop>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(	240,248,255, 1),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(35),
        child:AppBar(key:Key("2"),
          leading:GestureDetector(child:Icon(Icons.arrow_back_ios,color: Colors.black54,),
            onTap: (){
            Navigator.pop(context);
            },
          ),
          title: Text("宝贝信息",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),
        ),
      body:Column(children: <Widget>[
        Container(
          color: Colors.redAccent,
          height: 300,
          width: MediaQuery.of(context).size.width,
          child:Image.network("http://gd3.alicdn.com/imgextra/i1/3476387311/O1CN0123sU6NIfdoST9Q8_!!3476387311.jpg",fit: BoxFit.fitWidth,),),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
          child: Column(

          children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                flex: 5,
                child:Text("去脂肪粒祛除膏眼霜消除眼部油脂粒导出神器仟露云草植萃精华霜女")),
            Expanded(
                flex: 1,
                child:Align(
                  alignment: Alignment.topRight,
                  child:IconButton(
                      tooltip: "123",
                      iconSize: 35,
                      icon:Icon(Icons.find_in_page,),
                      onPressed: (){

                      }),)
            ),
          ],
          ),
          Row(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    height: 30,
                    width: 50,
                    alignment: Alignment.center,
                    decoration:BoxDecoration(border: Border.all(width: 1,color: Colors.redAccent)),
                    child: Text("券后价",style: TextStyle(color: Colors.redAccent),),),
                  Container(width: 15,),
                  Text("95.30")
                ],),
                Container(height: 5,),
                Row(
                  children: <Widget>[
                    Text("现价"),
                    Container(width: 15,),
                    Text("￥"),
                    Text("150.00")
                  ],
                )
              ],
            ),
            Expanded( child: Align(child: Text("已售：30万件"),
            alignment: Alignment.bottomRight,),),
          ],),

          ],),
        ),
        Container(
          color: Colors.white10,
          padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
          child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.confirmation_number,color:Colors.grey,),
              Container(width: 5,),
              Text("优惠券"),
              Container(width: 5,),
              Text("320.0元",style: TextStyle(color: Colors.redAccent)),
              Text(" (满349.0使用)",style: TextStyle(color: Colors.grey),)
            ],),
            Row(children: <Widget>[
              Icon(Icons.monetization_on,color: Colors.grey,),
              Container(width: 5,),
              Text("佣金"),
              Container(width: 5,),
              Text("9.00%",style: TextStyle(color: Colors.redAccent),),
              Text(" (预计￥2.69元)",style:TextStyle(color: Colors.grey))
            ],),
          ],
        )
          ),

      ],),

    );
  }
}