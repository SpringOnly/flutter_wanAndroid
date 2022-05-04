import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/base/base_state.dart';
import 'package:flutter_wan_android/server/dio_constant.dart';
import 'package:flutter_wan_android/server/dio_manager.dart';
import 'package:flutter_wan_android/server/dio_method.dart';
import 'package:flutter_wan_android/server/empty/my_collect_bean.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';
import 'package:flutter_wan_android/utils/view_util.dart';
import 'package:flutter_wan_android/widget/app_bar.dart';

import '../utils/color.dart';

class MyCollectPage extends StatefulWidget {
  const MyCollectPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CollectPageState();
  }
}

class CollectPageState extends BaseState {
  ///页码
  int _page = 0;

  ///列表数据
  List<Article>? _myCollectList = [];

  ///下拉刷新手动控制器
  final GlobalKey<RefreshIndicatorState> _indicatorKey =
      GlobalKey<RefreshIndicatorState>();

  ///listView 滑动监听
  final ScrollController _controller = ScrollController();

  ///是否正在加载更多数据
  bool isLoadMoreData = false;

  ///没有更多数据了
  bool isNoMoreData = false;

  @override
  void initState() {
    super.initState();

    ///build 以后手动调用刷新操作
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _indicatorKey.currentState?.show();
    });

    _controller.addListener(() {
      ///数据还没有加载完
      ///当前像素等于滑动的最大值
      if (!isNoMoreData &&
          _controller.position.pixels == _controller.position.maxScrollExtent) {
        _page += 1;
        setState(() {
          isLoadMoreData = true;
        });
        getCollect();
      }
    });
  }

  _buildItem(Article article) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title!,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            maxLines: 1,

            ///超出省略号
            overflow: TextOverflow.ellipsis,
          ),
          viewSpace(height: 10),
          Row(
            children: [
              Container(
                height: 20,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  article.chapterName!,
                  style: const TextStyle(fontSize: 12, color: primary),
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: primary)),
              ),
              viewSpace(width: 10),
              Text(
                article.niceDate!,
                style: const TextStyle(fontSize: 14, color: Colors.black26),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar("我的收藏"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: RefreshIndicator(
                  key: _indicatorKey,
                  child: ListView.separated(
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      ///单个item
                      Article article = _myCollectList![index];
                      return _buildItem(article);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Colors.black12);
                    },
                    itemCount: _myCollectList!.length,
                  ),
                  onRefresh: () {
                    getCollect();
                    return Future.value();
                  })),
          Visibility(
              //正在加载中
              visible: isLoadMoreData ? true : false,
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )),
          Visibility(
            //没有更多数据
            visible: isNoMoreData ? true : false,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const Text("没有更多了", style: TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    );
  }

  getCollect() {
    Map<String, dynamic> params = <String, dynamic>{};

    var requestUrl = DioConstant.MY_COLLECT + _page.toString() + "/json";
    DioManager.get().request<MyCollectBean>(
        DioMethod.GET,
        requestUrl,
        params,
        cancelToken,
        (result) => {
              setState(() {
                ///如果有数据  就加入
                if (result.datas!.isNotEmpty) {
                  _myCollectList!.addAll(result.datas!);
                } else {
                  isNoMoreData = true;
                }
              })
            }, onFinally: () {
      isLoadMoreData = false;
    });
  }
}
