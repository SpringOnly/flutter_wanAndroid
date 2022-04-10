import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive{
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return const Text("CategoryPage");
  }
}
