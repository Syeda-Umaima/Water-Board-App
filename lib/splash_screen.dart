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
    // Will later replace this Timer logic with API call logic 
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 106, 159, 203), 
      body: Stack(
        children: [

          LottieBuilder.asset(
            'assets/animations/water_waves_2.json', 
            fit: BoxFit.cover, 
            repeat: true, 
            animate: true,
            width: double.infinity,
            height: double.infinity,
          ),

          // Subtle overlay to help the text stand out over the busy background
          Container(
            color: Colors.white.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white.withOpacity(0.0), 
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain, 
                    ),
                  ),

                  const SizedBox(height: 05),
                  const Text(
                    'KARACHI WATER & SEWERAGE CORPORATION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow( // Subtle shadow for better legibility over the background
                          blurRadius: 4.0,
                          color: Colors.black26,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), 
                ],
              ),
            
          ),
        ],
      ),
    );
  }
}