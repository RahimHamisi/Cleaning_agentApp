import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final List<CleaningAgent> recommendedAgents = [
    CleaningAgent(name: "Agent 1", rating: 4.8, location: "Dar es Salaam"),
    CleaningAgent(name: "Agent 2", rating: 4.5, location: "Arusha"),
    CleaningAgent(name: "Agent 3", rating: 4.7, location: "Dodoma"),
    CleaningAgent(name: "Agent 1", rating: 4.8, location: "Dar es Salaam"),
    CleaningAgent(name: "Agent 2", rating: 4.5, location: "Arusha"),
    CleaningAgent(name: "Agent 3", rating: 4.7, location: "Dodoma"),
  ];

  final List<CategoryItem> cleaningCategories = [
    CategoryItem(name: "Home Cleaning", icon: Icons.home),
    CategoryItem(name: "Office Cleaning", icon: Icons.business),
    CategoryItem(name: "Car Wash", icon: Icons.directions_car),
    CategoryItem(name: "Laundry", icon: Icons.local_laundry_service),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B4A),
        title: const Text("User Dashboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryCards(),
              const SizedBox(height: 30),

              _buildSectionTitle("Cleaning Categories"),
              const SizedBox(height: 12),
              _buildCategoryList(),

              const SizedBox(height: 30),
              _buildSectionTitle("Recommended Cleaning Agents"),
              const SizedBox(height: 12),
              _buildAgentList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _buildSummaryCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSummaryCard("Total Bookings", "12", Icons.book_online),
        _buildSummaryCard("Pending Requests", "3", Icons.hourglass_empty),
        _buildSummaryCard("Completed Services", "9", Icons.check_circle_outline),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: Colors.orange, size: 28),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cleaningCategories.map((category) => _buildCategoryCard(category)).toList(),
      ),
    );
  }

  Widget _buildCategoryCard(CategoryItem category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 120,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(category.icon, color: Colors.orange, size: 28),
                const SizedBox(height: 6),
                Text(category.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAgentList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: recommendedAgents.map((agent) => _buildAgentCard(agent)).toList(),
      ),
    );
  }

  Widget _buildAgentCard(CleaningAgent agent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 140,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(Icons.person, color: Colors.orange, size: 40),
                const SizedBox(height: 8),
                Text(agent.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("⭐ ${agent.rating}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }
}

// Models
class CleaningAgent {
  final String name;
  final double rating;
  final String location;

  CleaningAgent({required this.name, required this.rating, required this.location});
}

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});
}
