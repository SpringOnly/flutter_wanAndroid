class BaseBean {
  Map<String, dynamic>? data;
  int? errorCode;
  String? errorMsg;

  BaseBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = json['data'];
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
}
