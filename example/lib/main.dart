import 'package:app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import './config/routers.dart';
import './components/publicCompents.dart';

void main() {
  AppEnv.env = Env.dev;
  AppEnv.setAppConfig(AppConfig(
      routers: pageRouters
  ));

  final RootView rootView = RootView();

  runApp(rootView.build(
    type: PageType.Root,
    body: Root(),
  ));
}

class Root extends StatelessWidget {
  final RootView rootView = RootView();

  @override
  Widget build(BuildContext context) {
    return rootView.build(
      appBar: AppBarBuilder.build(
        context,
        title: 'home',
        titleStyle: TextStyle(fontSize: rootView.size(36)),
        leading: LeadingBuilder(),
      ),
      type: PageType.Page,
      body: Center(
        child: Text('yoyo!~~ hello!'),
      ),
    );
  }
}
