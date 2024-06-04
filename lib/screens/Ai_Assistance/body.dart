import 'package:hospital_assistant/screens/Ai_Assistance/AI_Assistant.dart';
import 'package:flutter/material.dart';





import '../../api.dart';

class Chat_Body extends StatelessWidget {
  static String routeName = "/chat";
  const Chat_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
