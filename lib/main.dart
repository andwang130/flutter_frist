import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/register.dart';
import 'package:flutter_app/pages/search.dart';
import 'package:flutter_app/pages/searchinfo.dart';
import 'package:flutter_app/pkg/downlist.dart';
import 'package:flutter_app/pages/authwebview.dart';
import 'package:flutter_app/pages/share.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    var redirect_uri="http://tkfl.carzy.wang/v1/tokenCallback";
    var url="https://oauth.taobao.com/authorize?response_type=code&client_id=25972873&state="+"15179601349"+"&view=wap&redirect_uri="+redirect_uri;
    return MaterialApp(
     home:Login()
    );
  }
}

