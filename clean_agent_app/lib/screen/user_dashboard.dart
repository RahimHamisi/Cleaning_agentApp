import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int currentPage = 1;
  int totalPages = 1;

  final List<CleaningAgent> recommendedAgents = [
    CleaningAgent(name: "Agent 1", rating: 4.8, location: "Dar es Salaam"),
    CleaningAgent(name: "Agent 2", rating: 4.5, location: "Arusha"),
    CleaningAgent(name: "Agent 3", rating: 4.7, location: "Dodoma"),
    CleaningAgent(name: "Agent 1", rating: 4.8, location: "Dar es Salaam"),
    CleaningAgent(name: "Agent 2", rating: 4.5, location: "Arusha"),
    CleaningAgent(name: "Agent 3", rating: 4.7, location: "Dodoma"),
    CleaningAgent(name: "Agent 1", rating: 4.8, location: "Dar es Salaam"),
    CleaningAgent(name: "Agent 2", rating: 4.5, location: "Arusha"),
    CleaningAgent(name: "Agent 3", rating: 4.7, location: "Dodoma"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B4A),
        title: const Text("User Dashboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black87, size: 28),
            );
          },
        ),
      ),
      drawer: const SideBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // User Avatar & Welcome Message
                Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Colors.grey[300], child: const Icon(Icons.person, size: 40, color: Colors.black54)),
                    const SizedBox(width: 12),
                    const Text("Welcome Back!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSummaryCard("Total Bookings", "12", Icons.book_online),
                    _buildSummaryCard("Pending Requests", "3", Icons.hourglass_empty),
                    _buildSummaryCard("Completed Services", "9", Icons.check_circle_outline),
                  ],
                ),
                const SizedBox(height: 50),
                const Text("Recommended Cleaning Agents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: recommendedAgents.map((agent) => _buildAgentCard(agent)).toList(),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return SizedBox(
      width: 120, // Adjusted for better responsiveness
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.orange, size: 24), // Smaller icon for better fit
              const SizedBox(height: 6),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgentCard(CleaningAgent agent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: 120, // Fixed width for square-like shape
        height: 140, // Controls height
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          shadowColor: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: Colors.orange, size: 32),
                const SizedBox(height: 6),
                Text(agent.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 4),
                Text("⭐ ${agent.rating}", style: const TextStyle(fontSize: 12, color: Colors.grey), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Cleaning Agent Model
class CleaningAgent {
  final String name;
  final double rating;
  final String location;

  CleaningAgent({required this.name, required this.rating, required this.location});
}
