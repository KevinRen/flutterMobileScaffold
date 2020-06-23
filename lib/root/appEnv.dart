import 'package:flutter/material.dart';
import 'utils/http.dart';
import 'comm.dart';

enum Env {
  dev,
  qa,
  uat,
  product
}

class AppConfig {
  final String baseUrl;
  final Interceptor interceptor;
  final ContentType contentType;
  final Map<String, WidgetBuilder> routers;

  AppConfig({
    this.routers,
    this.baseUrl: 'http://localhost:8080',
    this.interceptor,
    this.contentType,
  });
}

class AppEnv {
  static Env env = Env.dev;

  static void setAppConfig(AppConfig config) {
    HttpRequest.baseUrl = config.baseUrl;
    if (config.routers != null) AppRouter.routers = config.routers;
    if (config.interceptor != null) HttpRequest.interceptor = config.interceptor;
    if (config.contentType != null) HttpRequest.contentType = config.contentType;
  }
}

class AppRouter {
  static Map<String, WidgetBuilder> routers;
}