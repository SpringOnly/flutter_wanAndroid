// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../project_tab_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTabBean _$ProjectTabBeanFromJson(Map<String, dynamic> json) =>
    ProjectTabBean(
      json['author'] as String,
      json['children'] as List<dynamic>,
      json['courseId'] as int,
      json['cover'] as String,
      json['desc'] as String,
      json['id'] as int,
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int,
    );

Map<String, dynamic> _$ProjectTabBeanToJson(ProjectTabBean instance) =>
    <String, dynamic>{
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
