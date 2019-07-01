import 'package:flutter/material.dart';

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Icon(Icons.add_location,color: Colors.blue,),
    Expanded(
        child:Container(
          height: 30,
          child:TextField(
          decoration:InputDecoration(
              border:InputBorder.none)
          ),
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(50),
              border: Border.all(color: Colors.grey,width: 0.5),
        ),
        )
    )
      ],
    );
  }
}