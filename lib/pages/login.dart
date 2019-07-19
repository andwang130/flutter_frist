import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/config.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pkg/mydialog.dart';
import 'package:flutter_app/pkg/mybottomShet.dart';
import 'package:flutter_app/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget{
  State<StatefulWidget> createState()=>_Login();
}
class _Login extends State<Login>{
  int userError=0;
  int pswdError=0;
  String pasd,user;
  TextEditingController userController;
  TextEditingController pswdController;
  final bottomsheetKey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.userController=TextEditingController();
    this.pswdController=TextEditingController();
    this.userController.addListener((){
      this.setState(() {
        if(this.userController.text!="") {
          this.userError = 0;
        }
        this.user=this.userController.text;
      });

    });
    this.pswdController.addListener((){
     this.setState(() {
        if(this.pswdController.text!="")
          {

            this.pswdError=0;
          }
        this.pasd=this.pswdController.text;
      });
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.userController.dispose();
    this.pswdController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: this.bottomsheetKey,
      appBar: PreferredSize(
          preferredSize:Size.fromHeight(35),
          child:AppBar(key:Key("2"),
            title: Text("登录",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.white,),),
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 150,left: 20,right: 20),
        child: Container(
          height: 100,
          child:TextField(
            controller: this.userController,
          decoration: InputDecoration(
              hintText: "输入账号",
              errorText: this.userError==0?null:"请输入账号",
              prefixIcon:Icon(Icons.supervised_user_circle),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
        ),
        )
        ),
        Padding(padding: EdgeInsets.only(top: 10,left: 20,right: 20),
            child: Container(
              height: 100,
              child:TextField(

                controller: this.pswdController,
                decoration: InputDecoration(


                  hintText: "输入密码",
                    errorText: this.pswdError==0?null:"请输入密码",
                    prefixIcon:Icon(Icons.pages),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 10,right: 20,left: 20),
          child: Container(
            height: 50,
            width: 300,
            child: FlatButton(onPressed:(){

              this.login(context);},color: Colors.green, child:Text("登录") ),
          )
        )

//        Padding(),
//        Padding(),
      ],),
    );
  }

void login(BuildContext context)async{


  if(this.user==""){
    this.userError=1;
  }
  if(this.pasd==""){
    this.pswdError=1;
  }
  this.setState ((){

  });
  if(this.userError==1||this.pswdError==1){
    return;
  }
  showDialog(context: context,barrierDismissible: false,builder:  (context){
    return MyCustomLoadingDialog();
  });
  Dio dio=Dio();
  var response =await dio.post(Host+"/v1/user/login",
      data: {"password":this.pasd,"username":this.user});

    Navigator.pop(context);
   Responseinfo responseinfo=Responseinfo.fromJson(response.data);
   switch(responseinfo.code){
     case 200:
       {

         Token token=await Token.getInstance();


         Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
         break;
       }
     case 6:
       {
         this.bottomsheetKey.currentState.showBottomSheet((BuildContext context) {
           return BottomAppBar(child: MyBottomSheet("用户名或者密码错误"));
         });
       }
       break;

   }


}
}
