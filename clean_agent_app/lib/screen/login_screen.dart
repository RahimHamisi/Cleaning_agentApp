import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("create account",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            )
          ],
        ),
      ) ,
    );
  }
}
