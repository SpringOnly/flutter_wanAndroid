import 'dart:convert';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/my_collect_bean.g.dart';

@JsonSerializable()
class MyCollectBean {

	List<Article>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
  
  MyCollectBean();

  factory MyCollectBean.fromJson(Map<String, dynamic> json) => $MyCollectBeanFromJson(json);

  Map<String, dynamic> toJson() => $MyCollectBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Article {

	String? author;
	int? chapterId;
	String? chapterName;
	int? courseId;
	String? desc;
	String? envelopePic;
	int? id;
	String? link;
	String? niceDate;
	String? origin;
	int? originId;
	int? publishTime;
	String? title;
	int? userId;
	int? visible;
	int? zan;
  
  Article();

  factory Article.fromJson(Map<String, dynamic> json) => $MyCollectDatasFromJson(json);

  Map<String, dynamic> toJson() => $MyCollectDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}