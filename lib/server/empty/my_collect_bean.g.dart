// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_collect_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCollectBean _$MyCollectBeanFromJson(Map<String, dynamic> json) =>
    MyCollectBean(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$MyCollectBeanToJson(MyCollectBean instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['courseId'] as int,
      json['desc'] as String,
      json['envelopePic'] as String,
      json['id'] as int,
      json['link'] as String,
      json['niceDate'] as String,
      json['origin'] as String,
      json['originId'] as int,
      json['publishTime'] as int,
      json['title'] as String,
      json['userId'] as int,
      json['visible'] as int,
      json['zan'] as int,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'originId': instance.originId,
      'publishTime': instance.publishTime,
      'title': instance.title,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
