import 'package:json_annotation/json_annotation.dart';

part 'jsonSerializable/project_tab_data_bean.g.dart';


@JsonSerializable()
class ProjectTabDataBean extends Object {

  int curPage;

  List<ProjectTabData> datas;

  int offset;

  bool over;

  int pageCount;

  int size;

  int total;

  ProjectTabDataBean(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory ProjectTabDataBean.fromJson(Map<String, dynamic> srcJson) => _$ProjectTabDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTabDataBeanToJson(this);

}


@JsonSerializable()
class ProjectTabData extends Object {

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

  int shareDate;

  String shareUser;

  int superChapterId;

  String superChapterName;

  List<Tags> tags;

  String title;

  int type;

  int userId;

  int visible;

  int zan;

  ProjectTabData(this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.host,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.realSuperChapterId,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory ProjectTabData.fromJson(Map<String, dynamic> srcJson) => _$ProjectTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTabDataToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  String name;

  String url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}
