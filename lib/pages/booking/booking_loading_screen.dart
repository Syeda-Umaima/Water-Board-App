import 'dart:async';
import 'package:flutter/material.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';
import 'package:water_board_app/pages/booking/booking_details_screen.dart';

class BookingLoadingScreen extends StatefulWidget {
  const BookingLoadingScreen({super.key});

  @override
  State<BookingLoadingScreen> createState() => _BookingLoadingScreenState();
}

class _BookingLoadingScreenState extends State<BookingLoadingScreen> {
  @override
  void initState() {
  super.initState();
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BookingDetailsScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double headerHeight = 140;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(backgroundColor: Colors.white),

      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.95,
              child: Column(
                children: [
                  // header
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: headerHeight,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/background.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                const Color.fromARGB(0, 249, 247, 247).withOpacity(0.2),
                                const Color.fromARGB(0, 249, 247, 247).withOpacity(0.5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.only(left: 25, bottom: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tanker Booking',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    'Syeda Umaima',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                 onPressed: () => NotificationScreen.show(context),
                                icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 32),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Menu 
                      Positioned(
                        top: 25,
                        left: 15,
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Expanded(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.45,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 0.2,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/animations/loading.gif'),
                              height: 130,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 70),
                            Text(
                              'Fetching data from NADRA',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}