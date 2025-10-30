import 'package:flutter/material.dart';
import 'package:water_board_app/Hot_offers.dart';

class BookingScreen_one extends StatefulWidget {
  const BookingScreen_one({super.key});

  @override
  State<BookingScreen_one> createState() => _BookingScreen_oneState();
}

class _BookingScreen_oneState extends State<BookingScreen_one> {
  final List<Map<String, String>> services = [
    {'image': 'assets/home/1.png', 'title': 'Tanker Booking'},
    {'image': 'assets/home/3.png', 'title': 'Bills Payment &\nDuplicate Bill'},
    {'image': 'assets/home/5.png', 'title': 'FAQs / Feedback'},
    {'image': 'assets/home/2.jpg', 'title': 'Report a Complaint'},
    {'image': 'assets/home/4.png', 'title': 'New Connection'},
    {'image': 'assets/home/6.png', 'title': 'ChatBot'},
  ];

  final List<Map<String, dynamic>> hotOffers = [
    {
      'logo': 'assets/cards/Mastercard-logo.png',
      'title': 'MasterCard Discount',
      'discount': '15% OFF',
      'bgColor': Colors.orange[50],
      'mainDescription': '15% discount with mastercard',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/visa-logo.png',
      'title': 'VISA Offer',
      'discount': '23% OFF',
      'bgColor': Color.fromARGB(255, 223, 227, 249),
      'mainDescription': '23% discount with VISA',
      'secondaryDescription': 'Lorem ipsum dolor sit am etet adip',
    },
    {
      'logo': 'assets/cards/hbl-logo.png',
      'title': 'HBL Payment Offer',
      'discount': '15% off',
      'bgColor': Color.fromARGB(255, 203, 230, 206),
      'mainDescription': '15% discount with HBL Payment',
      'secondaryDescription': 'with mobile banking',
    },
    {
      'logo': 'assets/cards/tanker-booking-logo.jpg',
      'title': 'Tanker Booking Discount',
      'discount': '20% off',
      'bgColor': Color(0xFFE3F2FD),
      'mainDescription': '20% off Tanker Booking Discount',
      'secondaryDescription': 'first booking',
    },
  ];

  // ADDED: Hover states for buttons
  bool _isBookHovered = false;
  bool _isViewHovered = false;

  // Method to build single service item
  Widget _buildServiceItem(String image, String title) {
    return Column(
      children: [
        Image.asset(image, height: 40, width: 50, fit: BoxFit.cover),
        TextButton(
          onPressed: () {},
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
  Widget _buildServiceColumn(List<Map<String, String>> serviceList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(serviceList.length, (index) {
        return Column(
          children: [
            _buildServiceItem(
              serviceList[index]['image']!,
              serviceList[index]['title']!,
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
          Expanded(
            child: Container(
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

            Stack(
              clipBehavior: Clip.none, 
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/tanker.png',
                        width: 250,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1000 Liter',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Starts From  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
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
                      const SizedBox(height: 35), // ADDED: Space for half-overlapping button
                    ],
                  ),
                ),
                
                Positioned(
                  bottom: -25, // Position to overlap container
                  left: 0,
                  right: 0,
                  child: Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isBookHovered = true),
                      onExit: (_) => setState(() => _isBookHovered = false),
                      child: SizedBox(
                        width: 240, // ADDED: Fixed width for button
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            // Color changes on hover
                            backgroundColor: _isBookHovered
                                ? Color.fromARGB(255, 100, 150, 102)
                                : Color.fromARGB(255, 129, 183, 131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            elevation: 3,
                          ),
                          child: Text(
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
            
            // MODIFIED: Spacing for the overlapping button
            const SizedBox(height: 30),
            
            // MODIFIED: View Previous Bookings button with hover effect
            Center(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isViewHovered = true),
                onExit: (_) => setState(() => _isViewHovered = false),
                child: SizedBox(
                  width: 240, // ADDED: Same fixed width as first button
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // MODIFIED: Color changes on hover
                      backgroundColor: _isViewHovered
                          ? Color.fromARGB(255, 200, 201, 200)
                          : Color.fromARGB(255, 226, 227, 226),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // MODIFIED: Same padding as first button
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      elevation: 2,
                    ),
                    child: Text(
                      'View Previous Bookings',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15, // MODIFIED: Same font size as first button
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, // ADDED: Prevent text overflow
                      maxLines: 1, // ADDED: Keep text in single line
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),

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
                            Image.asset(
                              'assets/home/see_more.png',
                              width: 40,
                              height: 40,
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}