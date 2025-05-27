import 'package:flutter/material.dart';

import '../widget/sidebar.dart';

class CompanyRegistered extends StatefulWidget {
  const CompanyRegistered({super.key});

  @override
  State<CompanyRegistered> createState() => _CompanyRegisteredState();
}

class _CompanyRegisteredState extends State<CompanyRegistered> {
  int currentPage = 1;
  int totalPages = 1;

  final List<Company> companies = [
    Company(id: 1, name: "COMPANY 1", location: "Dar es Salaam", price: "Tsh 100000", availableDate: "6/1/2025", isAvailable: true),
    Company(id: 2, name: "COMPANY 2", location: "Arusha", price: "Tsh 120000", availableDate: "6/5/2025", isAvailable: false),
    Company(id: 3, name: "COMPANY 3", location: "Dodoma", price: "Tsh 90000", availableDate: "6/10/2025", isAvailable: true),
    Company(id: 4, name: "COMPANY 4", location: "Mwanza", price: "Tsh 110000", availableDate: "6/15/2025", isAvailable: true),
    Company(id: 5, name: "COMPANY 5", location: "Mbeya", price: "Tsh 95000", availableDate: "6/20/2025", isAvailable: false),
    Company(id: 6, name: "COMPANY 6", location: "Morogoro", price: "Tsh 105000", availableDate: "6/25/2025", isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B4A),
        title: const Text("Company Registered", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
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
              children: [
                ...companies.map((company) => _buildCompanyCard(company, isMobile)).toList(),
                const SizedBox(height: 24),
                _buildPagination(), // Pagination centered after company cards.
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyCard(Company company, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/background_image.jpg', // Replace with actual image
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          const SizedBox(width: 16),
          // Company info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  company.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text("Off 12%", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 6),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(" (4.7)", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          // Price
          Text(
            company.price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: currentPage > 1 ? () {
              setState(() {
                currentPage--;
              });
            } : null,
            child: Text("Prev", style: TextStyle(color: currentPage > 1 ? Colors.grey[700] : Colors.grey[400], fontSize: 16)),
          ),
          const SizedBox(width: 24),
          Text("Page $currentPage of $totalPages", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          const SizedBox(width: 24),
          TextButton(
            onPressed: currentPage < totalPages ? () {
              setState(() {
                currentPage++;
              });
            } : null,
            child: Text("Next", style: TextStyle(color: currentPage < totalPages ? Colors.grey[700] : Colors.grey[400], fontSize: 16)),
          ),
        ],
      ),
    );
  }
}



// Company Model
class Company {
  final int id;
  final String name;
  final String location;
  final String price;
  final String availableDate;
  final bool isAvailable;

  Company({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.availableDate,
    required this.isAvailable,
  });
}