import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wan_android/page/base/base_state.dart';
import 'package:flutter_wan_android/server/dio_constant.dart';
import 'package:flutter_wan_android/server/dio_manager.dart';
import 'package:flutter_wan_android/server/dio_method.dart';
import 'package:flutter_wan_android/server/empty/category_bean.dart';
import 'package:flutter_wan_android/utils/FRouter.dart';
import 'package:flutter_wan_android/utils/view_util.dart';

///tab分类页面
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends BaseState<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  List<CategoryBean>? _categoryList;

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "分类",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            //第一次加载的时候返回空
            if (_categoryList == null) {
              return const Text("");
            }
            var category = _categoryList![index];
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                  viewSpace(height: 2),
                  const Divider(color: Colors.black12),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: _buildItem(category.children),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: _categoryList?.length),
    );
  }

  setData(List<dynamic> list) {
    setState(() {
      _categoryList = getCategoryBeanList(list);
    });
  }

  getCategory() {
    Map<String, dynamic> params = <String, dynamic>{};
    DioManager.get().requestObjectList(DioMethod.GET, DioConstant.CATEGORYT,
        params, cancelToken, (list) => {setData(list)},
        onFinally: () {});
  }

  _buildItem(List<Children> list) {
    return list.map((item) {
      return ActionChip(
        elevation: 5.0,
        label: Text(item.name),
        onPressed: () {
          FRouter.getInstance()?.navigator(RouterConstant.collect,
              arguments: {"article_cid": item.id, "article_title": item.name}
          );
        },
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        labelStyle: const TextStyle(color: Colors.white),
      );
    }).toList();
  }
}
