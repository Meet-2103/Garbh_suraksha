import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_assistant/screens/Event_notifier/shared/styles/thems.dart';
import 'layout/todo_layout.dart';
import 'layout/todo_layoutcontroller.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  TodoLayoutController todoController = Get.find<TodoLayoutController>();

  @override
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //NOTE to use 24 hour format
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!),
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkThem,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: TodoLayout(),
    );
  }
}
