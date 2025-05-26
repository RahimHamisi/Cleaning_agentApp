import 'package:clean_agent_app/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "Welcome to Clean Agent",
            body: "Find trusted cleaning professionals for your home or business.",
            image: buildImage("assets/images/background_image.jpg"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Easy Booking Process",
            body: "Choose from registered cleaning companies and schedule a service instantly.",
            image: buildImage("assets/images/background_image.jpg"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Get Started",
            body: "A clean and simple way to organize your bookings. Try it now!",
            image: buildImage("assets/images/background_image.jpg"),
            footer: _buildStartButton(context),
            decoration: pageDecoration(),
          ),
        ],
        onDone: () => _goToHome(context),
        showSkipButton: true,
        skip: _buildTextButton("Skip"),
        next: const Icon(Icons.arrow_forward, color: Colors.deepOrange),
        done: _buildTextButton("Done"),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
    );
  }

  /// Helper method to load images dynamically
  Widget buildImage(String path) => Center(child: Image.asset(path, width: 300, fit: BoxFit.contain));

  /// Start Button with refined UI
  Widget _buildStartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _goToHome(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Start Now", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  /// Styled Text Button for Skip and Done
  Widget _buildTextButton(String text) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrange));
  }

  /// Page styling decoration
  PageDecoration pageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 16, color: Colors.black87),
      imagePadding: EdgeInsets.all(20),
      pageColor: Colors.white,
    );
  }

  /// Navigate to the Home Screen
  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }
}
