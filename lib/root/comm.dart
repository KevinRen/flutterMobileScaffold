import 'package:flutter/cupertino.dart';

enum DataType { String, Map, Int, List, Bool }
enum ContentType { FormData, Json }

class RequestBuilder {
  final BuildContext context;
  final String url;
  final String token;
  final Map data;
  final DataType dataType;
  final Map<String, dynamic> headerSetting;

  RequestBuilder({
    @required this.context,
    @required this.url,
    this.dataType = DataType.Map,
    this.token,
    this.data,
    this.headerSetting,
  });
}

class DialogParams {
  final BuildContext context;
  final String content;
  final String title;
  final String cancelTxt;
  final Function cancelEvent;
  final String okTxt;
  final Function okEvent;
  final Color mainColor;

  DialogParams({
    @required this.context,
    @required this.content,
    @required this.title,
    this.cancelTxt,
    this.cancelEvent,
    this.okTxt,
    this.okEvent,
    this.mainColor,
  });
}