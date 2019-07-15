import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/back.dart';
class SearchInfo extends StatefulWidget{
   String serkey;

   SearchInfo(this.serkey){

   }
  @override
  State<StatefulWidget> createState(){
   return _SearchInfo();
  }


}
class _SearchInfo extends State<SearchInfo>{

  String _searkey;
  String selectnam="销量";
  bool isshow=false;
  bool isCoupon=false;
  bool isoedge=false;
  TextEditingController startpirceController;
  TextEditingController endpirceController;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    this._searkey=widget.serkey;
    this.selectnam="销量";
    this.isshow=false;
    this.startpirceController=TextEditingController();
    this.endpirceController=TextEditingController();
  }

  void openedge(BuildContext context){
    Scaffold.of(context).openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key:  _scaffoldkey,
      appBar: PreferredSize(


        child: AppBar(
            titleSpacing:0,
            backgroundColor: Colors.white70,
          leading: Back(context),
        title: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          ),
          child:GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:Container(
            alignment: Alignment.centerLeft,
            child: Text("去脂肪粒神器"),
          ),)
        ),


      ), preferredSize: Size.fromHeight(40)),
      body:Stack(
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(height: 8,),
            Container(
              height: 25,
              padding: EdgeInsets.only(right: 10),
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Expanded(child:   Padding(child:GestureDetector(
                    child:Row(
                      children: <Widget>[
                        Text(
                          "销量",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        Icon(this.isshow==true?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.red,)
                      ],
                    ),
                  ) ,padding: EdgeInsets.only(left: 20),),),

                 Align(child:Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     GestureDetector(
                       onTap: (){
                         this.setState((){
                           this.isCoupon=!this.isCoupon;
                         });
                       },
                       child: Row(
                         children: <Widget>[
                           Icon(Icons.check_circle,color: this.isCoupon==true?Colors.red:Colors.grey,),
                           Text("优惠券")
                         ],
                       ),),
                   VerticalDivider(color: Colors.grey,),
                    GestureDetector(
                      onTap: (){_scaffoldkey.currentState.openEndDrawer();},
                       child: Row(

                         children: <Widget>[
                           Text("筛选",style: TextStyle(color: Colors.redAccent),),
                           Icon(Icons.open_with,color: Colors.redAccent,)
                         ],
                       ),),

                   ],),
                   alignment:Alignment.centerRight
                 )




                ],
              ),),
      SizedBox(height: 8,),
        ],)

        ],
      ),
      endDrawer: Padding(padding: EdgeInsets.only(left: 80,top: 40,bottom: 40),child:
        Container(
          padding: EdgeInsets.only(top: 50,left: 10),
        color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("宝贝来源和服务"),

              Padding(child:Row(children: <Widget>[
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("天猫"),
                ),),
                SizedBox(width: 5,),
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("包邮"),
                ),),
                SizedBox(width: 5,),
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("消费者保障"),
                ),)

                  ]
                ,),
              padding: EdgeInsets.only(top: 10),
              ),
              Padding(child:Row(children: <Widget>[
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("退款率低"),
                ),),
                SizedBox(width: 5,),
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("好评率高"),
                ),),
                SizedBox(width: 5,),
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("转化率高"),
                ),)

              ]
                ,),
                padding: EdgeInsets.only(top: 10),
              ),
              Padding(child:Row(children: <Widget>[
                GestureDetector(child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.grey,
                  child: Text("淘宝金牌买家"),
                ),),


              ]
                ,),
                padding: EdgeInsets.only(top: 10,bottom: 20),
              ),
              Text("价格区间(元)"),
              Padding(padding: EdgeInsets.only(top: 20,bottom: 20),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Container(
                  width: 100,
                  height: 35,
                  color: Colors.grey,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  controller:this.startpirceController ,
                ),),

                    Text(" - ",textAlign: TextAlign.center,),
                    Container(
                      width: 100,
                      height: 35,
                      color: Colors.grey,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      controller:this.endpirceController ,
                    ),),
                  ],
                ),),
            Text("收入比例区间"),
            Padding(padding: EdgeInsets.only(top: 20,bottom: 20),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 35,
                color: Colors.grey,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller:this.startpirceController ,
                ),),

              Text(" - ",textAlign: TextAlign.center,),
              Container(
                width: 100,
                height: 35,
                color: Colors.grey,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller:this.endpirceController ,
                ),),
            ],
          ),)

            ],
          ),
        ),

      )
//      Drawer(
//      child:Container(
//        height: 200,
//        width: 200,
//        color: Colors.redAccent,
//      ),
//      ),
    );

  }
}