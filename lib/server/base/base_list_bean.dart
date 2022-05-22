class BaseListBean<T> {
  List<T> ? data;
  int? errorCode;
  String? errorMsg;

  BaseListBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = json['data'];
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
}
