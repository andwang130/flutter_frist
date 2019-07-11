import 'package:flutter/material.dart';
import 'dart:async';
class Register extends StatefulWidget{
  State<StatefulWidget> createState()=>_Register();
}
class _Register extends State<Register> {
  String verifyStr="获取验证码";
  //计时器
  Timer timer;
  //计时的秒数
  int second=60;
  //phone输入框状态
  bool phoneError=false;
  //pswd输入框错误状态
  bool pswdError=false;
  bool repswdError=false;
  bool codeError=false;
  String phone;
  String pswd;
  String repswd;
  String code;
  TextEditingController phoneCon;
  TextEditingController pswdCon;
  TextEditingController repswdCon;
  TextEditingController codeCon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.phoneCon=TextEditingController();
    this.pswdCon=TextEditingController();
    this.repswdCon=TextEditingController();
    this.codeCon=TextEditingController();

    this.phoneCon.addListener((){
      if(this.phoneCon.text!=""){
        this. setState(() {
          this.phoneError=false;
        });
      }
      this.phone=this.phoneCon.text;
    });
    this.pswdCon.addListener((){
      if(this.pswdCon.text!=""){
        this. setState(() {
          this.pswdError=false;
        });
      }
    });
  this.repswdCon.addListener((){
    if(this.repswdCon.text!=""){
      this.setState(() {
        this.repswdError=false;
      });
    }
    this.repswd=this.repswdCon.text;
  });
    this.codeCon.addListener((){
      if(this.codeCon.text!=""){
        this.setState(() {
          this.codeError=false;
        });

      }
      this.code=this.codeCon.text;
    });


  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      appBar:  PreferredSize(
        preferredSize:Size.fromHeight(35),
        child:AppBar(key:Key("2"),
          title: Text("注册",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,),),
      body: Column(children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 55,left: 30,right: 20),
            child: Container(
              child: TextField(
                controller:this.phoneCon ,
                decoration:InputDecoration(
                labelText: "请输入手机号",
                prefixIcon: Icon(Icons.phone_android),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            ),
            )
            ),
        Padding(padding: EdgeInsets.only(top: 25,left: 30,right: 20),
            child: Container(
              child: TextField(
              controller:this.pswdCon,
                decoration:InputDecoration(
                  labelText: "请输入密码",
                  prefixIcon: Icon(Icons.insert_chart),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              ),
            )
        ),
        Padding(padding: EdgeInsets.only(top: 25,left: 30,right: 20),
            child: Container(
              child: TextField(
                controller: this.repswdCon,
                decoration:InputDecoration(
                  labelText: "重复输入密码",
                  prefixIcon: Icon(Icons.phone_android),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              ),
            )
        ),

        Padding(
            padding: EdgeInsets.only(top: 25,left: 30,right: 20),
          child: Container(
            child: TextField(
              controller: this.codeCon,
              decoration: InputDecoration(
                suffixIcon: Container(
                    width: 150,
                    child:FlatButton(
                      color: Colors.greenAccent,
                      disabledColor:Colors.grey,
                      onPressed:this.second==60?getcode:null,
                      child: Text(this.verifyStr),shape:
                    RoundedRectangleBorder(
                  borderRadius:BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25)
                      ,bottomEnd: Radius.circular(25)),
                ),)),
                labelText: "验证码",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            ),
          ),
        ),
        
        Padding(padding: EdgeInsets.only(top: 30,left: 30,right: 20),
        child: Container(
          height: 50,
          width: 300,
          child: FlatButton.icon(onPressed:this.getcode, icon: Icon(Icons.add,color: Colors.black,),
              color: Colors.deepOrange,
              label: Text("注册")),
        ),)






      ],
    )


    );
  }
  void getcode(){
    print("getcode");
    this.startTimer();
  }
  void startTimer(){
  
    this.timer=Timer.periodic(Duration(seconds: 1),(timer){
      print("1");
      if(this.second==0){
        this.second=60;
        this.cancelTimer();
        this.verifyStr="重新获取";
      }else{
        this.second--;
        this.verifyStr="已发送${this.second}s";

      }
      setState(() {
      });

    });
    
  }
  void cancelTimer(){
    this.timer.cancel();
  }
}