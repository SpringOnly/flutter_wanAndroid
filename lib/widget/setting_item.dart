import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/FRouter.dart';

class SettingItem extends StatelessWidget {
  final String? icon;
  final String? title;
  final int? index;

  const SettingItem({Key? key, this.icon, this.title, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            FRouter.getInstance()
                ?.navigator(RouterConstant.collect, isLogin: true);
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
      child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          height: 60,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide.none,
                bottom: BorderSide(width: 0.5, color: Colors.grey[200]!)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(icon!),
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 30, height: 1),
                  Text(title!, style: const TextStyle(fontSize: 14))
                ],
              )
            ],
          )),
    );
  }
}
