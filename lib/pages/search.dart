import "package:flutter/material.dart";

class Search extends StatefulWidget{

  State<StatefulWidget> createState()=>_Search();
}
class _Search extends State<Search> with SingleTickerProviderStateMixin{


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
        height: 200,
        child:GridView(

      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio:2,
          mainAxisSpacing:5,
          crossAxisSpacing:5,
      ) ,
          children: <Widget>[
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒ssdsadadadadas"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),
            Tagbuttion("去脂肪粒"),

        ],) ,
      )
      ],
    )  ,)

    );
  }
  Widget Tagbuttion(String key){

    return Container(

      width: 30,
      child: FlatButton(
      color: Colors.grey,
      onPressed: (){},
      child: Text(key),
    ),);
  }
}
