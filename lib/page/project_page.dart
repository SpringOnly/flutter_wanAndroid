import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/base/base_state.dart';
import 'package:flutter_wan_android/page/project_detail_page.dart';
import 'package:flutter_wan_android/server/empty/project_tab_bean.dart';
import 'package:flutter_wan_android/utils/view_util.dart';

import '../server/dio_constant.dart';
import '../server/dio_manager.dart';
import '../server/dio_method.dart';
import '../utils/color.dart';

///项目页面
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProjectPageState();
  }
}

class ProjectPageState extends BaseState<ProjectPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive {
    return true;
  }

  TabController? tabController;
  List<ProjectTabBean> projectTabList = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 28, vsync: this);
    getProjectTab();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarH = ScreenUtil.getStatusBarH(context);
    if (projectTabList.isEmpty) {
      return const Text("");
    }
    return Scaffold(
        body: Column(
          children: [
            viewSpace(height: statusBarH),
            TabBar(
              tabs: projectTabList.map((tab) {
                return Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        tab.name,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ));
              }).toList(),
              controller: tabController,
              //设置未选中时的字体颜色，tabs里面的字体样式优先级最高
              unselectedLabelColor: Colors.black,
              //设置选中时的字体颜色，tabs里面的字体样式优先级最高
              labelColor: primary,
              //允许左右滚动
              isScrollable: true,
              //选中下划线的颜色
              indicatorColor: primary,
              //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
              indicatorSize: TabBarIndicatorSize.label,
              //选中下划线的高度，值越大高度越高，默认为2。0
              indicatorWeight: 2.0,
            ),

            Flexible(
              child: TabBarView(
                  controller: tabController,
                  children: projectTabList.asMap().keys.map((index){
                    var projectId = projectTabList[index].id;
                    return ProjectDetailPage(projectId: projectId);
                  }).toList()
              ),
            )
          ],
        ));
  }

  setData(List<dynamic> list) {
    setState(() {
      projectTabList = getProjectTabBeanList(list);
    });
  }

  getProjectTab() {
    Map<String, dynamic> params = <String, dynamic>{};

    var requestUrl = DioConstant.PROJECT_CATEGORY;
    DioManager.get().requestObjectList(DioMethod.GET, requestUrl, params,
        cancelToken, (result) => {setData(result)},
        onFinally: () {});
  }
}
