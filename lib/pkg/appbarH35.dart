import 'package:flutter/material.dart';

Widget AppbarH35( BuildContext context,String title,{Widget bottom,double size=35}){
  return PreferredSize(
    preferredSize:Size.fromHeight(size),
    child:AppBar(key:Key("2"),
      leading:GestureDetector(child:Icon(Icons.arrow_back_ios,color: Colors.black54,),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      title: Text(title,style: TextStyle(color: Colors.black),),
      bottom: bottom,
      centerTitle: true,
      backgroundColor: Colors.white,),
  );
}