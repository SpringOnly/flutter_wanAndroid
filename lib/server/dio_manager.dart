import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_wan_android/server/base/base_bean.dart';
import 'package:flutter_wan_android/server/base/base_list_bean.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';
import 'package:path_provider/path_provider.dart';
import 'request_interceptor.dart';

class DioManager {
  ///dart 使用_定义为私有方法和属性
  static DioManager? _instance;
  Dio? _dio;

  ///??双问号同等于
  ///  if (_instance == null) {
  ///       _instance = DioManager._init();
  ///     }
  static DioManager get() {
    _instance ??= DioManager._init();
    return _instance!;
  }

  ///dart自带单例模式
  factory DioManager() {
    return get();
  }

  ///dart独特写法 在初始化的时候执行
  DioManager._init() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          // 请求基地址
          baseUrl: "https://wanandroid.com",
          responseType: ResponseType.json,
          // 连接服务器超时时间，单位是毫秒
          connectTimeout: 10 * 1000,
          receiveTimeout: 3 * 1000));

      _dio?.interceptors.add(RequestInterceptor());

      ///cookies管理
      _getLocalFile();

      ///打开日志
      _dio?.interceptors.add(LogInterceptor(
          request: false, responseHeader: false, responseBody: true));
    }
  }

  ///设置cookie
  void _getLocalFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var cj = PersistCookieJar(
        ignoreExpires: true, storage: FileStorage(appDocPath + "/.cookies/"));
    _dio?.interceptors.add(CookieManager(cj));
  }

  /// 请求入口
  /// 方法名称 接口路径 参数  绑定生命周期 成功回调
  /// 可选 失败回调 最终执行
  /// result data是对象时用此方法
  requestObject(String method, String path, Map<String, dynamic> params,
      CancelToken? cancelToken, Function(Map<String, dynamic> result) onSuccess,
      {Function(String error)? onError, Function()? onFinally}) async {
    try {
      var response = await _dio?.request(path,
          options: Options(method: method), queryParameters: params);

      cancelToken?.cancel("");

      var bean = BaseBean.fromJson(response!.data);

      if (response.statusCode == 200 && bean.data != null) {
        onSuccess(bean.data!);
      } else {
        onError!(bean.errorMsg!);
      }
    } on DioError catch (e) {
      ///如果请求取消 直接返回
      if (e.type == DioErrorType.cancel) {
        return;
      }
      showToast(e.message);
    } finally {
      onFinally!();
    }
  }

  /// 请求入口
  /// 方法名称 接口路径 参数  绑定生命周期 成功回调
  /// 可选 失败回调 最终执行
  /// result data是数组时使用此方法
  requestObjectList(String method, String path, Map<String, dynamic> params,
      CancelToken? cancelToken, Function(List<dynamic> list) onSuccess,
      {Function(String error)? onError, Function()? onFinally}) async {
    try {
      var response = await _dio?.request(path,
          options: Options(method: method), queryParameters: params);

      cancelToken?.cancel("");

      var bean = BaseListBean.fromJson(response!.data);

      if (response.statusCode == 200 && bean.data != null) {
        onSuccess(bean.data!);
      } else {
        onError!(bean.errorMsg!);
      }
    } on DioError catch (e) {
      ///如果请求取消 直接返回
      if (e.type == DioErrorType.cancel) {
        return;
      }
      showToast(e.message);
    } finally {
      onFinally!();
    }
  }
}
