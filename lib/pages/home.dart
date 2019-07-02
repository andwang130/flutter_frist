import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/Search.dart';
import "package:flutter_swiper/flutter_swiper.dart";

var imgaes = [
  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=399944689,1746572361&fm=26&gp=1.jpg",
  "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4214474476,1941437198&fm=26&gp=0.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562059603979&di=7fab49656de0ad2cc916bff38883a7d6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201508%2F30%2F20150830095308_UAQEi.thumb.700_0.jpeg"
];

class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: HomeSearch(),
          backgroundColor: Color.fromRGBO(248, 248, 255, 1.0)),
      body: Column(
        children: <Widget>[
          HomeSwiper(),
          Padding(

            child: Container(
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
            padding: EdgeInsets.only(top: 15),
          ),
          Padding(
              child: Container(
                decoration:BoxDecoration(
                    border:Border(bottom:BorderSide(color:Colors.grey,width: 1) )
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
            padding: EdgeInsets.only(top: 20),
          ),
          Padding(
            child: Container(
              height: 130,
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
            padding: EdgeInsets.only(top: 10),
          )
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
          print(index);
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
