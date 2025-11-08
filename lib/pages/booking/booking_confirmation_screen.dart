import 'package:flutter/material.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
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
                  //header
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
                                const Color.fromARGB(0, 249, 247, 247)
                                    .withOpacity(0.2),
                                const Color.fromARGB(0, 249, 247, 247)
                                    .withOpacity(0.5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              left: 25, bottom: 20, right: 20),
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
                            icon:
                                const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // card
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.55,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        padding:
                            const EdgeInsets.only(left: 14, right: 14),
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
                            Text(
                              'Booking Confirmed',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 25),
                            Image(
                              image: AssetImage('assets/animations/success.gif'),
                              height: 80,
                              width: 140,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 25),
                            Image(
                              image: AssetImage('assets/tanker.png'),
                              height: 80,
                              width: 140,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.grey,
                              height: 20,
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Track your Tanker Location',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
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