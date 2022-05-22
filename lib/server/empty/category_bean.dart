import 'package:json_annotation/json_annotation.dart';

part 'category_bean.g.dart';

List<CategoryBean> getCategoryBeanList(List<dynamic> list){
  List<CategoryBean> result = [];
  for (var item in list) {
    result.add(CategoryBean.fromJson(item));
  }
  return result;
}
@JsonSerializable()
class CategoryBean extends Object {

  String author;

  List<Children> children;

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

  CategoryBean(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory CategoryBean.fromJson(Map<String, dynamic> srcJson) => _$CategoryBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);

}


@JsonSerializable()
class Children extends Object {

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

  Children(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Children.fromJson(Map<String, dynamic> srcJson) => _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);

}


