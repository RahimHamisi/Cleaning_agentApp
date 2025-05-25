import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false; // Default Light Mode
  bool notificationsEnabled = true; // Default notifications ON

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Fix Overflow Issue
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Preferences", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildPreferenceOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceOptions() {
    return Column(
      children: [
        _buildSwitchOption("Dark Mode", isDarkMode, (value) {
          setState(() {
            isDarkMode = value;
          });
        }),
        _buildSwitchOption("Enable Notifications", notificationsEnabled, (value) {
          setState(() {
            notificationsEnabled = value;
          });
        }),
      ],
    );
  }

  Widget _buildSwitchOption(String title, bool value, Function(bool) onChanged) {
    return Container(
      width: double.infinity, // Prevents right-side overflow
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))), // Prevents text clipping
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }


}
