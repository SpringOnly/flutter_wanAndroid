import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';
import 'package:flutter_wan_android/utils/view_util.dart';

///首页tab
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: top),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: homeTopSearch(),

          )
        ],
      ),
    ));
  }
}
///顶部搜索区域
homeTopSearch() {
  return Container(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
    child: Row(
      children: [
        Expanded(
          flex: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const Image(
                width: 30,
                height: 30,
                image: AssetImage('images/default_avatar.png')),
          ),
        ),
        viewSpace(width: 10),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                showToast("显示搜索");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  height: 32,
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  decoration: BoxDecoration(color: Colors.grey[200]),
                ),
              ),
            ))
      ],
    ),
  );
}
