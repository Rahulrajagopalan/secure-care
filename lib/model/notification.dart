import 'package:flutter/foundation.dart';

class NotificationModel {
  String toid;
  String? notificationid;
  String message;
  String workname;

  NotificationModel({
    required this.toid,
    required this.message,
    this.notificationid,
    required this.workname,
  });

  Map<String, dynamic> toJson(id) => {
        'toid': toid,
        'notificationid': id,
        'message': message,
        'workername': workname,
      };

  factory NotificationModel.fromJsone(Map<String, dynamic> json) {
    return NotificationModel(
      toid: json['toid'],
      message: json['message'],
      workname: json['workername'],
      notificationid: json['notificationid'],
    );
  }
}
