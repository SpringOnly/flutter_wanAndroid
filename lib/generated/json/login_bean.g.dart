import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/server/empty/user_bean.dart';

UserBean $UserBeanFromJson(Map<String, dynamic> json) {
	final UserBean userBean = UserBean();
	final bool? admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		userBean.admin = admin;
	}
	final List<dynamic>? chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		userBean.chapterTops = chapterTops;
	}
	final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		userBean.coinCount = coinCount;
	}
	final List<dynamic>? collectIds = jsonConvert.convertListNotNull<dynamic>(json['collectIds']);
	if (collectIds != null) {
		userBean.collectIds = collectIds;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userBean.email = email;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		userBean.icon = icon;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userBean.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userBean.nickname = nickname;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userBean.password = password;
	}
	final String? publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		userBean.publicName = publicName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userBean.token = token;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		userBean.type = type;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userBean.username = username;
	}
	return userBean;
}

Map<String, dynamic> $UserBeanToJson(UserBean entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['admin'] = entity.admin;
	data['chapterTops'] =  entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] =  entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}