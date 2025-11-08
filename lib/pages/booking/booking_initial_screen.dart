import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';
import 'package:water_board_app/pages/booking/booking_loading_screen.dart';
import 'package:water_board_app/pages/home/hot_offers_screen.dart';

class BookingInitialScreen extends StatefulWidget {
  const BookingInitialScreen({super.key});

  @override
  State<BookingInitialScreen> createState() => _BookingInitialScreenState();
}

class _BookingInitialScreenState extends State<BookingInitialScreen> {
  final List<Map<String, dynamic>> hotOffers = [
    {
      'logo': 'assets/cards/Mastercard-logo.png',
      'discount': '15% OFF',
      'bgColor': Colors.orange[50],
      'mainDescription': '15% discount with mastercard',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/visa-logo.png',
      'discount': '23% OFF',
      'bgColor': const Color.fromARGB(255, 223, 227, 249),
      'mainDescription': '23% discount with VISA',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/hbl-logo.png',
      'discount': '15% off',
      'bgColor': const Color.fromARGB(255, 203, 230, 206),
      'mainDescription': '15% discount with HBL Payment',
      'secondaryDescription': 'with mobile banking',
    },
    {
      'logo': 'assets/cards/tanker-booking-logo.jpg',
      'discount': '20% off',
      'bgColor': const Color(0xFFE3F2FD),
      'mainDescription': '20% off Tanker Booking Discount',
      'secondaryDescription': 'first booking',
    },
  ];

  bool _isBookHovered = false;
  bool _isViewHovered = false;

  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      width: 240,
      height: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
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
                Image.asset(offer['logo'], height: 30, fit: BoxFit.contain),
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
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
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
                            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 18),

                          // card
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(horizontal: 25),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 0.2, color: Colors.black.withOpacity(0.3)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/tanker.png',
                                      width: 250,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '1000 Liter',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.black87,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Starts From ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            const Text(
                                              'Rs 2000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),

                              // button
                              Positioned(
                                bottom: -25,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: MouseRegion(
                                    onEnter: (_) => setState(() => _isBookHovered = true),
                                    onExit: (_) => setState(() => _isBookHovered = false),
                                    child: SizedBox(
                                      width: 240,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const BookingLoadingScreen(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _isBookHovered
                                              ? const Color.fromARGB(255, 100, 150, 102)
                                              : const Color.fromARGB(255, 129, 183, 131),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                          elevation: 3,
                                        ),
                                        child: const Text(
                                          'Book Your Tanker',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 38), 

                          // button
                          Center(
                            child: MouseRegion(
                              onEnter: (_) => setState(() => _isViewHovered = true),
                              onExit: (_) => setState(() => _isViewHovered = false),
                              child: SizedBox(
                                width: 240,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isViewHovered
                                        ? const Color.fromARGB(255, 200, 201, 200)
                                        : const Color.fromARGB(255, 226, 227, 226),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'View Previous Bookings',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // offers
                          const Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                const Text(
                                  'Hot offer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const HotOffersScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(color: AppColors.redAccent, fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: Row(
                              children: [
                                ...hotOffers.map(_buildOfferCard).toList(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const HotOffersScreen()),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    margin: const EdgeInsets.only(right: 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/home/see_more.png', width: 40, height: 40),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'See More',
                                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

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