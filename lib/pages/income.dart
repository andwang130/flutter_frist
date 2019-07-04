import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  State<StatefulWidget> createState() => _Income();
}

class _Income extends State<Income> {
  var index=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          color: Colors.amberAccent,
          padding: EdgeInsets.only(right: 25, left: 25, top: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "可提现金额",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "13.38",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 33,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                            side: BorderSide(width: 2, color: Colors.white)),
                        onPressed: () {},
                        child: Text(
                          "提现",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "上月预估收入(元)",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Text("0.00")
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.grey, width: 1))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "本月预估收入(元)",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Text("0.00")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 20),
            color: Colors.black12,
            child: Row(children: <Widget>[
              Icon(
                Icons.assistant_photo,
                color: Colors.redAccent,
              ),
              Text("每月20号结算上个月预告收入，建议21号再进行提现")
            ])),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Colors.grey))),
                  child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(flex: 1,
                      child:Align(
                        child: Icon(Icons.assignment,color: Colors.deepOrange,),
                        alignment:Alignment.centerLeft
                        ,)

                      ,),
                    Expanded(flex:4,
                      child:Align(
                          child:Text("全部订单明细",style: TextStyle(fontSize: 15),),
                          alignment:Alignment.centerLeft
                      )


                      ,),
                    Expanded(flex:8,
                        child:Align(
                          child:Icon(Icons.arrow_forward_ios),
                          alignment:Alignment.centerRight,
                        ))
                  ],
                ),

                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Tabbr(this.index,this.tabonclick),
                )


              ],
            ),
          ),
        )
      ],
    );
  }
  void tabonclick(int index){
    setState(() {
      this.index=index;
    });
  }
}
class Tabbr extends StatelessWidget{

  int index;//选中的按钮下标
  void Function(int index) oncike;//点击的回调函数
  Tabbr(this.index,this.oncike){

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: <Widget>[
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(70),
                  bottomLeft: Radius.circular(70),

                ),
                side:BorderSide(width: 1,color: Colors.deepOrange)
            ),
            color: this.index==1?Colors.deepOrange:null,
            child: Text("今日"),
            onPressed: (){
              this.oncike(1);
            },
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                side:BorderSide(width: 1,color: Colors.deepOrange)
            ),
            color: this.index==2?Colors.deepOrange:null,
            child: Text("今日"),
              onPressed: (){
                this.oncike(2);
              }
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                  side:BorderSide(width: 1,color: Colors.deepOrange)
              ),
            color: this.index==3?Colors.deepOrange:null,
            child: Text("今日"),
              onPressed: (){
                this.oncike(3);
              }
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                  side:BorderSide(width: 1,color: Colors.deepOrange)

              ),
            color: this.index==4?Colors.deepOrange:null,
            child: Text("今日"),
              onPressed: (){
                this.oncike(4);
              }

          ),
        ],
      ),
    );
  }
}
