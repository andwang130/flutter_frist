import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_app/pkg/mydialog.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/pkg/mybottomShet.dart';
class Register extends StatefulWidget{
  State<StatefulWidget> createState()=>_Register();
}
class _Register extends State<Register> {

  final bottomkey=GlobalKey<ScaffoldState>();
  String verifyStr="获取验证码";
  //计时器
  Timer timer;
  //计时的秒数
  int second=60;
  //phone输入框状态
  int phoneError=0;
  //pswd输入框错误状态
  int pswdError=0;
  int repswdError=0;
  int codeError=0;
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
          this.phoneError=0;
        });
      }
      this.phone=this.phoneCon.text;
    });
    this.pswdCon.addListener((){
      if(this.pswdCon.text!=""){
        this. setState(() {
          this.pswdError=0;
        });
      }
      this.pswd=this.pswdCon.text;
    });
  this.repswdCon.addListener((){
    if(this.repswdCon.text!=""){
      this.setState(() {
        this.repswdError=0;
      });
    }
    this.repswd=this.repswdCon.text;
  });
    this.codeCon.addListener((){
      if(this.codeCon.text!=""){
        this.setState(() {
          this.codeError=0;
        });

      }
      this.code=this.codeCon.text;
    });


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.pswdCon.dispose();
    this.phoneCon.dispose();
    this.repswdCon.dispose();
    this.codeCon.dispose();
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
    key: bottomkey,
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
                errorText: this.phoneError==0?null:getphonerrro(this.phoneError),
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
                    errorText: this.pswdError==0?null:this.getpswderror(this.pswdError),
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
                    errorText: this.pswdError==0?null:this.getpswderror(this.pswdError),
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
                errorText: this.codeError==0?null:this.getcoderror(this.codeError),
                suffixIcon: Container(
                    width: 150,
                    child:FlatButton(
                      color: Colors.greenAccent,
                      disabledColor:Colors.grey,
                      onPressed:this.second==60?this.getcode:null,
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
          child: FlatButton.icon(onPressed:this.Submitted, icon: Icon(Icons.add,color: Colors.black,),
              color: Colors.deepOrange,
              label: Text("注册")),
        ),)


      ],
    )


    );
  }
  void Submitted(){

    if(this.pswd!=this.repswd)
      {
        print("密码不一致");
        print(this.pswd);
        print(this.repswd);
        this.pswdError=2;
      }
    if(this.phone==""){
      this.phoneError=2;
    }
    if(this.code==""){
      this.codeError=1;
    }
    if(this.codeError!=0||this.phoneError!=0||this.pswdError!=0){
      this.setState((){});
      return;
    }
     this.register();
  }

  void register()async{
    print("register");
    Dio dio=Dio();
    Response response =await dio.post(Host+"/v1/user",data: {
      "username":this.phone,
      "password":this.pswd,
      "tlecode":this.code
    });
    Responseinfo responseinfo=Responseinfo.fromJson(response.data);
    if(responseinfo.code==200){


    }else{
      this.bottomkey.currentState.showBottomSheet((BuildContext context) {
        return BottomAppBar(child: MyBottomSheet(getservererror(responseinfo.code)));
      });
    }
  }
  void getcode()async{


    showDialog(context: context,barrierDismissible: false,builder:  (context){
      return MyCustomLoadingDialog();
    });
    Dio dio=Dio();

    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    var response=await  dio.post(Host+"/v1/user/pushcode",data:{
      "phone":this.phone
    });
    Responseinfo responseinfo=Responseinfo.fromJson(response.data);
    Navigator.pop(context);
    if(responseinfo.code==0){
    this.startTimer();
    }else{
      this.setState((){
        this.phoneError=1;
      });
    }
  }
  void startTimer(){
  
    this.timer=Timer.periodic(Duration(seconds: 1),(timer){

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
  String getphonerrro(int code){

    switch(code){
      case 1:
        return "手机号错误";
        break;
      case 2:
        return "手机号不可为空";
      case 3:
        return "手机号格式错误";
    }

  }
  String getpswderror(int code){
    switch(code){
      case 1:
        return "密码不可为空";
        break;
      case 2:
        return "两次密码不一致";
      case 3:
        return "密码号格式错误";
    }
  }
  String getcoderror(int code){
    switch(code){
      case 1:
        return "验证码不可为空";
        break;
      case 2:
        return "验证码错误";
      case 3:
        return "验证码格式错误";
    }
  }

}
