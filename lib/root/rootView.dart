import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/appStyle.dart';
import 'utils/http.dart';
import 'utils/socket.dart';
import 'appEnv.dart';
import 'comm.dart';
import 'utils/size.dart';

enum RootType { root, page, component }

class RootView {
  final BuildContext context;
  final SocketUtil socketUtil = SocketUtil();

  RootView(this.context);

  Widget build({
    @required Widget body,
    @required RootType type,
    Color backgroundColor: Colors.white,
    ThemeData themeData,
    AppBar appBar,
  }) => _buildBody(type, body, backgroundColor, themeData, appBar: appBar);

  Widget _buildBody(RootType type, Widget body, Color backgroundColor, ThemeData themeData, {
    AppBar appBar,
  }) {
    switch(type) {
      case RootType.root:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeData ?? appThemeData,
          home: _scaffoldBuild(body, backgroundColor, appBar),
          routes: AppRouter.routers,
        );
      case RootType.page:
        return _scaffoldBuild(body, backgroundColor, appBar);
      default: return body;
    }
  }

  Scaffold _scaffoldBuild(Widget body, Color backgroundColor, AppBar appBar) => Scaffold(
    backgroundColor: backgroundColor,
    appBar: appBar,
    body: body,
  );
  
  void sizeInit() => AppSize.init(width: 750, height: 1334, allowFontScaling: false);

  double size(double size) => AppSize().size(size);

  void gotoPage(String path, { Map params }) => Navigator.of(context).pushNamed(path, arguments: params);

  Map pageParams() => ModalRoute.of(context).settings.arguments;

  Future request(RequestBuilder requestBuilder) async => await HttpRequest.request(requestBuilder);

  SocketUtil socketConnect(String url, String params) {
    socketUtil.open(url, params);
    return socketUtil;
  }

  void socketClose() => socketUtil.close();

  void socketReset() => socketUtil.reopen();
}