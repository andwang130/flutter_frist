import 'package:flutter/material.dart';
class DealCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(left: 15, right: 10, top: 10),
      child:Container(
        child: Column(
          children: <Widget>[

            Padding(padding: EdgeInsets.only(left: 15,right: 15),child:Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.network("http://img.alicdn.com/bao/uploaded/i2/3875673425/O1CN014G0woU1bAh3hLGDnr_!!0-item_pic.jpg"),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0,left: 10),
                          child: Text("云南古法黑糖姜茶大姨妈玫瑰纯正调理老红糖块土红糖手工正品气血"),),
                        Padding(
                          padding: EdgeInsets.only(top: 2,left: 10),
                          child: Text("店铺名称:明澄雅旗舰店",style: TextStyle(color:Colors.grey),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2,left: 10),
                          child:Container(
                            height: 25,
                            color: Color.fromRGBO(33, 182, 138, 1) ,
                            child:Text("订单结算",style: TextStyle(color: Colors.white),),),

                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Text("付款金额68"),),
                  Expanded(child: Text("预估收入5"),),
                  Expanded(child: Text("比率9%"),),
                ],
              ),),
               Padding(
                 padding: EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 10),
                 child:  Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Expanded(child: Text("2019-05-16 13:57:23付款",textAlign: TextAlign.left,style: TextStyle(fontSize: 12,color: Colors.grey),),),
                 Expanded(child: Text("2019-05-16 13:57:23结算",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey),),),

               ],
             ) ,)




          ],
        ),
      )
      ,);
  }
}