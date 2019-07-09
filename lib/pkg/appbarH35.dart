import 'package:flutter/material.dart';

Widget AppbarH35( BuildContext context,String title){
  return PreferredSize(
    preferredSize:Size.fromHeight(35),
    child:AppBar(key:Key("2"),
      leading:GestureDetector(child:Icon(Icons.arrow_back_ios,color: Colors.black54,),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      title: Text(title,style: TextStyle(color: Colors.black),),
      centerTitle: true,
      backgroundColor: Colors.white,),
  );
}