// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroductionScreen(
//         globalBackgroundColor: Colors.white,
//         pages: [
//           /// First Screen: Welcome Animation
//           PageViewModel(
//             title: "Welcome to Clean Agent",
//             body: "Find trusted cleaning professionals for your home or business.",
//             image: buildImage("assets/images/cleaning_intro1.png"),
//             decoration: pageDecoration(),
//           ),
//
//           /// Second Screen: Service Explanation
//           PageViewModel(
//             title: "Easy Booking Process",
//             body: "Choose from registered cleaning companies and schedule a service instantly.",
//             image: buildImage("assets/images/cleaning_intro2.png"),
//             decoration: pageDecoration(),
//           ),
//
//           /// Third Screen: Get Started Page
//           PageViewModel(
//             title: "Get Started",
//             body: "A clean and simple interface to organize your favorite websites.\nTry it for free!",
//             image: buildImage("assets/images/cleaning_intro3.png"),
//             footer: ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, "/home");
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 backgroundColor: Colors.deepOrange,
//               ),
//               child: const Text(
//                 "Start Now",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//             decoration: pageDecoration(),
//           ),
//         ],
//         onDone: () => Navigator.pushReplacementNamed(context, "/home"),
//         showSkipButton: true,
//         skip: const Text("Skip"),
//         next: const Icon(Icons.arrow_forward),
//         done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
//         dotsDecorator: const DotsDecorator(
//           size: Size(10.0, 10.0),
//           activeSize: Size(22.0, 10.0),
//           activeColor: Colors.deepOrange,
//           color: Colors.black26,
//           spacing: EdgeInsets.symmetric(horizontal: 3.0),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
//         ),
//       ),
//     );
//   }
//
//   /// Helper method to load images
//   Widget buildImage(String path) => Center(child: Image.asset(path, width: 350));
//
//   /// Page styling decoration
//   PageDecoration pageDecoration() {
//     return const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       bodyTextStyle: TextStyle(fontSize: 16),
//       imagePadding: EdgeInsets.all(24),
//     );
//   }
// }
