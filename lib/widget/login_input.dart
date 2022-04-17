import 'package:flutter/material.dart';

//登录 注册输入框组件
class LoginInput extends StatefulWidget {
  final String? title;
  final String? hint;

  const LoginInput({Key? key, this.title, this.hint}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginInputState();
  }
}

class LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      // child: Column(
      //   children: [
      //     Text(widget.title!),
      //   ],
      // ),
    );
  }
}
