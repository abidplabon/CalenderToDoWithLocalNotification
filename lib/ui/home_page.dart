import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_calender/services/notification_services.dart';
import 'package:to_do_calender/services/theme_services.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var notifyHelper;
  @override
  void initState(){
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),    //for making custom appBar
      body: Column(
        children: [
          Text("Hello there",
          style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }



  _appBar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title:"Theme Changed",
            body: Get.isDarkMode?"Activated Dark Theme":"Activated Light Theme"
          );
        },
        child: Icon(Icons.nightlight_round, size: 20,),
      ),
      actions: [
        Icon(Icons.person, size: 20,),
        SizedBox(width: 20,),
      ],
    );
  }
}
