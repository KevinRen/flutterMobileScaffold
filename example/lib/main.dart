import 'package:app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import './config/routers.dart';
import './app.dart';

void main() {
  AppEnv.env = Env.dev;
  AppEnv.setAppConfig(AppConfig(
      routers: pageRouters
  ));
  runApp(App());
}
