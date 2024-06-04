import 'package:flutter/material.dart';
import 'package:hospital_assistant/screens/Event_notifier/layout/todo_layoutcontroller.dart';
import 'package:hospital_assistant/screens/Event_notifier/shared/network/local/cashhelper.dart';
import 'package:hospital_assistant/screens/Event_notifier/shared/network/local/notification.dart';
import 'package:hospital_assistant/screens/splash/splash_screen.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'api.dart';
import 'routes.dart';
import 'theme.dart';
import 'package:get/get.dart';
import 'package:hospital_assistant/screens/Event_notifier/shared/styles/thems.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // NOTE : catch notification  with parameter while app is closed and when on press notification
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print("message data opened " + message.data.toString());
    //showToast(message: "on message opened", status: ToastStatus.Success);
  });

  await CashHelper.init();

// NOTE Notification
  await NotificationApi.init();

  // NOTE check cash theme and set it to Get
  bool? isdarkcashedthem = CashHelper.getThem(key: "isdark");
  print("cash theme " + isdarkcashedthem.toString());
  if (isdarkcashedthem != null) {
    Get.changeTheme(isdarkcashedthem ? Themes.darkThem : Themes.lightTheme);
  }

  Get.put(TodoLayoutController());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital App',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
// size config.dart