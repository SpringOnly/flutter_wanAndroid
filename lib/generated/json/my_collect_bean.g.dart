import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/server/empty/my_collect_bean.dart';

MyCollectBean $MyCollectBeanFromJson(Map<String, dynamic> json) {
	final MyCollectBean myCollectBean = MyCollectBean();
	final List<Article>? datas = jsonConvert.convertListNotNull<Article>(json['datas']);
	if (datas != null) {
		myCollectBean.datas = datas;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		myCollectBean.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		myCollectBean.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		myCollectBean.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		myCollectBean.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		myCollectBean.total = total;
	}
	return myCollectBean;
}

Map<String, dynamic> $MyCollectBeanToJson(MyCollectBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['datas'] =  entity.datas?.map((v) => v.toJson()).toList();
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}

Article $MyCollectDatasFromJson(Map<String, dynamic> json) {
	final Article myCollectDatas = Article();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		myCollectDatas.author = author;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		myCollectDatas.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		myCollectDatas.chapterName = chapterName;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		myCollectDatas.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		myCollectDatas.desc = desc;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		myCollectDatas.envelopePic = envelopePic;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		myCollectDatas.id = id;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		myCollectDatas.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		myCollectDatas.niceDate = niceDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		myCollectDatas.origin = origin;
	}
	final int? originId = jsonConvert.convert<int>(json['originId']);
	if (originId != null) {
		myCollectDatas.originId = originId;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		myCollectDatas.publishTime = publishTime;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		myCollectDatas.title = title;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		myCollectDatas.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		myCollectDatas.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		myCollectDatas.zan = zan;
	}
	return myCollectDatas;
}

Map<String, dynamic> $MyCollectDatasToJson(Article entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['envelopePic'] = entity.envelopePic;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['origin'] = entity.origin;
	data['originId'] = entity.originId;
	data['publishTime'] = entity.publishTime;
	data['title'] = entity.title;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}