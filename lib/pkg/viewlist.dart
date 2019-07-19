import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/pkg/shopcard.dart';
import 'package:flutter_app/model/loginModel.dart';
class ViewList extends StatefulWidget{

  String material_id;
  ViewList({this.material_id}){

  }
  State<StatefulWidget> createState()=>_ViewList();
}

class _ViewList extends State<ViewList>{

  List<ShopModel> shoplist;
  String material_id;
  @override
  void initState() {
    shoplist=new List<ShopModel>();
    // TODO: implement initState
    super.initState();
    this.material_id=widget.material_id;
    this.getdata();
  }
  void getdata()async{

  Token token=await Token.getInstance();
  print(token.getToken());
  Dio dio=Dio();

  Response response =await dio.post(Host+"/v1/shop/optimus",data:{"material_id":this.material_id},options:getOptions(token.getToken()));
  print(response.data);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: ListView.builder(
//        shrinkWrap: true,
      itemCount: this.shoplist.length,
       itemBuilder: (BuildContext context,int index){

         if(this.shoplist.length>this.shoplist.length-1){

           this.getdata();
         }
         return ShopCard();
       },



      ) ,
    );

  }
}
class ShopModel{
  int item_id; //商品id
  int user_type;  //店铺信息-卖家类型，0表示集市，1表示商城
  int coupon_remain_count;  //优惠券信息-优惠券剩余量
  int  coupon_start_fee;  //优惠券信息-优惠券起用门槛，满X元可用。如：满299元减20元
  String item_description;  //商品信息-宝贝描述（推荐理由,不一定有）
  int volume;   //销量
  String coupon_end_time; //优惠券结束时间
  String pict_url;  //主图
  String white_image;  //白底图
  String coupon_info;  //满减信息
  String coupon_share_url;  //链接-宝贝+券二合一页面链接
  String nick; //店铺信息-卖家昵称
  String commission_rate;  //佣金比例
  String click_url;  //推广链接
  String title;
  String reserve_price;  //价格
  String zk_final_price; //折扣价格
}