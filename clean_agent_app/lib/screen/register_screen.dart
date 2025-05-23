import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85, // Responsive width
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("REGISTER", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text("Register"),
                    ),
                    TextButton(
                      onPressed: () {
                      },
                      child: Text("Already have an account? Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
