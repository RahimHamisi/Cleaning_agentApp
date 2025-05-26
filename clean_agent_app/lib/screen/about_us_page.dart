import 'package:clean_agent_app/screen/company_registered.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us Page", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF6B4A),
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

    );
  }
}
