import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "Janeth Doe");
  TextEditingController emailController = TextEditingController(text: "janeth@example.com");
  TextEditingController phoneController = TextEditingController(text: "+255 712 345 678");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileImagePicker(),
                const SizedBox(height: 12),
                _buildTextField("Name", nameController),
                _buildTextField("Email", emailController),
                _buildTextField("Phone", phoneController),
                const SizedBox(height: 24),
                _buildSaveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImagePicker() {
    return Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage("assets/images/background_image.jpg"), // Replace with actual profile image
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          validator: (value) => value == null || value.isEmpty ? "This field is required" : null,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Updated!")));
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(vertical: 12)),
        child: const Text("Save Changes", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
