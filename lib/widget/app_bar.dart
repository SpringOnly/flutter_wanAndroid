import 'package:flutter/material.dart';

///顶部通用的导航栏
titleBar(String title) {
  return AppBar(
    centerTitle: true,
    titleSpacing: 0,
    titleTextStyle: const TextStyle(color: Colors.black),
    backgroundColor: Colors.white,
    leading: const BackButton(color: Colors.black,),
    title: Text(
      title,
      style: const TextStyle(fontSize: 18),
    ),
  );
}
