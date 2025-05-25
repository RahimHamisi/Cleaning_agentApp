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
                const SizedBox(height: 24),
                const Text("Recommended Cleaning Agents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ...recommendedAgents.map((agent) => _buildAgentCard(agent)).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))]),
        child: Column(
          children: [
            Icon(icon, color: Colors.orange, size: 28),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }



  Widget _buildAgentCard(CleaningAgent agent) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(agent.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("Location: ${agent.location}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
              Text("Rating: ⭐ ${agent.rating}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
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
