import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/appbarH35.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/model/loginModel.dart';

class Shaer extends StatefulWidget{
  String commission_rate; //佣金比例
  double price; //价格
  double disprice; //优惠后的价格
  String title; //标题
  String text;
  double income;
  String koulin="";
  String coupon_share_url;
  Shaer({this.commission_rate,this.price,this.disprice,this.title,this.income,this.coupon_share_url});
  State<StatefulWidget> createState()=>_Shaer();
}
class _Shaer extends State<Shaer>{
  String commission_rate; //佣金比例
  double price; //价格
  double disprice; //优惠后的价格
  String title; //标题
  String text="";
  double income;
  String koulin="";
  String coupon_share_url;

  @override
  void initState(){
        super.initState();
        this.coupon_share_url=widget.coupon_share_url;
        this.price=widget.price;
        this.disprice=widget.disprice;
        this.title=widget.title;
        this.income=widget.income;
        this.commission_rate=widget.commission_rate;
        this.text="";
        this.getkoulin();

  }

  getkoulin()async{
    Dio dio=Dio();

    Token token=await Token.getInstance();
    Response response=await dio.post(Host+ "/v1/shop/tkouling",data: {
      "url":"https:"+this.coupon_share_url,
      "text":this.title
    },options:getOptions(token.getToken()) );
    this.koulin=response.data["Data"]["Model"];
    this.text="${this.title}\n"+
        "[在售价]${this.price}元\n"+
        "[券后价]${this.disprice}元\n"+
        "______________________\n"+
        "复制这条信息,${this.koulin}，到[手机淘宝]即可查看";
    this.setState((){});


  }
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
              Text("您的佣金预计为${this.commission_rate}%(预计￥${this.income})",style: TextStyle(fontSize: 17,color:Colors.green[900] ),)

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

            child: Text(this.text,
              style: TextStyle(fontSize: 16),
            ),

          ) ,),
          Padding(padding: EdgeInsets.only(top: 25),child: Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            height: 55,
            
            width: MediaQuery.of(context).size.width,
            child: FlatButton(color: Colors.deepOrange,onPressed: (){

            Clipboard.setData(ClipboardData(text:this.text));
            showDialog(context: context,barrierDismissible:true,builder: (context){
              return Center(
                child:
                GestureDetector(child:Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 200,
                  color: Colors.white,
                  child: Text("复制成功",style: TextStyle(fontSize: 18,color: Colors.black),),
                ), onTap: (){
                  Navigator.pop(context);
                },),

              );
            });


            }, child: Text("复制文案",style: TextStyle(
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