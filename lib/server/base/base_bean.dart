import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import '../../generated/json/base/json_convert_content.dart';

@JsonSerializable()
class BaseBean<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  BaseBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = JsonConvert.fromJsonAsT<T>(json['data']);
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

