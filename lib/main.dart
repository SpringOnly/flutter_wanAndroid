import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/category_detail_content.dart';
import 'package:flutter_wan_android/page/category_page.dart';
import 'package:flutter_wan_android/page/home_page.dart';
import 'package:flutter_wan_android/page/login_page.dart';
import 'package:flutter_wan_android/page/mine_page.dart';
import 'package:flutter_wan_android/page/my_collect_page.dart';
import 'package:flutter_wan_android/page/project_page.dart';
import 'package:flutter_wan_android/page/webvie_page.dart';
import 'package:flutter_wan_android/provider/user_provider.dart';
import 'package:flutter_wan_android/server/dio_manager.dart';
import 'package:provider/provider.dart';

import 'utils/FRouter.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return UserProvider();
      })
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 路由跳转全局context
      navigatorKey: NavKey.navKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigator(),
      routes: {
        RouterConstant.login: (context) => const LoginPage(),
        RouterConstant.collect: (context) => const MyCollectPage(),
        RouterConstant.categoryDetailContent: (context) =>
            const CategoryDetailContentPage(),
        RouterConstant.webViewPage: (context) => const WebViewPage()
      },
    );
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  final _bottomNavigationColor = Colors.grey;
  int currIndex = 0;

  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    SpUtil.getInstance();
    DioManager.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const <Widget>[
          HomePage(),
          ProjectPage(),
          CategoryPage(),
          MinePage()
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFAFAFA),
        selectedItemColor: const Color(0xFF84A1E2),
        unselectedItemColor: const Color(0xFFA1A1A1),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: currIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _bottomNavigationColor),
              label: "首页",
              activeIcon: const Icon(Icons.home, color: Color(0xFF84A1E2))),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department,
                  color: _bottomNavigationColor),
              label: "项目",
              activeIcon: const Icon(Icons.local_fire_department,
                  color: Color(0xFF84A1E2))),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.category_outlined, color: _bottomNavigationColor),
              label: "分类",
              activeIcon: const Icon(Icons.category_outlined,
                  color: Color(0xFF84A1E2))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _bottomNavigationColor),
              label: "我的",
              activeIcon: const Icon(Icons.person, color: Color(0xFF84A1E2)))
        ],
      ),
    );
  }
}
