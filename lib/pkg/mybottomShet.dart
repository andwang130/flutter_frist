import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget{
  String text;
  MyBottomSheet(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:Container(
        decoration: BoxDecoration(
            color: Colors.blue[300],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10)
          )
        ),
      alignment: Alignment.center,
      height: 80,
      width: double.infinity,

      child: Text(this.text,style: TextStyle(color:Colors.red),),
    ),);

  }
}