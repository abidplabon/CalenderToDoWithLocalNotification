import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:to_do_calender/services/theme_services.dart';
import 'package:to_do_calender/ui/home_page.dart';
import 'package:to_do_calender/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,  //Declare all the themes and then set default in "themeMode"
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,   //Get function change from themeServices file and change according to that
      home: HomePage(),
    );
  }
}
