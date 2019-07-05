import 'package:flutter/material.dart';
var src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562322911498&di=3052621d553ba61cc43d9bb850367a9b&imgtype=0&src=http%3A%2F%2Fimages6.fanpop.com%2Fimage%2Fphotos%2F35100000%2FFluttershy-my-little-pony-friendship-is-magic-35157899-1400-1850.jpg";
var myfontType=TextStyle(fontSize: 20,color: Colors.black,fontWeight:FontWeight.w500 );
var bottomline=BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 1)));
var fontTitle=TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w100);
var edge20=EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 10);
class Myself extends StatefulWidget{
  State<StatefulWidget> createState()=>_Myself();
}
class _Myself extends State<Myself>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child:  Column(children: <Widget>[

        Container(
          height: 150,
          color: Colors.white,

          child:
          Column(
            children: <Widget>[

              Container(

              padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
              decoration:BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 1))),
              child:Row(
                children: <Widget>[
                  ClipOval(child: FadeInImage.assetNetwork(fit: BoxFit.fill,placeholder: src, image: src,width: 70,height: 70,),),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("ZHANSHENG130789",style: myfontType,),
                        Text("账号id:12351321")
                      ],),)

                ],
              ),
            ),
          Container(
             padding: edge20,
             child: Row(children: <Widget>[
               Expanded(child:Align(child: Text("我的账户状态"),alignment: Alignment.centerLeft,),),

               Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.centerRight ,) ,)


             ],),
           ) ,

            ],
          ),
        ),

        Padding(padding: EdgeInsets.only(top: 10),
        child:Container(
          color: Colors.white,
          height: 140,
          child:Column(
          children: <Widget>[


            Container(
              decoration:bottomline,
              padding: edge20,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: <Widget>[
                Expanded(child:Row(
                  children: <Widget>[
                    TitleImage("https://img.alicdn.com/imgextra/i1/720077060/O1CN01vGKiTL221WlXMd9wW_!!720077060.png"),
                    Container(width: 8,),
                    Text("订单查询",style: fontTitle,)
                  ],
                )),
                Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.bottomRight ,) ,)


              ],),) ,
            Container(
              decoration:bottomline,
              padding: edge20,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: <Widget>[
                  Expanded(child:Row(
                    children: <Widget>[
                      TitleImage("https://img.alicdn.com/imgextra/i1/720077060/O1CN01ttbCAp221WlU72Njt_!!720077060.png"),
                      Container(width: 8,),
                      Text("新手指引",style: fontTitle,)
                    ],
                  )),
                  Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.bottomRight ,) ,)


                ],),) ,
            Container(
              decoration:bottomline,
              padding: edge20,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: <Widget>[
                  Expanded(child:Row(
                    children: <Widget>[
                      TitleImage("https://img.alicdn.com/imgextra/i4/720077060/O1CN01kOOOfq221WlVTJWia_!!720077060.png"),
                      Container(width: 8,),
                      Text("分享给好友",style: fontTitle,)
                    ],
                  )),
                  Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.bottomRight ,) ,)


                ],),) ,



          ],
        ),
        ),
        ),
      Padding(padding: EdgeInsets.only(top: 20),
        child:Container(
          color: Colors.white,
          height: 94,
          child:Column(
            children: <Widget>[


              Container(
                decoration:bottomline,
                padding: edge20,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: <Widget>[
                    Expanded(child:Row(
                      children: <Widget>[
                        TitleImage("https://img.alicdn.com/imgextra/i2/720077060/O1CN01In7hdU221WlYkCviA_!!720077060.png"),
                        Container(width: 8,),
                        Text("帮助与反馈",style: fontTitle,)
                      ],
                    )),
                    Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.bottomRight ,) ,)


                  ],),) ,
              Container(
                decoration:bottomline,
                padding: edge20,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: <Widget>[
                    Expanded(child:Row(
                      children: <Widget>[
                        TitleImage("https://img.alicdn.com/imgextra/i2/720077060/O1CN01bKiTd5221WlUUNCD4_!!720077060.png"),
                        Container(width: 8,),
                        Text("关于",style: fontTitle,)
                      ],
                    )),
                    Expanded(child:Align(child:Icon(Icons.arrow_forward_ios),alignment: Alignment.bottomRight ,) ,)


                  ],),) ,




            ],
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 20),
        child:Container(
          color: Colors.white,
          height: 46,
          child:Column(
            children: <Widget>[


              Container(
                height: 46,
                decoration:bottomline,
                padding: edge20,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: <Widget>[
                    Expanded(child:Row(
                      children: <Widget>[
//                        TitleImage("https://img.alicdn.com/imgextra/i1/720077060/O1CN01vGKiTL221WlXMd9wW_!!720077060.png"),
                        Container(width: 8,),
                        Text("退出账户",style: fontTitle,)
                      ],
                    )),


                  ],),) ,




            ],
          ),
        ),
      ),

    ],
    ) ,);

  }
}
class TitleImage extends StatelessWidget{
  var image;
  TitleImage(this.image){}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FadeInImage.assetNetwork(placeholder:this.image,fit:BoxFit.fill,image:this.image,height: 35,width: 35,);
  }
}