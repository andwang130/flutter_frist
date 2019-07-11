import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/appbarH35.dart';
import 'package:flutter_app/pkg/dealcard.dart';
var tabs=[
  Tab(text: "所有订单",),
  Tab(text: "下级订单",),
];
class Deal extends StatefulWidget{
  State<StatefulWidget> createState()=>_Deal();
}
class _Deal extends State<Deal> with SingleTickerProviderStateMixin{

  TabController mcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.mcontroller=TabController(length: tabs.length,vsync:this);
  }
  List<Widget> loadTabview(){
    var  wlist= List<Widget>();
    for (var i in tabs){
      wlist.add(Container(
        child: ListView(
          children: <Widget>[
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
            DealCard(),
          ],
        ),
      ));
    }
    return wlist;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(

          title: Text("订单",style: TextStyle(color: Colors.black),),
          leading:GestureDetector(child:Icon(Icons.arrow_back_ios,color: Colors.black54,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        bottom: TabBar(

          labelColor:Colors.black,
        tabs: <Widget>[
          Tab(text: "所有订单",),
          Tab(text: "下级订单",),
        ],controller: this.mcontroller,),

      ),
      body:TabBarView(children: this.loadTabview(),controller: this.mcontroller,),


    );
  }
}