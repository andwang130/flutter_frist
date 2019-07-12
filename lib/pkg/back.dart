import 'package:flutter/material.dart';

Widget Back(BuildContext context){

  return GestureDetector(child:Icon(Icons.arrow_back_ios,color: Colors.black54,),
  onTap: (){
  Navigator.pop(context);
  },
  );
}