import 'dart:convert';
const String Host="http://tkfl.carzy.wang";
class Responseinfo{
   int Code;
  int code;
   String data;
   String msg;
  Responseinfo(this.code,this.data,this.msg);

  Responseinfo.fromJson(Map<String,dynamic> json){

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
String getservererror(int code){

  switch(code){
    case 35:
      {
        return "账号已经存在";
      }
    case 36:
      {
        return "验证码错误";
      }



  }
  return "参数错误";
}
