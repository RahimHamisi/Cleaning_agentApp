import 'package:flutter/material.dart';
import 'package:clean_agent_app/screen/login_screen.dart';
import 'package:quickalert/quickalert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isRegistering = false;

  void _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isRegistering = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isRegistering = false;
      });

      _showSuccessPopup();
    }
  }

  void _showSuccessPopup() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: "Registration Successful!",
      autoCloseDuration: const Duration(seconds: 2),
      showConfirmBtn: true,
      onConfirmBtnTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                      const Text("REGISTER", style: _titleTextStyle),
                      const SizedBox(height: 30),

                      _buildTextField("Username", usernameController, "Enter your username"),
                      _buildTextField("Email", emailController, "Enter your email", emailValidation: true),
                      _buildTextField("Password", passwordController, "Enter your password", obscureText: true),
                      _buildTextField("Confirm Password", confirmPasswordController, "Confirm your password", obscureText: true, passwordMatchValidation: true),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleRegistration,
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B4A), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: isRegistering ? const CircularProgressIndicator(color: Colors.white) : const Text("Register", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildLoginRedirect(),
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

  Widget _buildTextField(String label, TextEditingController controller, String hint, {bool obscureText = false, bool emailValidation = false, bool passwordMatchValidation = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hint, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
        validator: (value) {
          if (value == null || value.isEmpty) return "$label is required";
          if (emailValidation && !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$").hasMatch(value)) return "Enter a valid email";
          if (passwordMatchValidation && value != passwordController.text) return "Passwords do not match";
          return null;
        },
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?", style: TextStyle(fontSize: 16, color: Colors.grey)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(" Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFF6B4A))),
        ),
      ],
    );
  }
}
