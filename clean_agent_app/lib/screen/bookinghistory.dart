import 'package:flutter/material.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  final List<Booking> bookings = [
    Booking(agent: "Agent A", date: "May 10, 2025", location: "Dar es Salaam", status: "Completed"),
    Booking(agent: "Agent B", date: "May 15, 2025", location: "Arusha", status: "Pending"),
    Booking(agent: "Agent C", date: "May 20, 2025", location: "Dodoma", status: "Canceled"),
  ];

  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking History", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFilterRow(),

              const SizedBox(height: 12), // Space between AppBar and first card

              Expanded( // Prevents overflow by making the list fit dynamically
                child: SingleChildScrollView(
                  child: _buildBookingList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Booking History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.filter_list, size: 28, color: Colors.black87),
          onPressed: () => _showFilterDialog(),
        ),
      ],
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Filter By:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildFilterOption("All"),
            _buildFilterOption("Completed"),
            _buildFilterOption("Pending"),
            _buildFilterOption("Canceled"),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String status) {
    return Flexible(
      child: ListTile(
        title: Text(status, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: selectedFilter == status ? const Icon(Icons.check, color: Colors.green) : null,
        onTap: () {
          setState(() {
            selectedFilter = status;
          });
          Navigator.pop(context); // Close modal after selection
        },
      ),
    );
  }

  Widget _buildBookingList() {
    List<Booking> filteredBookings = selectedFilter == "All"
        ? bookings
        : bookings.where((b) => b.status == selectedFilter).toList();

    if (filteredBookings.isEmpty) {
      return const Center(child: Text("No bookings found.", style: TextStyle(fontSize: 16, color: Colors.grey)));
    }

    return Column(
      children: filteredBookings.map((booking) => _buildBookingCard(booking)).toList(),
    );
  }

  Widget _buildBookingCard(Booking booking) {
    return Container(
      width: double.infinity, // Ensures uniform card dimensions
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(booking.agent, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text("Location: ${booking.location}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text("Date: ${booking.date}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text("Status: ${booking.status}", style: TextStyle(fontSize: 14, color: _getStatusColor(booking.status))),

          const SizedBox(height: 10),

          if (booking.status == "Pending") _buildActionButtons(),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
      case "Pending": // Matches Completed Styling
        return Colors.green;
      case "Canceled":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton("Reschedule", Icons.schedule, Colors.blue),
        _buildActionButton("Cancel", Icons.cancel, Colors.red),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: Colors.white),
      label: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}

class Booking {
  final String agent;
  final String date;
  final String location;
  final String status;

  Booking({required this.agent, required this.date, required this.location, required this.status});
}
