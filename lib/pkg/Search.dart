import 'package:flutter/material.dart';
import 'package:flutter_app/pages/search.dart';
class HomeSearch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.message,color: Colors.blue,),
        Expanded(
        child: Padding(

            padding:EdgeInsets.only(left: 15),
            child:Container(

                  height: 28,
                  child:TextField(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => new Search()));
                    },
                  decoration:InputDecoration(
                      border:InputBorder.none,
                  fillColor: Colors.white
                  ),

                  ),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey,width: 0.5),

        ),
        )
    )
    )
      ],
    );
  }
}