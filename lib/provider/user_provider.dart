import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/server/empty/user_bean.dart';

class UserProvider extends ChangeNotifier {
  UserBean? _user;

  ///dart写法 等同于java中的get方法
  UserBean? get user {
    return _user;
  }

  ///用户是否存在
  bool get hasUser {
    return _user != null;
  }

  ///保存用户
  savaUser(UserBean userBean) {
    _user = userBean;

    ///更新所有已经注册的组件
    notifyListeners();
  }

  ///清楚用户
  cleanUser(UserBean userBean) {
    _user = null;
    ///更新所有已经注册的组件
    notifyListeners();
  }
}
