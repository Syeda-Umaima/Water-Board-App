//  home_screen.dart
import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/app_header.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import 'package:water_board_app/pages/notifications/notification_screen.dart';
import 'package:water_board_app/pages/booking/booking_initial_screen.dart';
import 'package:water_board_app/pages/home/hot_offers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> services = [
    {
      'image': 'assets/home/1.png',
      'title': 'Tanker Booking',
      'screen': (BuildContext context) => const BookingInitialScreen(),
    },
    {
      'image': 'assets/home/3.png',
      'title': 'Bills Payment &\nDuplicate Bill',
      'screen': (BuildContext context) => const HomeScreen(),
    },
    {
      'image': 'assets/home/5.png',
      'title': 'FAQs / Feedback',
      'screen': (BuildContext context) => const HomeScreen(),
    },
    {
      'image': 'assets/home/2.png',
      'title': 'Report a Complaint',
      'screen': (BuildContext context) => const HomeScreen(),
    },
    {
      'image': 'assets/home/4.png',
      'title': 'New Connection',
      'screen': (BuildContext context) => const HomeScreen(),
    },
    {
      'image': 'assets/home/6.png',
      'title': 'ChatBot',
      'screen': (BuildContext context) => const HomeScreen(),
    },
  ];

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

  Widget _buildServiceItem(String image, String title, WidgetBuilder screenBuilder) {
    return Column(
      children: [
        Image.asset(image, height: 38, width: 48, fit: BoxFit.contain),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: screenBuilder)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceColumn(List<Map<String, dynamic>> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(list.length, (i) {
        final item = list[i];
        return Column(
          children: [
            _buildServiceItem(item['image']!, item['title']!, item['screen']),
            if (i < list.length - 1) const SizedBox(height: 2),
          ],
        );
      }),
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      width: 240,
      height: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6, offset: const Offset(2, 3)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            decoration: BoxDecoration(
              color: offer['bgColor'],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(offer['logo'], height: 30, fit: BoxFit.contain),
                const SizedBox(height: 6),
                Text(
                  offer['discount'],
                  style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
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
                    style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
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
    final double contentHeight = screenHeight * 0.95 - headerHeight;

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
                                    'Welcome',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                                  ),
                                  Text(
                                    'Syeda Umaima',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
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

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Our Services',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.2, color: Colors.black.withOpacity(0.3)),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5)),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildServiceColumn(services.sublist(0, 3)),
                                _buildServiceColumn(services.sublist(3, 6)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          // offers
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                const Text(
                                  'Hot offer',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const HotOffersScreen()),
                                  ),
                                  child: const Text(
                                    'See all',
                                    style: TextStyle(color: AppColors.redAccent, fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: Row(
                              children: [
                                ...hotOffers.map(_buildOfferCard).toList(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const HotOffersScreen()),
                                  ),
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
                          const SizedBox(height: 12),
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