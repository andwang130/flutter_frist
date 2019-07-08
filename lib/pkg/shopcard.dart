import 'package:flutter/material.dart';
import 'package:flutter_app/pages/shop.dart';
class ShopCard extends StatelessWidget {
  String title = "去脂肪粒油脂粒汗管粒消除眼部脸部瘤专用膏精华素男女"; //标题
  String image; //图片
  double income = 20; //可赚
  int sales = 20; //销量
  int coupon; //优惠券
  double price = 25; //价格
  double disprice; //优惠后的价格
//  ShopCard(this.sales,this.coupon,this.price,this.disprice){
//
//  }
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
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                      "http://gd1.alicdn.com/imgextra/i1/397990402/O1CN01CdNfpA1Eq9l1Ou5oi_!!397990402.png_400x400.jpg"),
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
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: couponIcon(1),
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
                                "${income}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "￥${price}",
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
            ShopButton(),

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
        Container(child: Text("${num}元"),
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
Widget ShopButton(){
  return   Container(

    alignment: Alignment.topRight,
    child: FlatButton.icon(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.deepOrange,
      highlightColor: Colors.blue,
      icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
      label:Row(children: <Widget>[
        Text("赚",style: TextStyle(fontSize: 15,color: Colors.white)),
        Text("1.26",style: TextStyle(fontSize: 20,color: Colors.white),)
      ],),
      onPressed: (){},

    ),
  );
}
