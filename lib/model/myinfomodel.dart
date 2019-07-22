
class Myinfo{
  int id;
  String username;
  String rid;
  String sid;
  int money;
  String father;
  String taobaonick;
  Myinfo.fromJson(Map<String,dynamic> json){
    print(json);
    this.id=json["Id"];
    this.username=json["Username"];
    this.rid=json["Rid"];
    this.sid=json["Sid"];
    this.money=json["Money"];
    this.father=json["Father"];
    this.taobaonick=json["Taobaonick"];
  }
}