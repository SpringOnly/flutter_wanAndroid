import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wan_android/utils/FRouter.dart';
import 'package:flutter_wan_android/widget/app_bar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    var routeParams = getRouteParams(context);
    return Scaffold(
        appBar: titleBar(routeParams["web_title"]),
        body: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            javaScriptEnabled: true,
          )),
          initialUrlRequest: URLRequest(url: Uri.parse(routeParams["web_url"])),
        ));
  }
}
