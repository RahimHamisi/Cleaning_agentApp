import 'package:clean_agent_app/screen/bookinghistory.dart';
import 'package:clean_agent_app/screen/bookservice.dart';
import 'package:clean_agent_app/screen/company_registered.dart';
import 'package:clean_agent_app/screen/help_and_support_page.dart';
import 'package:clean_agent_app/screen/homepage.dart';
import 'package:clean_agent_app/screen/setting_page.dart';
import 'package:clean_agent_app/screen/user_dashboard.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView( // Fix Overflow Issue
        child: Column(
          children: [
            const SizedBox(height: 40),

            // User Profile Avatar & Edit Profile Button
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 40, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Text("Welcome, User!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {}, // Navigate to profile editing page
              icon: Icon(Icons.edit, size: 16, color: Colors.orangeAccent),
              label: const Text("Edit Profile", style: TextStyle(color: Colors.orangeAccent, fontSize: 14)),
            ),
            const Divider(thickness: 1, color: Colors.grey),

            const SizedBox(height: 12),

            // Sidebar Items
            _buildDrawerItem(Icons.dashboard, "Dashboard", Colors.blueAccent, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const UserDashboard() ));
            }),
            _buildDrawerItem(Icons.cleaning_services, "Book Service", Colors.green, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const BookingServicePage() ));
            }),
            _buildDrawerItem(Icons.person_outline, "Cleaning Agents", Colors.deepOrange, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const CompanyRegistered() ));
            }),
            _buildDrawerItem(Icons.history, "Booking History", Colors.purple, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const BookingHistoryPage() ));
            }), // NEW!
            _buildDrawerItem(Icons.settings, "Settings", Colors.grey, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const SettingsPage() ));
            }),
            _buildDrawerItem(Icons.support_agent, "Help & Support", Colors.blueGrey, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const HelpSupportPage() ));
            }), // NEW!
            _buildDrawerItem(Icons.info_outline, "About", Colors.teal, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Homepage() ));
            }),
            _buildDrawerItem(Icons.contact_page, "Contact Us", Colors.indigo, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const SettingsPage() ));
            }),

            const SizedBox(height: 24),

            // Logout Button (Ensures Proper Spacing)
            _buildDrawerItem(Icons.logout, "Logout", Colors.redAccent, () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Color iconColor, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
