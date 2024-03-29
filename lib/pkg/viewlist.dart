import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/pkg/shopcard.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/model/shopModel.dart';
class ViewList extends StatefulWidget{


  String material_id;


  ViewList({this.material_id,}){

  }
  State<StatefulWidget> createState()=>_ViewList();
}

class _ViewList extends State<ViewList>{

  List<ShopModel> shoplist;
  Function() getnext;
  String material_id;
  int page=1;
  @override
  void initState() {
     this.shoplist=new List<ShopModel>();
    // TODO: implement initState
    super.initState();


    this.material_id=widget.material_id;

      this.getdata();

  }

  void getdata()async{

  Token token=await Token.getInstance();

  print(this.page);
  Dio dio=Dio();


  Response response =await dio.post(Host+"/v1/shop/optimus",data:{"material_id":this.material_id,"Page_no":this.page.toString()},options:getOptions(token.getToken()));

  List<dynamic> datalist=response.data["Data"]["Map_data"];
  for(int i=0;i<datalist.length;i++){

    ShopModel shopModel=ShopModel.fromJson(datalist[i],0);
    this.shoplist.add(shopModel);
  }
  this.setState((){
    this.page++;
  });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(

      child: ListView.builder(
//        shrinkWrap: true,
      itemCount: this.shoplist.length,
       itemBuilder: (BuildContext context,int index){

         if(index>this.shoplist.length-2){
            this.getdata();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
         }
         ShopModel sp=shoplist[index];
         double _disprice=double.parse((sp.zk_final_price-sp.coupon_amount).toStringAsFixed(2));
         double _income=double.parse(((double.parse(sp.commission_rate)/100)*sp.zk_final_price).toStringAsFixed(2));
         String commission_rate= sp.commission_rate.toString();

         return ShopCard(
             title:sp.title,

           sales:sp.volume,
           coupon: sp.coupon_amount,
           price: sp.zk_final_price,disprice:_disprice,
           image: sp.pict_url,
            income:_income,
           commission_rate:commission_rate,
           coupon_start_fee: sp.coupon_start_fee,
             coupon_share_url:sp.coupon_share_url);
       },



      ) ,
    );

  }
}
