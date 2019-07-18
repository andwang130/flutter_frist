import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class AuthWebview extends StatefulWidget{
  String url;
  AuthWebview(this.url);
  @override
  State<StatefulWidget> createState(){
    return _AuthWebview();
  }

}
class _AuthWebview extends State<AuthWebview>{
  String url;
  String title="1";
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  bool loading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.url=widget.url;
    flutterWebviewPlugin.onUrlChanged.listen((String url){

      this.title=url;
      this.setState((){});
    });
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state){
      switch (state.type) {
        case WebViewState.shouldStart:
        // 准备加载
          setState(() {
            this.loading = true;
          });
          break;
        case WebViewState.startLoad:
        // 开始加载
          break;
        case WebViewState.finishLoad:
        // 加载完成

          setState(() {
            this.loading = false;
          });
          parseResult();
          break;
        case WebViewState.abortLoad:
          break;

      }

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.dispose();

  }


  parseResult(){

//
//    flutterWebviewPlugin.evalJavascript("document.getElementsByTagName('html')[0].innerHTML").then((result) {
//      print("++++++++++++++++++++++");
//      print(result);
//
//    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      title,
      style: new TextStyle(color: Colors.white),
    ));
    if (loading) {
      // 如果还在加载中，就在标题栏上显示一个圆形进度条
      titleContent.add(new CupertinoActivityIndicator());
    }
    titleContent.add(new Container(width: 50.0));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return WebviewScaffold(
      withJavascript:true,
      url: this.url,
      appBar:AppBar(
        title: Text(this.title),
      ) ,

    );
  }
}