import 'package:flutter/material.dart';
import 'package:water_board_app/Hot_offers.dart';
import 'Tanker/booking_1.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final List<Map<String, dynamic>> services = [ 
    {'image': 'assets/home/1.png', 'title': 'Tanker Booking', 'screen': (BuildContext context) => BookingScreen_one()}, 
    {'image': 'assets/home/3.png', 'title': 'Bills Payment &\nDuplicate Bill', 'screen': (BuildContext context) => HomeScreen()},
    {'image': 'assets/home/5.png', 'title': 'FAQs / Feedback', 'screen': (BuildContext context) => HomeScreen()}, 
    {'image': 'assets/home/2.png', 'title': 'Report a Complaint', 'screen': (BuildContext context) => HomeScreen()}, 
    {'image': 'assets/home/4.png', 'title': 'New Connection', 'screen': (BuildContext context) => HomeScreen()}, 
    {'image': 'assets/home/6.png', 'title': 'ChatBot', 'screen': (BuildContext context) => HomeScreen()}, 
  ];

  final List<Map<String, dynamic>> hotOffers = [
    {
      'logo': 'assets/cards/Mastercard-logo.png',
      'title': 'MasterCard Discount',
      'discount': '15% OFF',
      // 'boxColor': Colors.orange,
      'bgColor': Colors.orange[50],
      'mainDescription': '15% discount with mastercard',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/visa-logo.png',
      'title': 'VISA Offer',
      'discount': '23% OFF',
      // 'boxColor': Colors.amber,
      'bgColor':  Color.fromARGB(255, 223, 227, 249),
      'mainDescription': '23% discount with VISA',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/hbl-logo.png',
      'title': 'HBL Payment Offer',
      'discount': '15% off',
      // 'boxColor': Colors.green,
      'bgColor': Color.fromARGB(255, 203, 230, 206),
      'mainDescription': '15% discount with HBL Payment',
      'secondaryDescription': 'with mobile banking',
    },
    {
      'logo': 'assets/cards/tanker-booking-logo.jpg',
      'title': 'Tanker Booking Discount',
      'discount': '20% off',
      // 'boxColor': Colors.blue,
      'bgColor': Color(0xFFE3F2FD),
      'mainDescription': '20% off Tanker Booking Discount',
      'secondaryDescription': 'first booking',
    },
  ];

  // Method to build single service item
  Widget _buildServiceItem(String image, String title, WidgetBuilder screenBuilder) {
    return Column(
      children: [
        Image.asset(image, height: 40, width: 50, fit: BoxFit.cover),
        // const SizedBox(height: 2),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: screenBuilder,
              ),
            );
          },
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }

  // Helper method to build a column of services with spacing between items
  Widget _buildServiceColumn(List<Map<String, dynamic>> serviceList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(serviceList.length, (index) {
        return Column(
          children: [
            _buildServiceItem(
              serviceList[index]['image']!,
              serviceList[index]['title']!,
              serviceList[index]['screen'],
            ),
            if (index < serviceList.length - 1) const SizedBox(height: 4),
          ],
        );
      }),
    );
  }

  // Helper method to build a single hot offer card
  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      width: 240,
      height: 100,
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
          // Left side
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
              crossAxisAlignment: CrossAxisAlignment.center,
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

          // Right side - Text descriptions on white background
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main description
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
                  // Secondary description
                  Text(
                    offer['secondaryDescription'],
                    style: TextStyle(
                      color: Colors.grey[500],
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
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color.fromARGB(0,249,247,247).withOpacity(0.2),
                          const Color.fromARGB(0,249,247,247,).withOpacity(0.5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      bottom: 20,
                      right: 20,
                    ),
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Notifications: 2 new alerts'),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 15,
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Our Services',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(left: 14, right: 14),
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
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildServiceColumn(
                        services.sublist(0, 3),
                      ), // Left column services
                      _buildServiceColumn(
                        services.sublist(3, 6),
                      ), // Right column services
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                        MaterialPageRoute(
                          builder: (context) => HotOffersScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color.fromARGB(255, 233, 42, 28),
                        fontWeight: FontWeight.w300,
                      ),
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
                  ...hotOffers.map((offer) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _buildOfferCard(offer),
                    );
                  }).toList(),
                  // See More
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HotOffersScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotOffersScreen(),
                        ),
                      );
                                            },
                                  child: Image.asset('assets/home/see_more.png',
                                  width: 40,
                                  height: 40,), 
              ),
                            SizedBox(height: 4),
                            Text(
                              'See More',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
