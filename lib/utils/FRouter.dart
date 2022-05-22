import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/utils/constant/sp_constant.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';

//静态常量
class RouterConstant {
  ///登录页面
  static const String login = "login";

  ///收藏页面
  static const String collect = "collect";
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}

class FRouter {
  static FRouter? _instance;

//如果instance为空 那么创建出来
  static FRouter? getInstance() {
    _instance ??= FRouter();
    return _instance;
  }

  ///路由跳转   该地址是否需要登录
  ///pageName RouterConstant
  void navigator(String pageName, {bool? isLogin, Object? arguments}) {
    ///如果需要登录
    if (isLogin != null && isLogin == true) {
      var user = SpUtil.getObject(SpConstant.USER);
      if (user == null) {
        showToast("请先登录");
        NavKey.navKey.currentState?.pushNamed(RouterConstant.login);
        return;
      }
    }
    NavKey.navKey.currentState?.pushNamed(pageName, arguments: arguments);
  }
}
