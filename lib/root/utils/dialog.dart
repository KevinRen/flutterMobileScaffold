import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../define.dart';

class AppDialog {
  static bool _isShowDialog = false;

  // BuildContext context, String content, {String title, String cancelTxt, Function cancelEvent, String okTxt, Function okEvent}

  static void show(DialogParams dialogParams) {
    List<Widget> actions = List();

    actions.add(CupertinoDialogAction(
      child: Text(dialogParams.cancelTxt != null ? dialogParams.cancelTxt : '取消', style: TextStyle(color: Colors.black87, fontSize: 16)),
      onPressed: () {
        close(dialogParams.context);
        if (dialogParams.cancelEvent != null) {
          dialogParams.cancelEvent();
        }
      },
    ));

    if (dialogParams.okTxt != null) {
      actions.add(CupertinoDialogAction(
        child: Text(dialogParams.okTxt, style: TextStyle(color: dialogParams.mainColor ?? Colors.red, fontSize: 16)),
        isDefaultAction: true,
        onPressed: () {
          close(dialogParams.context);
          if (dialogParams.okEvent != null) {
            dialogParams.okEvent();
          }
        },
      ));
    }
    try {
      close(dialogParams.context);
      showDialog(
        context: dialogParams.context,
        barrierDismissible: false,
        builder: (_) => CupertinoAlertDialog(
            title: dialogParams.title != null
                ? Text(
              dialogParams.title,
              style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
            )
                : null,
            content: Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                dialogParams.content,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            actions: actions),
      );
      _isShowDialog = true;
    } catch (e) {
      print(e);
    }
  }

  static void close(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop() && _isShowDialog) {
      Navigator.of(context, rootNavigator: true).pop();
      _isShowDialog = false;
    }
  }
}