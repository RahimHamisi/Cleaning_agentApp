import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, size: 60, color: Colors.blueGrey), // Centered Icon
                    SizedBox(height: 20),
                    Text("create account",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Email",border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(labelText: "Password",border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 50)
                    ), child: Text("LOGIN"),),
                    TextButton(onPressed: (){}, child: Text("Don't have an Account? Register"))

                  ],
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
