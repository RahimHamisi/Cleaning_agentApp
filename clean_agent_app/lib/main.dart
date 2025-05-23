import 'package:clean_agent_app/screen/homepage.dart';
import 'package:clean_agent_app/screen/login_screen.dart';
import 'package:clean_agent_app/screen/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/home":(context) => const Homepage(),
        "/" :(context) => const LoginScreen(),
        "/register" :(context) => const RegisterPage()
      },
    );
  }
}

