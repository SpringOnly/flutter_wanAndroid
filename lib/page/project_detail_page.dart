import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/base/base_state.dart';
import 'package:flutter_wan_android/server/dio_constant.dart';
import 'package:flutter_wan_android/server/dio_manager.dart';
import 'package:flutter_wan_android/server/dio_method.dart';
import 'package:flutter_wan_android/server/empty/project_tab_bean.dart';
import 'package:flutter_wan_android/server/empty/project_tab_data_bean.dart';
import 'package:flutter_wan_android/utils/toast_util.dart';
import 'package:flutter_wan_android/utils/view_util.dart';
import 'package:flutter_wan_android/widget/app_bar.dart';

import '../server/empty/my_collect_bean.dart';
import '../utils/FRouter.dart';
import '../utils/color.dart';

///项目页面 每个tab通用的页面
class ProjectDetailPage extends StatefulWidget {
  final int projectId;

  ProjectDetailPage({Key? key, required this.projectId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProjectDetailState(projectId);
  }
}

class _ProjectDetailState extends BaseState with AutomaticKeepAliveClientMixin {
  ///页码
  int _page = 0;

  ///列表数据
  List<ProjectTabData>? _myProjectTabList = [];

  ///listView 滑动监听
  final ScrollController _controller = ScrollController();

  ///是否正在加载更多数据
  bool isLoadMoreData = false;

  ///没有更多数据了
  bool isNoMoreData = false;

  int projectId;

  _ProjectDetailState(this.projectId);

  //防止重新创建
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();

    getProjectDetail();

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
        getProjectDetail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (_myProjectTabList!.isEmpty) {
      return const Text("");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: RefreshIndicator(
                child: GridView.count(
                  padding: const EdgeInsets.only(top: 8),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: _myProjectTabList!.map((e) {
                    return InkWell(
                      onTap: () {
                        FRouter.getInstance()?.navigator(RouterConstant.webViewPage,
                            arguments: {
                              "web_title": e.title,
                              "web_url": e.link
                            });
                      },
                      child: SizedBox(
                        height: 280,
                        child: Card(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Image.network(e.envelopePic,
                                        fit: BoxFit.cover,
                                        width: size.width / 2 - 10,
                                        height: 180)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  child: Text(
                                    e.desc,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: primary,
                                      ),
                                      Expanded(
                                          child: Text(e.author,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54)))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                onRefresh: () {
                  getProjectDetail();
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
    );
  }

  setData(Map<String, dynamic> json) {
    var projectTabDataBean = ProjectTabDataBean.fromJson(json);
    setState(() {
      if (projectTabDataBean.datas.isNotEmpty) {
        _myProjectTabList!.addAll(projectTabDataBean.datas);
      } else {
        showToast("没有更多数据了");
        isNoMoreData = true;
      }
    });
  }

  getProjectDetail() {
    Map<String, dynamic> params = <String, dynamic>{};
    params["cid"] = projectId;

    var requestUrl = DioConstant.PROJECT_LIST_DATA + _page.toString() + "/json";
    DioManager.get().requestObject(DioMethod.GET, requestUrl, params,
        cancelToken, (result) => {setData(result)}, onFinally: () {
      setState(() {
        isLoadMoreData = false;
      });
    });
  }
}
