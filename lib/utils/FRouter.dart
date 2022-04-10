import 'package:flutter/cupertino.dart';

//静态常量
class RouterConstant {
  static const String login = "login";
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

//路由跳转
  void navigator(String pageName) {
    NavKey.navKey.currentState?.pushNamed(pageName);
  }
}
