import 'package:flutter/material.dart';
import 'pkg/Search.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     home:Scaffold(
      appBar: AppBar(
        title: Search(),
       backgroundColor: Colors.white,

      ),
      body: Center(
        child: Text("This is new route"),
      ),
    )
    );
  }
}

