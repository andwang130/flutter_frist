import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/pkg/shopcard.dart';
import 'package:flutter_app/model/shopModel.dart';

class SearchList extends StatelessWidget{

  List<ShopModel> shoplist;
  Function() getnext;


  SearchList({this.shoplist,this.getnext});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(

      child: ListView.builder(
//        shrinkWrap: true,
        itemCount: this.shoplist.length,
        itemBuilder: (BuildContext context,int index){

          if(index>this.shoplist.length-2){

            this.getnext();

          }
          ShopModel sp=shoplist[index];
          double _disprice=double.parse((sp.zk_final_price-sp.coupon_amount).toStringAsFixed(2));
          double _income=double.parse(((double.parse(sp.commission_rate)/100)*sp.zk_final_price).toStringAsFixed(2));
          return ShopCard(title:sp.title ,sales:sp.volume,coupon: sp.coupon_amount,
            price: sp.zk_final_price,disprice:_disprice,
            image: sp.pict_url,
            income:_income,);
        },



      ) ,
    );

  }
}
