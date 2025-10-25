import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; 
import 'package:water_board_app/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Your timer logic for navigation after 3 seconds
    // Note: When you integrate an API call, replace this Timer logic with logic 
    // that navigates once the API response is complete.
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login()
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // We will use a regular Scaffold with a Stack for the background effect,
    // as AnimatedSplashScreen is better suited for simpler logo transitions.
    // The Lottie animation handles the "animation" part.

    return Scaffold(
      // Set background color to match the primary water color for a seamless look
      backgroundColor: Colors.blue.shade100, 
      body: Stack(
        children: [
          // 1. Lottie Animated Background (Full Screen)
          // Make sure to replace 'assets/water_waves.json' with the actual path to your downloaded Lottie file.
          LottieBuilder.asset(
            'assets/animations/water_waves_2.json', 
            fit: BoxFit.cover, // Ensures the animation covers the entire screen
            repeat: true, // Keep the animation looping
            animate: true,
            width: double.infinity,
            height: double.infinity,
          ),

          // Optional: Add a subtle overlay to help the text stand out over the busy background
          Container(
            color: Colors.white.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

          // 2. Main Splash Screen Content (Logo and Text)
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center( // Center the content vertically and horizontally
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white.withOpacity(0.8), // Semi-transparent white background for contrast
                    child: Image.asset(
                      'assets/logo.png',
                      // Removed height/width which were too large, let CircleAvatar handle sizing
                      fit: BoxFit.contain, 
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    'KARACHI WATER & SEWERAGE CORPORATION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0D47A1), // Deep Blue color for the text
                      shadows: [
                        Shadow( // Subtle shadow for better legibility over the background
                          blurRadius: 4.0,
                          color: Colors.black26,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // Push logo/text up slightly
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}