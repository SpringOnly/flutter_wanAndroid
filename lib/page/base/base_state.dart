import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

///基础状态类
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final CancelToken cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    cancelToken.cancel("");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
