import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            child: Image(
              width: MediaQuery.of(context).size.width,
              height: 220,
              image: const AssetImage("images/ic_login.png"),
              fit:BoxFit.fill,
            ),
          ),
          Positioned.fill(
            top: 200,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
              ),
              child: ListView(
                children: [
                  Text("aaa"),
                  Text("bbb"),
                  Text("ccc"),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
