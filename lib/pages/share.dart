import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/appbarH35.dart';
class Shaer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppbarH35(context, "分享文案"),

      body: Column(
        children: <Widget>[


          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5),
            color: Colors.green[100],
            height: 35,
            alignment: Alignment.center,
            child: Row(
            children: <Widget>[
              Icon(Icons.monetization_on,color: Colors.green[300],),
              Text("您的佣金预计为6.00%(预计￥1.73)",style: TextStyle(fontSize: 17,color:Colors.green[900] ),)

            ],
          ) ,),
          Padding(padding: EdgeInsets.only(top: 10),child:Container(

            padding: EdgeInsets.only(left: 10,top: 10,right: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height: 250,
            width: MediaQuery.of(context).size.width-20,

            child: Text(
                "北部湾烤鸭蛋20枚大广西北海红树林正宗树林正宗树林正宗树林正宗树林正宗树林正宗树林正宗\n"+
                    "[在售价]31.9元\n"+
                "[券后价]28.80元\n"+
                "[下单链接]https//m.tb.cn/h.sesese\n"+
                "______________________\n"+
                    "复制这条信息,￥GMDAA4￥，到[手机淘宝]即可查看",
              style: TextStyle(fontSize: 16),
            ),

          ) ,),
          Padding(padding: EdgeInsets.only(top: 25),child: Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 55,
            
            width: MediaQuery.of(context).size.width,
            child: FlatButton(color: Colors.deepOrange,onPressed: (){}, child: Text("复制文案",style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(55)
            ),),
          ),)

        ],
      ),

    );
  }
}