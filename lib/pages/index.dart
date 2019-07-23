import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:flutter_app/pkg/viewlist.dart';
import 'package:flutter_app/pages/shoplist.dart';
var tabs = [
{ "title": '综合',"value":'3756' },
{ "title": '女装',"value":'3767'},
{ "title": '家居家装' ,"value":'3758'},
{ "title": '数码家电',"value":'3759' },
{ "title": '母婴' ,"value":'3760'},
{ "title": '食品' ,"value":'3761'},
{ "title": '箱包配饰', "value":'3762'},
{ "title": '美妆个护' ,"value":'3763'},
{ "title": '男装', "value":'3764'},
{ "title": '内衣',"value":'3765' },
{ "title": '运动户外',"value":'3766'},
];



var imgaes = [
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=399944689,1746572361&fm=26&gp=1.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4214474476,1941437198&fm=26&gp=0.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562059603979&di=7fab49656de0ad2cc916bff38883a7d6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg"
];
class Index extends StatefulWidget {
  State<StatefulWidget> createState() => _Index();
}
class _Index extends State<Index> with SingleTickerProviderStateMixin{
  TabController mcontroller;
  ScrollController scrollController;
  TabController tabcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mcontroller=TabController(length: tabs.length,vsync: this);
    tabcontroller=mcontroller;
    mcontroller.addListener(() =>onTabchange());
  }
  onTabchange(){
  }
  List<Widget> loadTabview(){
   var  wlist= List<Widget>();
    for (var i in tabs){
      wlist.add(ViewList(material_id: i["value"],));
    }
    return wlist;
  }
  List<Widget> loadtab(){
    var  wlist= List<Widget>();
    for (var i in tabs){


      wlist.add(Tab(text: i["title"],));
    }
    return wlist;
  }
  Widget stickytabr(){
    return NestedScrollView(

      controller:this.scrollController,
      headerSliverBuilder: (BuildContext contenx, bool innerBoxIsScrolled){
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            expandedHeight: 560,
            backgroundColor: Color.fromRGBO(	240,248,255, 1),
            flexibleSpace:FlexibleSpaceBar(background:_flexibleSpace(), collapseMode: CollapseMode.pin,) ,
            bottom:TabBar(
              labelColor:Colors.black,
              indicatorWeight: 1,
              indicatorSize:TabBarIndicatorSize.tab,
              isScrollable:true,
              tabs:loadtab(),
              controller: this.mcontroller,
            ) ,
          )];
      },
    body:TabBarView(controller: this.tabcontroller,children:this.loadTabview(),)
    ,);
  }
Widget _flexibleSpace(){
  return  Column(
    children: <Widget>[
      HomeSwiper(),
      Padding(

        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10),
          height: 80,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                            "https://img.alicdn.com/imgextra/i4/720077060/O1CN013COnrY221WlVTHNiN_!!720077060.png")),
                    Text("转换链接")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                            "https://img.alicdn.com/imgextra/i1/720077060/O1CN01ttbCAp221WlU72Njt_!!720077060.png")),
                    Text("新手上路")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                            "https://img.alicdn.com/imgextra/i3/720077060/O1CN01yc1ss6221WlW4pnMv_!!720077060.png")),
                    Text("活动")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                            "https://img.alicdn.com/imgextra/i3/720077060/O1CN01GTgm9d221WlU71ymo_!!720077060.png")),
                    Text("收藏")
                  ],
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 0.5),
      ),

      Padding(
        child: Container(

          decoration:BoxDecoration(
            border:Border(bottom:BorderSide(color:Colors.grey,width: 1) ),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
               child: Container(
                 decoration: BoxDecoration(
                     border:Border(right:BorderSide(color:Colors.grey,width: 1) )
                 ),
                 child:Row(children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Column(
                       children: <Widget>[
                         Text(
                           "热卖",
                           style: TextStyle(
                               fontSize: 35, fontWeight: FontWeight.w700),
                         ),
                         Text(
                           "精选好货",
                           style: TextStyle(
                               fontSize: 16, fontWeight: FontWeight.w100),
                         )
                       ],
                     ),
                   ),
                   Expanded(
                     flex: 1,
                     child: Image.network(
                         "https://img.alicdn.com/imgextra/i3/720077060/O1CN01WQ8rV1221WlVpWrQ1_!!720077060.jpg"),
                   )
                 ]),
               ),
                onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("haohuo")));
             },),),
            Expanded(
              flex: 1,
              child: GestureDetector(
               child: Container(child:Row(children: <Widget>[
                 Expanded(
                   flex: 1,
                   child: Column(
                     children: <Widget>[
                       Text(
                         "热卖",
                         style: TextStyle(
                             fontSize: 35, fontWeight: FontWeight.w700),
                       ),
                       Text(
                         "精选好货",
                         style: TextStyle(
                             fontSize: 16, fontWeight: FontWeight.w100),
                       )
                     ],
                   ),
                 ),
                 Expanded(
                   flex: 1,
                   child: Image.network(
                       "https://img.alicdn.com/imgextra/i3/720077060/O1CN01WQ8rV1221WlVpWrQ1_!!720077060.jpg"),
                 )
               ]),
               ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("tehui")));
                },
             ),
  )

            ],
          ),
          height: 100,
        ),
        padding: EdgeInsets.only(top: 10),
      ),

      Padding(
        child: Container(

          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color:Colors.grey,width: 1 )),
              color: Colors.white
          ),
          height: 100,
          child: Row(children: <Widget>[
            GestureDetector(child:
            Container(
              width: 105,
              decoration:BoxDecoration(
                  border:Border(right:BorderSide(color:Colors.grey,width: 1))
              ),
              child: Column(
                children: <Widget>[
                  Text("品牌榜"),
                  Expanded(
                      child:Image.network("https://img.alicdn.com/imgextra/i1/720077060/O1CN01e71NJU221WlWAIR2S_!!720077060.jpg")
                  )

                ],
              ),
            ),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("pinpai")));
            },),
            GestureDetector(child:Container(
              width: 100,
              decoration:BoxDecoration(
                  border:Border(right:BorderSide(color:Colors.grey,width: 1))
              ),
              child: Column(
                children: <Widget>[
                  Text("母婴榜"),
                  Expanded(
                      child:Image.network("https://img.alicdn.com/imgextra/i4/720077060/O1CN01EJeRHO221WlXIucNv_!!720077060.jpg",)
                  )

                ],
              ),
            ) ,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("muying")));
                }),
            GestureDetector(child:    Container(
              width: 100,
              decoration:BoxDecoration(
                  border:Border(right:BorderSide(color:Colors.grey,width: 1))
              ),
              child: Column(
                children: <Widget>[
                  Text("高佣榜"),
                  Expanded(
                      child:Image.network("https://img.alicdn.com/imgextra/i3/720077060/O1CN01oY0cy3221WlU5di1N_!!720077060.jpg")
                  )

                ],
              ),
            ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("gaoyong")));
                }),
            GestureDetector(child:   Container(
              width: 100,
              child: Column(
                children: <Widget>[
                  Text("大额券"),
                  Expanded(
                      child:Image.network("https://img.alicdn.com/imgextra/i4/720077060/O1CN015F0h4G221WlYy7Xsi_!!720077060.jpg")
                  )

                ],
              ),
            ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => new ShopList("dare")));
                }),


          ],),
        ),
        padding: EdgeInsets.only(top: 0.5),
      ),

      Padding(child: Text(" ~~好券直播~~",textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.deepOrange,
        ),),
        padding: EdgeInsets.only(top: 5),),

    ],
  );
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return stickytabr();

  }
}
class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {

          return new Image.network(
            imgaes[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        viewportFraction: 1,
        scale: 1,
        duration: 300,
        loop: true,
        autoplay: true,
        pagination: SwiperPagination(),
      ),
    );
  }
}




