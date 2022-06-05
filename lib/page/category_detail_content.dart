import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/base/base_state.dart';
import 'package:flutter_wan_android/server/dio_constant.dart';
import 'package:flutter_wan_android/server/dio_manager.dart';
import 'package:flutter_wan_android/server/dio_method.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';
import 'package:flutter_wan_android/utils/view_util.dart';
import 'package:flutter_wan_android/widget/app_bar.dart';

import '../server/empty/category_detail_bean.dart';
import '../server/empty/my_collect_bean.dart';
import '../utils/FRouter.dart';
import '../utils/color.dart';

///分类标签详情内容
class CategoryDetailContentPage extends StatefulWidget {
  const CategoryDetailContentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryDetailContentState();
  }
}

class CategoryDetailContentState extends BaseState {
  ///页码
  int _page = 0;

  ///列表数据
  List<CategoryDetail>? _categodyDetailList = [];

  ///下拉刷新手动控制器
  final GlobalKey<RefreshIndicatorState> _indicatorKey =
      GlobalKey<RefreshIndicatorState>();

  ///listView 滑动监听
  final ScrollController _controller = ScrollController();

  ///是否正在加载更多数据
  bool isLoadMoreData = false;

  ///没有更多数据了
  bool isNoMoreData = false;

  ///体系id
  int _articleCid = 0;


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
          ///正在请求数据
          isLoadMoreData = true;
        });
        getCollect();
      }
    });
  }

  _buildItem(CategoryDetail categoryDetail) {
    return InkWell(
      onTap: () {
        FRouter.getInstance()?.navigator(RouterConstant.webViewPage,
            arguments: {
              "web_title": categoryDetail.chapterName,
              "web_url": categoryDetail.link
            });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryDetail.title,
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
                    categoryDetail.chapterName,
                    style: const TextStyle(fontSize: 12, color: primary),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: primary)),
                ),
                viewSpace(width: 10),
                Text(
                  categoryDetail.shareUser,
                  style: const TextStyle(fontSize: 14, color: Colors.black26),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routeParams = getRouteParams(context);
    _articleCid = routeParams["article_cid"];

    return Scaffold(
      appBar: titleBar(routeParams["article_title"]),
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
                      CategoryDetail _categoryDetail = _categodyDetailList![index];
                      return _buildItem(_categoryDetail);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Colors.black12);
                    },
                    itemCount: _categodyDetailList!.length,
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
        ],
      ),
    );
  }

  setData(Map<String, dynamic> json) {
    var _categoryDetail = CategoryDetailBean.fromJson(json);
    setState(() {
      if (_categoryDetail.datas.isNotEmpty) {
        _categodyDetailList!.addAll(_categoryDetail.datas);
      } else {
        showToast("没有更多数据了");
        isNoMoreData = true;
      }
    });
  }

  getCollect() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["cid"] = _articleCid;

    var requestUrl =
        DioConstant.CATEGORYT_ARTICELE + _page.toString() + "/json";
    DioManager.get().requestObject(DioMethod.GET, requestUrl, params,
        cancelToken, (result) => {setData(result)}, onFinally: () {
      setState(() {
        isLoadMoreData = false;
      });
    });
  }
}
