import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/app_header.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';

class HotOffersScreen extends StatelessWidget {
  const HotOffersScreen({super.key});

  final List<Map<String, dynamic>> allOffers = const [
    {
      'logo': 'assets/cards/Mastercard-logo.png',
      'title': 'MasterCard Discount',
      'discount': '15% OFF',
      'bgColor': Color(0xFFFFF3E0),
      'mainDescription': '15% discount with Mastercard',
      'secondaryDescription': 'Use Mastercard for your payments',
    },
    {
      'logo': 'assets/cards/visa-logo.png',
      'title': 'VISA Offer',
      'discount': '23% OFF',
      'bgColor': Color.fromARGB(255, 223, 227, 249),
      'mainDescription': '23% discount on all VISA payments',
      'secondaryDescription': 'Applicable on utility bills',
    },
    {
      'logo': 'assets/cards/hbl-logo.png',
      'title': 'HBL Payment Offer',
      'discount': '15% OFF',
      'bgColor': Color.fromARGB(255, 203, 230, 206),
      'mainDescription': '15% off with HBL Mobile Banking',
      'secondaryDescription': 'Valid for first 3 payments',
    },
    {
      'logo': 'assets/cards/tanker-booking-logo.jpg',
      'title': 'Tanker Booking Discount',
      'discount': '20% OFF',
      'bgColor': Color(0xFFE3F2FD),
      'mainDescription': '20% off your first tanker booking',
      'secondaryDescription': 'Limited-time offer',
    },
    {
      'logo': 'assets/cards/jazzcash-logo.png',
      'title': 'JazzCash Cashback',
      'discount': '10% Cashback',
      'bgColor': Color.fromARGB(255, 243, 240, 146),
      'mainDescription': 'Get 10% cashback on bill payment',
      'secondaryDescription': 'Available for new users',
    },
    {
      'logo': 'assets/cards/easypaisa-logo.png',
      'title': 'EasyPaisa Offer',
      'discount': 'Free Waiver',
      'bgColor': Color.fromARGB(255, 169, 253, 200),
      'mainDescription': 'Enjoy free late fee waiver',
      'secondaryDescription': 'Only via Easypaisa payments',
    },
  ];

  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      width: 320,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: offer['bgColor'],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  offer['logo'],
                  height: 35,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 6),
                Text(
                  offer['discount'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer['mainDescription'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    offer['secondaryDescription'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
                                    'Hot Offers',
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
                            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // discounts
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          ...allOffers.map((offer) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(child: _buildOfferCard(offer)),
                            );
                          }).toList(),
                          const SizedBox(height: 20),
                        ],
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