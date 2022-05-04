class LoginRequestBean {
  String? username;
  String? password;

  LoginRequestBean();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
