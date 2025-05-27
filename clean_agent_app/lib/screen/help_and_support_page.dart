import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home'); // Ensure '/home' is defined in routes
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Frequently Asked Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildFAQ("How can I book a service?", "Go to the booking page and select your preferred service, date, and time."),
            _buildFAQ("Can I change my booking details?", "Yes, you can modify bookings from the booking history page."),
            _buildFAQ("How do I contact customer support?", "You can reach us at support@example.com or call +255 712 345 678."),
            const SizedBox(height: 24),
            _buildContactSupportButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQ(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(answer, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildContactSupportButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: const EdgeInsets.symmetric(vertical: 12)),
        child: const Text("Contact Support", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
