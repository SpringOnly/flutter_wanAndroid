import 'package:flutter/material.dart';

///顶部通用的导航栏
titleBar(String title, {bool? isShowBack}) {
  return AppBar(
    centerTitle: true,
    titleSpacing: 0,
    titleTextStyle: const TextStyle(color: Colors.black),
    backgroundColor: Colors.white,
    leading: isShowBackButton(isShowBack),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
  );
}

isShowBackButton(bool? isShowBack) {
  ///如果不传 默认是显示返回按钮的
  if (isShowBack == null) {
    return const BackButton(color: Colors.black);
  } else {
    return null;
  }
}
