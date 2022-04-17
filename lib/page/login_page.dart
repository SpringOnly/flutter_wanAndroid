import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool enable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          //未定位widget占满Stack整个空间
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: 220,
                image: const AssetImage("images/ic_login.png"),
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              top: 200,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "用户名",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: "请输入用户名",
                                hintStyle: TextStyle(fontSize: 14))),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "密码",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: "请输入密码",
                                hintStyle: TextStyle(fontSize: 14))),
                        SizedBox(height: 20),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Fluttertoast.showToast(msg: "登录");
                            },
                            height: 40,
                            minWidth: double.infinity,
                            disabledColor: Colors.grey.shade300,
                            color: primary,
                            child: Text(
                              "登录",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                        SizedBox(height: 5),
                        SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "注册");
                              },
                              child: Text(
                                "注册",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black26),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
