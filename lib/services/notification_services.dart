import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotifyHelper{
  FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    //tz.initializeTimeZones();
    /*final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );*/
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("appicon");

      final InitializationSettings initializationSettings =
      InitializationSettings(
      // iOS: initializationSettingsIOS,
      android:initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
        );
  }

  Future onDidReceiveLocalNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(()=>Container(color: Colors.white,));
  }
}