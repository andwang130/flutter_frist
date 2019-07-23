import "package:flutter/material.dart";
import 'package:flutter_app/pkg/viewlist.dart';
import 'package:flutter_app/pkg/appbarH35.dart';

var title="title";
var value="value";
var  haohuo=[{title:"综合",value:4092}];
var tehui=[{title:"综合",value:4094}];
var  pinpai=[{title:"综合",value:3786},{title:'女装',value:3788},{title:'家居家装',value:3792},{title:"数码家电",value:3793},{title:'鞋包配饰',value:3796},{title:'美妆个护',value:3794},
{title:'男装',value:3790},{title:"内衣",value:3787},{title:"母婴",value:3789},{title:'食品',value:3791}
,{title:'运动户外',value:3795}];
var muyin=[{title:"母婴备孕",value:4040},{title:"0-6个月",value:4041},
{title:"7-12个月",value:4042},{title:"1-3岁",value:4043},{title:"4-6岁",value:4044},{title:"7-12岁",value:4045}];
var dare=[{title:"综合",value:9660},{title:'女装',value:9658},{title:'家居家装',value:9655},{title:"数码家电",value:9656},{title:'鞋包配饰',value:9648},{title:'美妆个护',value:9653},
{title:'男装',value:9654},{title:"内衣",value:9652},{title:"母婴",value:9650},{title:'食品',value:9649}
,{title:'运动户外',value:9651}];

var gaoyong=[{title:"综合",value:13366},{title:'女装',value:13367},{title:'家居家装',value:13368},{title:"数码家电",value:13369},{title:'鞋包配饰',value:13370},{title:'美妆个护',value:13371},
  {title:'男装',value:13372},{title:"内衣",value:13373},{title:"母婴",value:13374},{title:'食品',value:13375}
  ,{title:'运动户外',value:13376}];

var images={
  "tehui":"https://img.alicdn.com/imgextra/i2/720077060/O1CN01cqDTkV221WlpjcYot_!!720077060.png",
  "pinpai":"https://img.alicdn.com/imgextra/i3/720077060/O1CN019NGLGa221WluucWrX_!!720077060.png",
  "haohuo":"https://img.alicdn.com/imgextra/i4/720077060/O1CN01r69LMz221WltUoemy_!!720077060.png",
  "muying":"https://img.alicdn.com/imgextra/i3/720077060/O1CN01BBZogZ221Wlr9gobT_!!720077060.png",
  "gaoyong":"https://img.alicdn.com/imgextra/i4/720077060/O1CN01r69LMz221WltUoemy_!!720077060.png",
  "dare":"https://img.alicdn.com/imgextra/i2/720077060/O1CN01mRRmnM221WluSIM0M_!!720077060.png",
};

var tabs={
  "tehui":tehui,
  "pinpai":pinpai,
  "haohuo":haohuo,
  "muying":muyin,
  "gaoyong":gaoyong,
  "dare":dare,
};
class ShopList extends StatefulWidget{

  String shopkey;
  String image;
  ShopList(this.shopkey);
  State<StatefulWidget> createState()=>_ShopList();
}
class _ShopList extends State<ShopList> with SingleTickerProviderStateMixin{
  TabController mcontroller;
  String shopkey;
  String image;
  @override
  void initState(){
    super.initState();
    this.shopkey=widget.shopkey;
    this.image=images[this.shopkey];
    this.mcontroller=TabController(length: tabs[this.shopkey].length,vsync:this);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.mcontroller.dispose();
  }
  tabload(){
    List<Widget> wlist;
    wlist= List<Widget>();
    for (int i=0;i<tabs[this.shopkey].length;i++){

      wlist.add(Tab(text:tabs[this.shopkey][i][title]),);
    }
    return wlist;

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
                child: Image.network(this.image,fit: BoxFit.fill,),)
                ,),
              bottom:TabBar(
                tabs:this.tabload(),
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
    for (var i in tabs[shopkey]){
      wlist.add(ViewList(material_id: i[value].toString(),));
    }
    return wlist;
  }
}