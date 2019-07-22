import 'package:flutter/material.dart';
import 'package:flutter_app/pages/shop.dart';
class ShopCard extends StatelessWidget {
  String title; //标题
  String image; //图片
  double income = 20; //可赚
  int sales; //销量
  int coupon; //优惠券
  double price; //价格
  double disprice; //优惠后的价格
  ShopCard({this.title,this.sales,this.coupon,this.price,this.disprice,this.image,this.income=0}){

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => new Shop()));
        },
    
        child:Card(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:Container(
                height: 100,
                width: 100,
                child:Image.network(
                this.image)),
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(this.title,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child:this.coupon>0?couponIcon(this.coupon):Container(height: 5,),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "销量:${this.sales}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "券后￥",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              Text(
                                "${this.disprice}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "￥${this.price}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
            ShopButton(this.income),

          ],
        ),
      ),
    ),
      );

  }
}
Widget couponIcon(int num){
  return Container(
    height: 24,
    child: Row(
      children: <Widget>[
        Image.network("https://img.alicdn.com/imgextra/i4/720077060/O1CN01Fb3r5W221WlYIt3A5_!!720077060.png"),
        Container(
          alignment: Alignment.center,
          child: Text("${num}元"),
          height: 25,
          width: 35,
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(border:Border(
            right:BorderSide(width: 0.5,color: Colors.red),
            top: BorderSide(width: 0.5,color: Colors.red),
            bottom: BorderSide(width: 0.5,color: Colors.red),

          ),
          ),
        )
      ],
    ),
  );
}
Widget ShopButton(double num){
  return   Container(

    alignment: Alignment.topRight,
    child: FlatButton.icon(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.deepOrange,
      highlightColor: Colors.blue,
      icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
      label:Row(children: <Widget>[
        Text("赚",style: TextStyle(fontSize: 15,color: Colors.white)),
        Text("$num",style: TextStyle(fontSize: 20,color: Colors.white),)
      ],),
      onPressed: (){},

    ),
  );
}
