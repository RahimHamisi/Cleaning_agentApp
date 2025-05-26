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
      appBar: AppBar(
        title: const Text("Book a Service", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFormFields(), // All form fields

                const SizedBox(height: 24), // Proper spacing

                _buildBookButton(), // Button appears right after the form fields
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDropdown("Service Type", ["Deep Cleaning", "Carpet Cleaning", "General Cleaning"], selectedService, (value) {
          setState(() {
            selectedService = value!;
          });
        }),
        const SizedBox(height: 12),
        _buildDatePicker(),
        const SizedBox(height: 12),
        _buildTimePicker(),
        const SizedBox(height: 12),
        _buildDropdown("Select Agent", ["Agent A", "Agent B", "Agent C"], selectedAgent, (value) {
          setState(() {
            selectedAgent = value!;
          });
        }),
        const SizedBox(height: 12),
        _buildTextField("Address", addressController),
        const SizedBox(height: 12),
        _buildTextField("Contact Number", contactController),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedItem,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        ElevatedButton.icon(
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
          icon: const Icon(Icons.calendar_today),
          label: Text(selectedDate == null ? "Choose Date" : "${selectedDate!.toLocal()}".split(' ')[0]),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        ElevatedButton.icon(
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
          icon: const Icon(Icons.access_time),
          label: Text(selectedTime == null ? "Choose Time" : selectedTime!.format(context)),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          validator: (value) => value == null || value.isEmpty ? "This field is required" : null,
        ),
      ],
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
