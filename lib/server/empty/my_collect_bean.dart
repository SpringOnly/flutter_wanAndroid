
import 'package:json_annotation/json_annotation.dart';

part 'jsonSerializable/my_collect_bean.g.dart';


@JsonSerializable()
class MyCollectBean extends Object {

  int curPage;
  List<Article> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  MyCollectBean(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory MyCollectBean.fromJson(Map<String, dynamic> srcJson) => _$MyCollectBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyCollectBeanToJson(this);

}


@JsonSerializable()
class Article extends Object {

  String author;

  int chapterId;

  String chapterName;

  int courseId;

  String desc;

  String envelopePic;

  int id;

  String link;

  String niceDate;

  String origin;

  int originId;

  int publishTime;

  String title;

  int userId;

  int visible;

  int zan;

  Article(this.author,this.chapterId,this.chapterName,this.courseId,this.desc,this.envelopePic,this.id,this.link,this.niceDate,this.origin,this.originId,this.publishTime,this.title,this.userId,this.visible,this.zan,);

  factory Article.fromJson(Map<String, dynamic> srcJson) => _$ArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}


