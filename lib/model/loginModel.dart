import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';


class Token{
  SharedPreferences perfe;
  String value="";
  static Token _token;

  Token._(){

  }

  String  getToken(){
    return this.value;
  }


  SetToken(String value)async{

    this.value=value;
    perfe=await SharedPreferences.getInstance();
     perfe.setString("token", value);

  }

  static Future<Token> getInstance()async{

    if(_token!=null){
      return _token;
    }
    _token=Token._();
    _token.perfe=await SharedPreferences.getInstance();
    _token.value=_token.perfe.getString("token");
    return _token;
  }
}
Options getOptions(String token){

  return Options(headers:{
    "token":token
  });
}