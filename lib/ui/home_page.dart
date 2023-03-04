import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_calender/services/local_notification_service.dart';
import 'package:to_do_calender/services/notification_services.dart';
import 'package:to_do_calender/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationServices _notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    _notificationServices.initializeNotification();
    // notifyHelper=NotifyHelper();
    // notifyHelper.initializeNotification();
  }

  var thems = ThemeServices().obs;

  var isDarkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(), //for making custom appBar
      body: Column(
        children: [
          Text(
            "Hello there",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          thems.value.switchTheme();
          if (thems.value.theme == ThemeMode.dark) {
            isDarkMode.value = true;
          } else {
            isDarkMode.value = false;
          }
          _notificationServices.sendNotifications("Success",
              "Theme change to ${isDarkMode.value ? "dark" : "light"}");
          // notifyHelper.displayNotification(
          //   title:"Theme Changed",
          //   body: Get.isDarkMode?"Activated Dark Theme":"Activated Light Theme"
          // );
        },
        child: Obx(() => Icon(
              isDarkMode.value ? Icons.nightlight_round : Icons.wb_sunny,
              size: 20,
            )),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
