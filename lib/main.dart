import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'wan android'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _bottomNavigationColor = Colors.grey;
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFAFAFA),
        selectedItemColor: const Color(0xFF84A1E2),
        unselectedItemColor: const Color(0xFFA1A1A1),
        currentIndex: currIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            currIndex = value;
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
              activeIcon: const Icon(Icons.local_fire_department, color: Color(0xFF84A1E2))),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.category_outlined, color: _bottomNavigationColor),
              label: "分类",
              activeIcon: const Icon(Icons.category_outlined, color: Color(0xFF84A1E2))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _bottomNavigationColor),
              label: "我的",
              activeIcon: const Icon(Icons.person, color: Color(0xFF84A1E2)))
        ],
      ),
    );
  }
}
