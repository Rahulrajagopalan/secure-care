import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

succes(BuildContext context, msg) {
  CherryToast.success(title: Text(msg, style: TextStyle(color: Colors.black)))
      .show(context);
}

infotoast(BuildContext context) {
  CherryToast.info(
    title: Text("User added", style: TextStyle(color: Colors.black)),
    action: Text("Display information", style: TextStyle(color: Colors.black)),
    actionHandler: () {
      print("Action button pressed");
    },
  ).show(context);
}
