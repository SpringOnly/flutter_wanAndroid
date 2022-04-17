import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/FRouter.dart';
import 'package:flutter_wan_android/utils/view_util.dart';
import 'package:flutter_wan_android/widget/setting_item.dart';

import '../model/MineItemModel.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State with AutomaticKeepAliveClientMixin {
  List<MineItemModel> mineItemList = [
    MineItemModel("images/ic_zan.png", "我的收藏"),
    MineItemModel("images/ic_rank.png", "积分排行"),
    MineItemModel("images/ic_setting.png", "设置"),
    MineItemModel("images/ic_about.png", "关于"),
  ];

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30),
          color: Colors.blue,
          height: 180,
          child: GestureDetector(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                      width: 60,
                      height: 60,
                      image: AssetImage('images/default_avatar.png')),
                ),
                viewSpace(width: 15),
                const Text("登录/注册")
              ],
            ),
            onTap: () {
              FRouter.getInstance()?.navigator(RouterConstant.login);
            },
          ),
        ),
        Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SettingItem(
                    icon: mineItemList[index].icon,
                    title: mineItemList[index].title,
                    index: index);
              },
              itemCount: mineItemList.length,
            ))
      ],
    );
  }
}
