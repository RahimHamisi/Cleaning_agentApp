import 'package:clean_agent_app/widget/sidebar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu, color: Colors.black87, size: 28),
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const SideBar(),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3), // Dark overlay for better text readability
          ),

          // Main Content
          Positioned(
            left: 80,
            top: 150,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Heading
                  Text(
                    "BOOK CLEANING SERVICES",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: 30),

                  // Description Text
                  Container(
                    width: 500,
                    child: Text(
                      "A clean and simple interface to organize your favourite websites. Open a new browser tab and see your sites load instantly. Try it for free.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  // Get Started Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle get started action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6B4A),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}