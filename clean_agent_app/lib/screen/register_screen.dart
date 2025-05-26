import 'package:flutter/material.dart';
import 'package:clean_agent_app/screen/login_screen.dart';

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

  void _handleRegistration() {
    if (_formKey.currentState!.validate()) {
      _showSuccessPopup();
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        });

        return _buildSuccessDialog("Registration Successful!");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(child: _buildBackgroundImage()),

          /// Registration Form
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      constraints: const BoxConstraints(maxWidth: 400),
                      padding: const EdgeInsets.all(24),
                      decoration: _buildCardDecoration(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text("REGISTRATION", style: _titleTextStyle),
                            const SizedBox(height: 30),

                            _buildTextField("Username", usernameController, "Enter your username"),
                            _buildTextField("Email", emailController, "Enter your email", emailValidation: true),
                            _buildTextField("Password", passwordController, "Enter your password", obscureText: true),
                            _buildTextField("Confirm Password", confirmPasswordController, "Confirm your password", obscureText: true, passwordMatchValidation: true),

                            const SizedBox(height: 24),
                            _buildRegisterButton(),
                            _buildLoginRedirect(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Success Dialog**
  Widget _buildSuccessDialog(String message) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width *0.8,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 50),
            const SizedBox(height: 10),
            Text(message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ]),
        ),
      ),
    );
  }

  /// **Reusable UI Components**
  Widget _buildBackgroundImage() => Image.asset("assets/images/background_image.jpg", fit: BoxFit.cover);
  BoxDecoration _buildCardDecoration() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)]);
  static const TextStyle _titleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF6B4A));

  /// **Reusable TextField**
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

  /// **Register Button**
  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleRegistration,
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF6B4A), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: const Text("Register", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
    );
  }

  /// **Login Redirect**
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
