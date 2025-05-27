import 'package:clean_agent_app/screen/register_screen.dart';
import 'package:clean_agent_app/screen/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:clean_agent_app/screen/homepage.dart';
import 'package:quickalert/quickalert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoggingIn = false;

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoggingIn = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isLoggingIn = false;
      });

      _showSuccessPopup();
    } else {
      _showErrorPopup("Invalid login credentials. Please try again.");
    }
  }

  void _showSuccessPopup() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: "Login Successful!",
      autoCloseDuration: const Duration(seconds: 2),
      showConfirmBtn: true,
      onConfirmBtnTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserDashboard()));
      },
    );
  }

  void _showErrorPopup(String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
      title: "Login Error",
      confirmBtnText: "Try Again",
      confirmBtnColor: Colors.redAccent,
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/background_image.jpg",fit: BoxFit.cover,)),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(24),
                decoration: _buildCardDecoration(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("LOGIN", style: _titleTextStyle),
                      const SizedBox(height: 30),

                      _buildTextField("Username", usernameController, "Enter your username"),
                      _buildTextField("Password", passwordController, "Enter your password", obscureText: true),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B4A), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: isLoggingIn ? const CircularProgressIndicator(color: Colors.white) : const Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildRegisterRedirect(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  BoxDecoration _buildCardDecoration() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)]);

  static const TextStyle _titleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF6B4A));

  Widget _buildTextField(String label, TextEditingController controller, String hint, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hint, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
        validator: (value) {
          if (value == null || value.isEmpty) return "$label is required";
          return null;
        },
      ),
    );
  }
  Widget _buildRegisterRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?", style: TextStyle(fontSize: 16, color: Colors.grey)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          child: const Text(" Register", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFF6B4A))),
        ),
      ],
    );
  }

}
