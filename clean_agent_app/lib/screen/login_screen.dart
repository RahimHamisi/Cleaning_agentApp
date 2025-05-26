import 'package:clean_agent_app/screen/homepage.dart';
import 'package:clean_agent_app/screen/register_screen.dart';
import 'package:flutter/material.dart';


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

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoggingIn = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoggingIn = false;
        });
        _showSuccessPopup();
      });
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents user from dismissing manually
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage()));
        });

        return _buildSuccessDialog("Login Successful!");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_image.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// Overlay for better readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          /// Login Form
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            const Text("LOGIN", style: _titleTextStyle),
                            const SizedBox(height: 30),

                            _buildTextField("Username", usernameController, "Enter your username"),
                            _buildTextField("Password", passwordController, "Enter your password", obscureText: true),

                            const SizedBox(height: 30),

                            /// **Login Button**
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _handleLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B4A),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: isLoggingIn
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              ),
                            ),

                            const SizedBox(height: 20),

                            _buildRegisterRedirect(),
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

  /// **Success Dialog with Animation**
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
  BoxDecoration _buildCardDecoration() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)]);
  static const TextStyle _titleTextStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFF6B4A));

  /// **Reusable TextField with Validation**
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

  /// **Register Redirect**
  Widget _buildRegisterRedirect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?", style: TextStyle(fontSize: 16, color: Colors.grey)),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
          child: const Text(" Register", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFFF6B4A))),
        ),
      ],
    );
  }
}
