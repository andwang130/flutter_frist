import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/shopcard.dart';
import 'package:flutter_app/pkg/back.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/pages/share.dart';
class Shop extends StatelessWidget{


  String title; //标题
  String image; //图片
  double income ; //可赚
  int sales; //销量
  int coupon; //优惠券
  double price; //价格
  double disprice; //优惠后的价格
  String coupon_start_fee;//优惠券信息-优惠券起用门槛，满X元可用。如：满299元减20元
  String commission_rate; //佣金比例
  String coupon_share_url;  //链接-宝贝+券二合一页面链接
  Shop({this.title="",this.image="",this.sales=0,this.coupon=0,this.price=0,this.disprice,
    this.income=0,
    this.coupon_start_fee="",
    this.commission_rate="",
    this.coupon_share_url=""}){

  }
  languchurl()async{
    String url ="https://t.asczwa.com/taobao?backurl="+this.coupon_share_url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(	240,248,255, 1),
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(35),
        child:AppBar(key:Key("2"),
          leading:Back(context),
          title: Text("宝贝信息",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),
        ),
      body:ListView(children: <Widget>[
        Container(
          color: Colors.redAccent,
          height: 300,
          width: MediaQuery.of(context).size.width,
          child:Image.network(this.image,fit: BoxFit.fitWidth,),),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
          child: Column(

          children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                flex: 5,
                child:Text(this.title)),
            Expanded(
                flex: 1,
                child:Align(
                  alignment: Alignment.topRight,
                  child:IconButton(
                      tooltip: "123",
                      iconSize: 35,
                      icon:Icon(Icons.find_in_page,),
                      onPressed: this.languchurl),)
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
                  Text("${this.disprice}")
                ],),
                Container(height: 5,),
                Row(
                  children: <Widget>[
                    Text("现价"),
                    Container(width: 15,),
                    Text("￥"),
                    Text("${this.price}")
                  ],
                )
              ],
            ),
            Expanded( child: Align(child: Text("已售：${this.sales}件"),
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
              Text("${this.coupon}元",style: TextStyle(color: Colors.redAccent)),
              Text(" (满${this.coupon_start_fee}元可以使用)",style: TextStyle(color: Colors.grey),)
            ],),
            Row(children: <Widget>[
              Icon(Icons.monetization_on,color: Colors.grey,),
              Container(width: 5,),
              Text("佣金"),
              Container(width: 5,),
              Text("${this.commission_rate}%",style: TextStyle(color: Colors.redAccent),),
              Text(" (预计￥${this.income}元)",style:TextStyle(color: Colors.grey))
            ],),
          ],
        )
          ),
       Padding(
         padding: EdgeInsets.only(top: 10,bottom: 10),
         child:Container(child:Text("~~相似商品~~",textAlign: TextAlign.center,style: TextStyle(
         fontSize: 30,
         color: Colors.deepOrange,
       )),),),
        Container(
          child: Column(children: <Widget>[


          ],),),


      ],),
      bottomNavigationBar:  Container(

          height: 50,
          child: FlatButton(
            color: Colors.deepOrange,
            child: Text("立即分享"),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Shaer(
            title: this.title,
            price: this.price,
            disprice: this.disprice,
            commission_rate:this.commission_rate,
              income: this.income,
            coupon_share_url: this.coupon_share_url,
          ),));
          },)
      ) ,

    );
  }
}