import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/shopcard.dart';
class ViewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: ListView(
//        shrinkWrap: true,
        children: <Widget>[
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),
          ShopCard(),


        ],
      ) ,
    );

  }
}