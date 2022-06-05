import 'package:json_annotation/json_annotation.dart';

part 'jsonSerializable/category_detail_bean.g.dart';


@JsonSerializable()
class CategoryDetailBean extends Object {

  int curPage;

  List<CategoryDetail> datas;

  int offset;

  bool over;

  int pageCount;

  int size;

  int total;

  CategoryDetailBean(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory CategoryDetailBean.fromJson(Map<String, dynamic> srcJson) => _$CategoryDetailBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryDetailBeanToJson(this);

}


@JsonSerializable()
class CategoryDetail extends Object {

  String apkLink;

  int audit;

  String author;

  bool canEdit;

  int chapterId;

  String chapterName;

  bool collect;

  int courseId;

  String desc;

  String descMd;

  String envelopePic;

  bool fresh;

  String host;

  int id;

  String link;

  String niceDate;

  String niceShareDate;

  String origin;

  String prefix;

  String projectLink;

  int publishTime;

  int realSuperChapterId;

  int selfVisible;

  String shareUser;

  int superChapterId;

  String superChapterName;

  List<dynamic> tags;

  String title;

  int type;

  int userId;

  int visible;

  int zan;

  CategoryDetail(this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.host,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.realSuperChapterId,this.selfVisible,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory CategoryDetail.fromJson(Map<String, dynamic> srcJson) => _$CategoryDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);

}