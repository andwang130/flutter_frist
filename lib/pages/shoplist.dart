import "package:flutter/material.dart";
import 'package:flutter_app/pkg/viewlist.dart';
import 'package:flutter_app/pkg/appbarH35.dart';
var tabs=[
  Tab(text: "综合",),
  Tab(text: "为你推荐",),
  Tab(text: "女装",),
  Tab(text: "天猫国际",),
  Tab(text: "家居加装",),
  Tab(text: "数码家店",),
  Tab(text: "母婴",),
  Tab(text: "食品",),
  Tab(text: "鞋包配饰",),
  Tab(text: "美妆个护",),
  Tab(text: "男装",),
  Tab(text: "内衣",),
  Tab(text: "运动户外",),

];
class ShopList extends StatefulWidget{

  State<StatefulWidget> createState()=>_ShopList();
}
class _ShopList extends State<ShopList> with SingleTickerProviderStateMixin{
  TabController mcontroller;
  @override
  void initState(){
    super.initState();
    this.mcontroller=TabController(length: tabs.length,vsync:this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppbarH35(context,"热销榜"),
      body:   NestedScrollView(
        headerSliverBuilder:(BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 160,
              backgroundColor: Color.fromRGBO(	240,248,255, 1),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,background:
              Container(
                height: 160,
                padding: EdgeInsets.only(bottom: 40),
                child: Image.network("https://gw.alicdn.com/tfs/TB1jRH4jgHqK1RjSZFkXXX.WFXa-920-340.jpg",fit: BoxFit.fill,),)
                ,),
              bottom:TabBar(
                tabs: tabs,
                indicatorColor:Colors.white30,
                labelColor:Colors.black,
                indicatorWeight: 1,
                indicatorSize:TabBarIndicatorSize.tab,
                isScrollable:true,
                controller: this.mcontroller,) ,)
          ];
        },
        body: TabBarView(children:this.loadTabview(),controller:this.mcontroller),
      ) ,
    );



  }
  List<Widget> loadTabview(){
    var  wlist= List<Widget>();
    for (var i in tabs){
      wlist.add(ViewList());
    }
    return wlist;
  }
}