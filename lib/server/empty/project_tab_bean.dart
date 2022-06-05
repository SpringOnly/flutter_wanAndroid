import 'package:json_annotation/json_annotation.dart';

part 'jsonSerializable/project_tab_bean.g.dart';


List<ProjectTabBean> getProjectTabBeanList(List<dynamic> list){
  List<ProjectTabBean> result = [];
  for (var item in list) {
    result.add(ProjectTabBean.fromJson(item));
  }
  return result;
}
@JsonSerializable()
class ProjectTabBean extends Object {

  String author;

  List<dynamic> children;

  int courseId;

  String cover;

  String desc;

  int id;

  String lisense;

  String lisenseLink;

  String name;

  int order;

  int parentChapterId;

  bool userControlSetTop;

  int visible;

  ProjectTabBean(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory ProjectTabBean.fromJson(Map<String, dynamic> srcJson) => _$ProjectTabBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTabBeanToJson(this);

}
