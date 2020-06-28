import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'config/appStyle.dart';
import 'utils/http.dart';
import 'utils/socket.dart';
import 'appEnv.dart';
import 'define.dart';
import 'utils/size.dart';
import 'package:oktoast/oktoast.dart';
import 'utils/dialog.dart';

enum RootType { root, page, component }

class RootView {
  final BuildContext context;
  final SocketUtil socketUtil = SocketUtil();

  RootView(this.context);

  Widget build({
    @required RootType type,
    @required Widget body,
    Color backgroundColor: Colors.white,
    ThemeData themeData,
    AppBar appBar,
    BottomNavigationBar bottomNavigationBar,
  }) =>
      _buildBody(type, body, backgroundColor, themeData, appBar: appBar,
          bottomNavigationBar: bottomNavigationBar);

  Widget _buildBody(RootType type, Widget body, Color backgroundColor, ThemeData themeData, {
    AppBar appBar, BottomNavigationBar bottomNavigationBar
  }) {
    switch(type) {
      case RootType.root:
        return OKToast(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData ?? appThemeData,
            home: _scaffoldBuild(
                body, backgroundColor, appBar, bottomNavigationBar),
            routes: AppRouter.routers,
          ),
        );
      case RootType.page:
        return _scaffoldBuild(
            body, backgroundColor, appBar, bottomNavigationBar);
      default: return body;
    }
  }

  Scaffold _scaffoldBuild(Widget body, Color backgroundColor, AppBar appBar,
      BottomNavigationBar bottomNavigationBar) =>
      Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: body,
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: bottomNavigationBar != null
            ? bottomNavigationBar
            : null,
      );
  
  void sizeInit() => AppSize.init(width: 750, height: 1334, allowFontScaling: false);

  void toast(String message, { int duration: 1000 }) => showToast(message, duration: Duration(milliseconds: duration));

  void dialog(DialogParams dialogParams) => AppDialog.show(dialogParams);

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