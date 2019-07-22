import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/back.dart';
import 'package:flutter_app/pkg/searchlist.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/model/shopModel.dart';
class SearchInfo extends StatefulWidget{
   String serkey;

   SearchInfo(this.serkey);
  @override
  State<StatefulWidget> createState(){
   return _SearchInfo();
  }


}
class _SearchInfo extends State<SearchInfo> with SingleTickerProviderStateMixin{
  AnimationController animController;
  Animation<double> animatable;
  bool istiamo,isbaoyou,isxb,isyk,ishp,iszh,isjp;
  String pircestart,pircend,commstart,commenn;
  String _searkey;
  String selectnam;
  bool isshow=false;

  bool isoedge=false;
  bool isscreen=false;
  bool iscoupon=false;
  String sort="";
  List<ShopModel> shoplist;
  int page=1;

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement setState
    this.shoplist=new List<ShopModel>();
    super.initState();
  ;
    this.animController = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    this._searkey=widget.serkey;
    this.selectnam="默认排序";
    this.isshow=false;
    this.isjp=false;
    this.istiamo=false;
    this.ishp=false;
    this.iszh=false;
    this.isxb=false;
    this.isyk=false;
    this.isbaoyou=false;
    this.iscoupon=false;
    this.searchdata();

  }

  getdata(){


  Map<String,String> data={
      "q":this._searkey,
      "is_tmall":this.istiamo==true?"true":"false",
      "need_prepay":this.isxb==true?"true":"false",
      "need_free_shipment":this.isbaoyou==true?"true":"false",
      "include_rfd_rate":this.isyk==true?"true":"false",
      "include_good_rate":this.ishp==true?"true":"false",
      "include_pay_rate_30":this.iszh==true?"true":"false",
      "has_coupon":this.iscoupon==true?"true":"false",
      "sort":this.sort
    };
  return data;

  }
  void initShoplist(){
    print("111");
    this.shoplist=new List<ShopModel>();
    this.page=1;
    this.searchdata();
  }
  void searchdata()async{

    Token token=await Token.getInstance();

    Dio dio=Dio();
    Response response =await dio.post(Host+"/v1/shop/search",data:this.getdata(),options:getOptions(token.getToken()));
    List<dynamic> datalist=response.data["Data"]["Map_data"];
    print(datalist[0]);
    for(int i=0;i<datalist.length;i++){

      ShopModel shopModel=ShopModel.fromJson(datalist[i],1);
      this.shoplist.add(shopModel);
    }
    this.setState((){
      this.page++;
    });

  }
  Widget chekeItme(String name,String _sort){
   return GestureDetector(
     onTap: (){
       this.selectnam=name;
       this.sort=_sort;
       this.page=1;
       this.initShoplist();
       this.showDropDownItemWidget();
     },
      child: Container(
        height: 40,
        padding: EdgeInsets.only(left: 10,right: 20),
        decoration:BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2,color: Colors.grey))
        ) ,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(name,style: TextStyle(color: this.selectnam==name?Colors.red:Colors.black),)),
            Expanded(
                child:Align(
                  alignment: Alignment.centerRight,
                  child:this.selectnam==name?Icon(Icons.check,color: Colors.red,):null,))

          ],
        ),
      ),
    );
  }
  void openedge(BuildContext context){
    Scaffold.of(context).openDrawer();
  }
  void showDropDownItemWidget(){

    this.isshow=!this.isshow;
    this.animatable = new Tween(begin: 0.0, end: 200.0).animate(this.animController)..addListener(() {
      //这行如果不写，没有动画效果
      this.setState(() {});
    });
    if(this.animatable.status==AnimationStatus.completed){
      this.animController.reverse();
    }else{
      this.animController.forward();
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key:  _scaffoldkey,
      appBar: PreferredSize(


        child: AppBar(
          automaticallyImplyLeading:false,
            titleSpacing:0,
            backgroundColor: Colors.white70,
          leading: Back(context),
        actions: <Widget>[
         SizedBox(width: 5,)
        ],
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
            child: Text(this._searkey),
          ),)
        ),


      ), preferredSize: Size.fromHeight(40)),
      body:Stack(
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(height: 8,),
            Container(
              height: 35,
              color: Colors.white30,
              padding: EdgeInsets.only(left: 10),
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Expanded(child:Align(
                    child:GestureDetector(
                      onTap: this.showDropDownItemWidget,
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          this.selectnam,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        Icon(this.isshow==true?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Colors.red,)
                      ],
                    ),
                  ) ,alignment:Alignment.centerLeft,),),

                 Align(child:Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     GestureDetector(
                       onTap: (){
                         this.initShoplist();
                         this.setState((){
                           this.iscoupon=!this.iscoupon;
                         });
                       },
                       child: Row(
                         children: <Widget>[
                           Icon(Icons.check_circle,color: this.iscoupon==true?Colors.red:Colors.grey,),
                           Text("优惠券")
                         ],
                       ),),
                   VerticalDivider(color: Colors.grey,),
                    GestureDetector(
                      onTap: (){_scaffoldkey.currentState.openEndDrawer();},
                       child: Row(

                         children: <Widget>[
                           Text("筛选",style: TextStyle(color: this.isscreen==true?Colors.redAccent:Colors.black),),
                           Icon(Icons.open_with,color: this.isscreen==true?Colors.redAccent:Colors.grey,)
                         ],
                       ),),

                   ],),
                   alignment:Alignment.centerRight
                 )




                ],
              ),),
            SizedBox(height: 8,),
            Expanded(child:    Padding(

              child: SearchList(
               getnext: this.searchdata,
                shoplist: this.shoplist,
            ) ,padding: EdgeInsets.only(top: 1),),)
        ],),


          Positioned(
            top: 35,
            width: MediaQuery.of(context).size.width,
            height: this.animatable==null?0:this.animatable.value,
            child:Container(
              color: Colors.white,

              child: ListView(
                children: <Widget>[
                  chekeItme("默认排序",""),
                  chekeItme("销量从高到低","total_sales_des"),
                  chekeItme("收入比率从高到低","tk_rate_des"),
                  chekeItme("价格从高到低","price_des"),
                  chekeItme("价格从低到高","price_asc"),
                ],
              ),
            ),
          ),


        ],
      ),
      endDrawer:Drawerbuid(isbaoyou: this.isbaoyou,
        istiamo: this.istiamo,
        ishp: this.ishp,
        isjp: this.isjp,
        isxb: this.isxb,
        isyk: this.isyk,
        iszh: this.iszh,
        pircend: this.pircend,
        pircestart: this.pircestart,
        commenn: this.commenn,
        commstart:this.commstart,
        backfun: this.callback,),


    );

  }
  void callback(bool timao,bool baoyou,bool xb,bool yk,bool
  hp,bool zh,bool jp,String pircestart,String pircend,String commstart,String coomend) {
    print(timao);
    this.istiamo=timao;
    this.isbaoyou=baoyou;
    this.isxb=xb;
    this.isyk=yk;
    this.ishp=hp;
    this.iszh=zh;
    this.isjp=jp;
    this.pircestart=pircestart;
    this.pircend=pircend;
    this.commstart=commstart;
    this.commenn=coomend;
    if(this.istiamo||this.isbaoyou||this.isxb||this.isjp||this.isyk||this.ishp||this.iszh
        ||this.pircend!=""||this.pircend!=""||this.commstart!=""||this.commenn!=""){
      this.isscreen=true;
    }else{
      this.isscreen=false;
    }
    this.initShoplist();
    this.setState((){

    });
}
}
class Drawerbuid extends StatefulWidget{

  bool istiamo,isbaoyou,isxb,isyk,ishp,iszh,isjp;
  String pircestart,pircend,commstart,commenn;
  Function(bool timao,bool baoyou,bool xb,bool yk,bool
  hp,bool zh,bool jp,String pircestart,String pircend,String commstart,String coomend) backfun;
  Drawerbuid({
    this.istiamo,
    this.isbaoyou,
    this.isxb,
    this.isyk,
    this.ishp,
    this.iszh,
    this.isjp,
    this.pircend,
    this.pircestart,
    this.commenn,
    this.commstart,
    this.backfun
  }){

}
  State<StatefulWidget> createState()=>_Drawerbuid();
}
class _Drawerbuid extends State<Drawerbuid>{

  Color checkCorlor=Colors.red;
  Color nochekCorlor=Colors.grey;
  bool istiamo,isbaoyou,isxb,isyk,ishp,iszh,isjp=false;
  String pircestart,pircend,commstart,commenn="";

  Function(bool timao,bool baoyou,bool xb,bool yk,bool
  hp,bool zh,bool jp,String pircestart,String pircend,String commstart,String coomend) backfun;

  TextEditingController startpirceController;
  TextEditingController endpirceController;
  TextEditingController commstartController;
  TextEditingController commendController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.startpirceController=TextEditingController();
    this.endpirceController=TextEditingController();
    this.commstartController=TextEditingController();
    this.commendController=TextEditingController();

    this.istiamo=widget.istiamo;
    this.isbaoyou=widget.isbaoyou;
    this.isjp=widget.isjp;
    this.isxb=widget.isxb;
    this.iszh=widget.iszh;
    this.ishp=widget.ishp;
    this.isyk=widget.isyk;
    this.commstart=widget.commstart;
    this.commstartController.text=this.commstart;
    this.commenn=widget.commenn;
    this.commendController.text=this.commenn;
    this.pircestart=widget.pircestart;
    this.startpirceController.text=this.pircestart;
    this.pircend=widget.pircend;
    this.endpirceController.text=this.pircend;
    this.backfun=widget.backfun;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.commendController.dispose();
    this.commstartController.dispose();
    this.startpirceController.dispose();
    this.endpirceController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(left: 80,top: 40,bottom: 40),child:
    Container(
      padding: EdgeInsets.only(top: 50,left: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text("宝贝来源和服务"),
          Padding(child:Row(children: <Widget>[
          buildbutton("天猫",this.istiamo==true?this.checkCorlor:this.nochekCorlor,callbak: (){
            this.setState((){
              print(this.istiamo);
              this.istiamo=!this.istiamo;
            });
          }),
            SizedBox(width: 5,),
            buildbutton("包邮",this.isbaoyou==true?this.checkCorlor:this.nochekCorlor,
              callbak: (){
                this.setState((){
                  this.isbaoyou=!this.isbaoyou;
                });
              }
            ),
            SizedBox(width: 5,),
            buildbutton("消费者保障",this.isxb==true?this.checkCorlor:this.nochekCorlor,
            callbak: (){
              this.setState((){
                this.isxb=!this.isxb;
              });
            }),

          ]
            ,),
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(child:Row(children: <Widget>[
            buildbutton("退款率低",this.isyk==true?this.checkCorlor:this.nochekCorlor,
                callbak: (){
                  this.setState((){
                    this.isyk=!this.isyk;
                  });
                }),
            SizedBox(width: 5,),
            buildbutton("好评率高",this.ishp==true?this.checkCorlor:this.nochekCorlor,
                callbak: (){
                  this.setState((){
                    this.ishp=!this.ishp;
                  });
                }),
            SizedBox(width: 5,),
            buildbutton("转换率高",this.iszh==true?this.checkCorlor:this.nochekCorlor,
                callbak: (){
                  this.setState((){
                    this.iszh=!this.iszh;
                  });
                }),

          ]
            ,),
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(child:Row(children: <Widget>[
            buildbutton("淘宝金牌商家",this.isjp==true?this.checkCorlor:this.nochekCorlor,
                callbak: (){
                  this.setState((){
                    this.isjp=!this.isjp;
                  });
                }),


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

                    controller:this.commstartController ,
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
                    controller:this.commendController ,
                  ),),
              ],
            ),),
          Padding(padding: EdgeInsets.only(top: 100),child:
          Row(children: <Widget>[
            Container(
          width: 150,
          height: 45,
          color: Colors.white70,
          child:FlatButton(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(35),
                  topLeft: Radius.circular(35))
            ),
            onPressed: this.reset,
              
              child: Text("重置"),
            
            ),
            ),

            Container(
                width: 150,
                height: 45,

                child: FlatButton(
                  color: Colors.deepOrangeAccent,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        topRight: Radius.circular(35))
                  ),
                    onPressed:this.submission,
                child: Text("确定") ,))

          ],)
          )
        ],
      ),
    ),

    );
  }
  Widget buildbutton(String name,Color color,{VoidCallback callbak}){
    return  GestureDetector(
      onTap: callbak,
      child: Container(
      alignment: Alignment.center,
      width: 100,
      height: 30,
      color: color,
      child: Text(name),
    ),);
  }
  void submission(){


    this.backfun(this.istiamo,this.isbaoyou,this.isxb,this.
    isyk,this.ishp,this.iszh,this.isjp,this.startpirceController.text,
        this.endpirceController.text,this.commstartController.text,this.commendController.text);
    Navigator.of(context).pop();
  }
  void reset(){
    this.istiamo=false;
    this.isbaoyou=false;
    this.isjp=false;
    this.isxb=false;
    this.iszh=false;
    this.ishp=false;
    this.isyk=false;
    this.commstart="";
    this.commenn="";
    this.pircestart="";
    this.pircend="";
    this.startpirceController.text="";
    this.endpirceController.text="";
    this.commstartController.text="";
    this.commendController.text="";
    this.setState((){});
  }
}
