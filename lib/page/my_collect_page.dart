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
  int _page = 0;
  List<Article>? _myCollectList = [];
  final GlobalKey<RefreshIndicatorState> _indicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    ///build 以后手动调用刷新操作
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _indicatorKey.currentState?.show();
    });
  }

  _buildItem(Article article) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      ///单个item
                      Article article = _myCollectList![index];
                      return _buildItem(article);
                    },
                    itemCount: _myCollectList?.length,
                  ),
                  onRefresh: () {
                    getCollect();
                    return Future.value();
                  }))
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
                _myCollectList = result.datas;
              })
            },
        (error) => {showToast(error)});
  }
}
