import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/Search.dart';
import "package:flutter_swiper/flutter_swiper.dart";
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
var imgaes = [
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=399944689,1746572361&fm=26&gp=1.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4214474476,1941437198&fm=26&gp=0.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562059603979&di=7fab49656de0ad2cc916bff38883a7d6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg"
];

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  TabController mcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mcontroller=TabController(length: tabs.length,vsync: this);
   mcontroller.addListener(() =>onTabchange());
  }
  onTabchange(){
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(	240,248,255, 1),
      appBar: AppBar(
          title: HomeSearch(),
          backgroundColor: Color.fromRGBO(248, 248, 255, 1.0)),
      body: ListView(
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
                  ),
                  Expanded(
                    flex: 1,
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
                  ),
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
                Container(
                width: 100,
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
                Container(
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
                ),
                Container(
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
                Container(
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

          Padding(
            padding: EdgeInsets.only(top: 1),
            child:Container(
              decoration:BoxDecoration(
                border:Border(bottom:
                BorderSide(color:Colors.white,width: 1),top:BorderSide(color:Colors.white,width: 1) )
              ),
              child: TabBar(
                labelColor:Colors.black,
                indicatorWeight: 1,
                indicatorSize:TabBarIndicatorSize.tab,
                isScrollable:true,
                tabs:tabs,
              controller: this.mcontroller,
            )
            ),
          ),

        ViewList()
        ],
      ),
    );
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
class ViewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
     Card(
       child: Column(
         children: <Widget>[
           Row(children: <Widget>[
             Expanded(

               child:Image.network("http://gd1.alicdn.com/imgextra/i1/397990402/O1CN01CdNfpA1Eq9l1Ou5oi_!!397990402.png_400x400.jpg"),
               flex: 1,),

             Expanded(
                 flex: 3,
               child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
                 Text("去脂肪粒汗管油脂粒祛除神器眼部瘤脂肪粒去除针专用膏精华液眼霜",
                   softWrap:true,
                   maxLines:3,
                   overflow:TextOverflow.ellipsis),
                 Row(children: <Widget>[
                   Expanded(flex:1,child:  Text("优惠券"),),
                   Expanded(flex:1,child:  Text("销量",textAlign: TextAlign.right,),),
                 ],),
                 Text("价格",textAlign: TextAlign.left,)

           ],
           ),
           )

           ],),
           FlatButton(
             color: Colors.blue,textColor: Colors.white,child: Text("按钮"),)
         ],
       ),
     ),
    Card(
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(

                    child:Image.network("http://gd1.alicdn.com/imgextra/i1/397990402/O1CN01CdNfpA1Eq9l1Ou5oi_!!397990402.png_400x400.jpg"),
                    flex: 1,),

                  Expanded(
                    flex: 3,
                    child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
                      Text("去脂肪粒汗管油脂粒祛除神器眼部瘤脂肪粒去除针专用膏精华液眼霜",
                          softWrap:true,
                          maxLines:3,
                          overflow:TextOverflow.ellipsis),
                      Row(children: <Widget>[
                        Expanded(flex:1,child:  Text("优惠券"),),
                        Expanded(flex:1,child:  Text("销量",textAlign: TextAlign.right,),),
                      ],),
                      Text("价格",textAlign: TextAlign.left,)

                    ],
                    ),
                  )

                ],),
                MaterialButton(color:Colors.deepOrangeAccent,child: Text("按钮"),)
              ],
            ),
          )

    ],
    ) ,
    );

  }
}