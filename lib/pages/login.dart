import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/appbarH35.dart';
class Login extends StatefulWidget{
  State<StatefulWidget> createState()=>_Login();
}
class _Login extends State<Login>{

  int userError=0;
  int pswdError=0;
  String pasd,user;
  TextEditingController userController;
  TextEditingController pswdController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.userController=TextEditingController();
    this.pswdController=TextEditingController();
    this.userController.addListener((){
      this.setState(() {
        this.userError=0;
        this.user=this.userController.text;
      });

    });
    this.pswdController.addListener((){
     this.setState(() {
        this.pswdError=0;
        this.pasd=this.pswdController.text;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppbarH35(context, "登录"),
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
            child: FlatButton(onPressed: (){
              setState(() {

                if(this.user==""){
                  this.userError=1;
                }
                if(this.pasd==""){
                  this.pswdError=1;
                }
              });

            },color: Colors.green, child:Text("登录") ),
          )
        )

//        Padding(),
//        Padding(),
      ],),
    );
  }
}
