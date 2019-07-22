import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:flutter_app/pages/searchinfo.dart';
class Search extends StatefulWidget{

  State<StatefulWidget> createState()=>_Search();
}
class _Search extends State<Search> with SingleTickerProviderStateMixin{

  String searchKey;
  TextEditingController textcontroller;
  List<String> historys;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.textcontroller=TextEditingController();
    this.getHistory();

  }
  getHistory()async{
    Dio dio=Dio();
    Token token=await Token.getInstance();
   Response response  =await dio.get(Host+"/v1/shop/history",options: getOptions(token.getToken()));
   historys=response.data["Data"];

    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.textcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(	240,248,255, 1),
      appBar: PreferredSize(child: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.grey,),),
        titleSpacing:0,
        backgroundColor: Colors.white70,

        actions: <Widget>[

          GestureDetector(child:
            Container(
              alignment: Alignment.center,
              child: Text("取消",textAlign:TextAlign.left,style: TextStyle(color: Colors.grey,fontSize: 20),),
            ),)

        ],
        title: Card(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: <Widget>[
//              SizedBox(width: 5,),
              Icon(Icons.search,color: Colors.grey,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child:TextField(
                    onChanged: (String val){
                      this.searchKey=val;
                    },
                      onEditingComplete:(){

                        Navigator.push(context,MaterialPageRoute(builder: (context) => SearchInfo(this.searchKey)));
                      },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0.8),
                      hintText: "搜索",
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),

            ],
          ),
      ),

        ),
       preferredSize: Size.fromHeight(40)
    ),
    body: Container(
      color: Colors.white,
      height: 300,
      child:  Column(
      children: <Widget>[
      Row(children: <Widget>[
        Expanded(child:Padding(
      padding: EdgeInsets.only(top: 10,left: 20),
      child: Text("搜索历史",style: TextStyle(color: Colors.red,fontSize: 20),),
    ),),
        Expanded(child: Padding(
          padding: EdgeInsets.only(top: 10,right: 20),
          child: Text("删除",textAlign: TextAlign.right,style: TextStyle(color: Colors.red,fontSize: 20),),
        ),)

      ],),
      Container(
        padding: EdgeInsets.only(top: 10,left: 5,right: 5),
        child:Wrap(
            spacing:8,
            runSpacing:1,
          children: this.historys!=null?this.historys.map((String val){

            return  Tagbuttion(val);
          }
          ).toList():[]
        ) ,
      )
      ],
    )  ,)

    );
  }
  Widget Tagbuttion(String key){

    return  Chip(label:Text("去脂肪粒神器"));
  }
}
