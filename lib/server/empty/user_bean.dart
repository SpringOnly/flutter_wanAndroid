
import 'dart:convert';

import '../../generated/json/base/json_field.dart';
import '../../generated/json/login_bean.g.dart';

@JsonSerializable()
class UserBean {
  bool? admin;
  List<dynamic>? chapterTops;
  int? coinCount;
  List<dynamic>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  UserBean();

  UserBean.fromMap(Map map){
    admin = map["admin"];
    chapterTops = map["chapterTops"];
    collectIds = map["collectIds"];
    email = map["email"];
    icon = map["icon"];
    id = map["id"];
    nickname = map["nickname"];
    password = map["password"];
    token = map["token"];
    type = map["type"];
    username = map["username"];
  }

  factory UserBean.fromJson(Map<String, dynamic> json) =>
      $UserBeanFromJson(json);

  Map<String, dynamic> toJson() => $UserBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}