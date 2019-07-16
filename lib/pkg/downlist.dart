import 'package:flutter/material.dart';
import 'package:flutter_app/pkg/viewlist.dart';
class DownList extends StatefulWidget {
  State<StatefulWidget> createState() => _DownList();
}

class _DownList extends State<DownList> with SingleTickerProviderStateMixin {
  bool ishow=false;
  AnimationController _controller;
  Animation<double> _animation;
  GlobalKey _keyFilter = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

  }
  _showDropDownItemWidget(){
     this.ishow=!this.ishow;
   this._animation = new Tween(begin: 0.0, end: 500.0).animate(this._controller)..addListener(() {
      //这行如果不写，没有动画效果
     this.setState(() {});
    });
     if (_animation.status == AnimationStatus.completed) {
       this._controller.reverse();
     } else {
       this._controller.forward();
     }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return  Stack(children: <Widget>[
      Column(
        children: <Widget>[
        GestureDetector(
            onTap: (){
             this._showDropDownItemWidget();

            },
            child: Padding(
              child: Text("排序"),
              padding: EdgeInsets.only(top: 60),
            ),
          ),
//         ViewList(),

        ],

      ),
      Positioned(

        width: MediaQuery.of(context).size.width,
        top: 100,
        height: this._animation==null?0:this._animation.value,
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text("1"),
                    Text("1"),
                    Text("1"),
                    Text("1"),
                    Text("1"),
                  ],
                ))
          ],
        ),
      ),


    ]);

  }
}
