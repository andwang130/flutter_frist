import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/Search.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:flutter_app/pages/tools.dart';
import 'package:flutter_app/pages/income.dart';
import 'package:flutter_app/pages/myself.dart';
var bodytab=[
Index(),
  Tools(),
  Income(),
  Myself(),
];
var appbars=[
  PreferredSize(preferredSize:Size.fromHeight(35), child:AppBar( automaticallyImplyLeading:false,key:Key("1"),title: HomeSearch(),backgroundColor: Color.fromRGBO(248, 248, 255, 1.0))),
  PreferredSize(preferredSize:Size.fromHeight(35),child:AppBar(key:Key("2"),title: Text("链接转换",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),),
PreferredSize(preferredSize:Size.fromHeight(35),child:AppBar(key:Key("3"),title: Text("链接转换",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),),
PreferredSize(preferredSize:Size.fromHeight(35),child:AppBar(key:Key("4"),title: Text("链接转换",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),),
];
class Home extends StatefulWidget {
  State<StatefulWidget> createState() => _Home(0);
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {


  int tabindex=0;
  _Home(this.tabindex){
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(	240,248,255, 1),
      appBar:appbars[this.tabindex],
      body:bodytab[this.tabindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),title: Text("主页")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.desktop_mac),title: Text("工具")
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.attach_money),title: Text("收益")
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.people),title: Text("我的")
        ),
      ],
      currentIndex: this.tabindex,
      onTap: (index){
        setState(() {
          this.tabindex=index;
        });
      },
      ),



    );
  }
}

