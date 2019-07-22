
class ShopModel{
  int item_id; //商品id
  int user_type;  //店铺信息-卖家类型，0表示集市，1表示商城
  int coupon_remain_count;  //优惠券信息-优惠券剩余量
  int coupon_amount;//优惠券面额
  String  coupon_start_fee;  //优惠券信息-优惠券起用门槛，满X元可用。如：满299元减20元
  String item_description;  //商品信息-宝贝描述（推荐理由,不一定有）
  int volume;   //销量
  String coupon_end_time; //优惠券结束时间
  String pict_url;  //主图
  String white_image;  //白底图
  String coupon_info;  //满减信息
  String coupon_share_url;  //链接-宝贝+券二合一页面链接
  String nick; //店铺信息-卖家昵称
  String commission_rate;  //佣金比例
  String click_url;  //推广链接
  String title;
  String reserve_price;  //价格
  double zk_final_price; //折扣价格


  ShopModel.fromJson(dynamic json,int t){

    if(json["Coupon_amount"].runtimeType==String){

      if(json["Coupon_amount"]!=""){
        this.coupon_amount=int.parse(json["Coupon_amount"]);
      }else{
        this.coupon_amount=0;
      }
    }else{
      this.coupon_amount=json["Coupon_amount"];
    }
    this.item_id=json["Item_id"];
    this.user_type=json["User_type"];
    this.coupon_remain_count=json["Coupon_remain_count"];
    this.coupon_start_fee=json["Coupon_start_fee"];

    this.item_description=json["Item_description"];
    this.volume=json["Volume"];
    this.coupon_end_time=json["Coupon_end_time"];
    this.pict_url=t>0?json["Pict_url"]:"http:"+json["Pict_url"];
    this.white_image=json["White_image"];
    this.coupon_info=json["Coupon_info"];
    this.coupon_share_url=json["Coupon_share_url"];
    this.nick=json["Nick"];
    this.commission_rate=t>0?(double.parse(json["Commission_rate"])/100).toString():json["Commission_rate"];
    this.click_url=json["Click_url"];
    this.title=json["Title"];
    this.reserve_price=json["Reserve_price"];
    this.zk_final_price=double.parse(json["Zk_final_price"]);
  }
}