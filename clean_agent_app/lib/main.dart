import 'package:clean_agent_app/screen/company_registered.dart';
import 'package:clean_agent_app/screen/homepage.dart';
import 'package:clean_agent_app/screen/login_screen.dart';
import 'package:clean_agent_app/screen/register_screen.dart';
import 'package:clean_agent_app/screen/setting_page.dart';
import 'package:clean_agent_app/screen/user_dashboard.dart';
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
        "/ser":(context) => const Homepage(),
        "/login" :(context) => const LoginScreen(),
        "/register" :(context) => const RegisterPage(),
        "/k" : (context) => const CompanyRegistered(),
        "/h": (context) => const UserDashboard(),
        "/": (context) => const SettingsPage(),

      },
    );
  }
}

