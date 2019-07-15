import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/register.dart';
import 'package:flutter_app/pages/search.dart';
import 'package:flutter_app/pages/searchinfo.dart';
import 'package:flutter_app/pkg/downlist.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     home:SearchInfo("去脂肪粒")
    );
  }
}

