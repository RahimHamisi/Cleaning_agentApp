import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 24 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              company.name,
              style: TextStyle(fontSize: isMobile ? 20 : 22, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _buildInfoRow("Location:", company.location),
            _buildInfoRow("Price:", company.price),
            _buildInfoRow("Available Date:", company.availableDate),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[400]!),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("View Image", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: ElevatedButton(
                    onPressed: company.isAvailable ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: company.isAvailable ? Colors.blue[600] : Colors.grey[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: company.isAvailable ? 3 : 0,
                    ),
                    child: Text(company.isAvailable ? "Book" : "Unavailable", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
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

// Sidebar with navigation items
class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(radius: 40, backgroundColor: Colors.grey[300], child: const Icon(Icons.person, size: 40, color: Colors.black54)),
          const SizedBox(height: 20),
          _buildDrawerItem(Icons.dashboard, "Dashboard", () {}),
          _buildDrawerItem(Icons.cleaning_services, "Book Service", () {}),
          _buildDrawerItem(Icons.person_outline, "Cleaning Agents", () {}),
          _buildDrawerItem(Icons.settings, "Settings", () {}),
          _buildDrawerItem(Icons.info_outline, "About", () {}),
          _buildDrawerItem(Icons.contact_page, "Contact Us", () {}),
          const Spacer(),
          _buildDrawerItem(Icons.logout, "Logout", () {}),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
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