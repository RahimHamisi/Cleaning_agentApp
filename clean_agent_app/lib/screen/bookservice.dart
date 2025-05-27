import 'package:clean_agent_app/screen/homepage.dart';
import 'package:clean_agent_app/screen/user_dashboard.dart';
import 'package:flutter/material.dart';

class BookingServicePage extends StatefulWidget {
  const BookingServicePage({super.key});

  @override
  State<BookingServicePage> createState() => _BookingServicePageState();
}

class _BookingServicePageState extends State<BookingServicePage> {
  final _formKey = GlobalKey<FormState>();

  String selectedService = "Deep Cleaning";
  String selectedAgent = "Agent A";
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Book a Service", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF6B4A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const UserDashboard())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            shadowColor: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Select Service Type"),
                      _buildDropdown(["Deep Cleaning", "Carpet Cleaning", "General Cleaning"], selectedService, (value) {
                        setState(() {
                          selectedService = value!;
                        });
                      }),
                      const SizedBox(height: 16),

                      _buildDateTimePicker(),
                      const SizedBox(height: 16),

                      _buildSectionTitle("Select Cleaning Agent"),
                      _buildDropdown(["Agent A", "Agent B", "Agent C"], selectedAgent, (value) {
                        setState(() {
                          selectedAgent = value!;
                        });
                      }),
                      const SizedBox(height: 16),

                      _buildSectionTitle("Enter Your Details"),
                      _buildTextField("Address", addressController),
                      const SizedBox(height: 12),
                      _buildTextField("Contact Number", contactController),
                      const SizedBox(height: 24),

                      _buildBookButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDropdown(List<String> items, String selectedItem, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildDateTimePicker() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pick Date & Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 12),

            _buildStyledButton(
              label: selectedDate == null ? "Choose Date" : "${selectedDate!.toLocal()}".split(' ')[0],
              icon: Icons.calendar_today,
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            _buildStyledButton(
              label: selectedTime == null ? "Choose Time" : selectedTime!.format(context),
              icon: Icons.access_time,
              onPressed: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({required String label, required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: (value) => value == null || value.isEmpty ? "This field is required" : null,
    );
  }

  Widget _buildBookButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Booking Confirmed!")));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text("Confirm Booking", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
