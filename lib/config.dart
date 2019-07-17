import 'dart:convert';
const String Host="http://tkfl.carzy.wang";
class Responseinfo{
   int Code;
  int code;
   String data;
   String msg;
  Responseinfo(this.code,this.data,this.msg);

  Responseinfo.fromJson(Map<String,dynamic> json){
      print(json["Code"]);
      this.code=json["Code"];
      this.data=json["Date"];
      this.msg=json["Msg"];
  }
    Map<String, dynamic> tojson(){

    return {
      "code":this.code,
      "data":this.data,
      "msg":this.msg
        };
    }
}
