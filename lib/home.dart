import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      'boxColor': Colors.orange,
      'bgColor': Colors.orange[50],
      'description': '',
    },
    {
      'logo': 'assets/cards/visa-logo.jpg',
      'title': 'VISA Offer',
      'discount': '23% OFF',
      'boxColor': Colors.amber,
      'bgColor': Colors.indigo[50],
      'description': '',
    },
    {
      'logo': 'assets/cards/hbl-logo.png',
      'title': 'HBL Payment Offer',
      'discount': '15% off',
      'boxColor': Colors.green,
      'bgColor': Colors.green[50],
      'description': 'with mobile banking',
    },
    {
      'logo': 'assets/cards/tanker-booking-logo.jpg',
      'title': 'Tanker Booking Discount',
      'discount': '20% off',
      'boxColor': Colors.blue,
      'bgColor': Colors.blue[50],
      'description': 'first booking',
    },
  ];

  // Method to build single service item
  Widget _buildServiceItem(String image, String title) {
    return Column(
      children: [
        Image.asset(image, height: 40, width: 40, fit: BoxFit.cover),
        // const SizedBox(height: 2),
        TextButton(
          onPressed: () {},
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 13),
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
            _buildServiceItem(serviceList[index]['image']!, serviceList[index]['title']!),
            if (index < serviceList.length - 1) const SizedBox(height: 5), // Add spacing only between items not after the last
          ],
        );
      }),
    );
  }

  // Helper method to build a single hot offer card
  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      width: 140,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: offer['bgColor'],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            offer['logo'],
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: offer['boxColor'],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              offer['discount'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            offer['description'],
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
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
                      const Color.fromARGB(255, 9, 23, 62).withOpacity(0.1),
                        const Color.fromARGB(0, 249, 247, 247).withOpacity(0.4),
                    ],
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 25.0, bottom: 20, right: 20),
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                      icon: const Icon(Icons.menu, color: Colors.white, size: 28),
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildServiceColumn(services.sublist(0, 3)), // Left column services
                    _buildServiceColumn(services.sublist(3, 6)), // Right column services
                  ],
                ),
              ],
            ),
          ),
         
          const SizedBox(height: 16),
         
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Text(
                  'Hot offer',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: (){
                    // Navigate to Hot_offers.dart when created
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HotOffers()));
                  },
                  child: const Text('See all', style: TextStyle(
                    color: Color.fromARGB(255, 233, 42, 28),
                    fontWeight: FontWeight.w300
                  ),))
              ],
            ),
          ),
          // const SizedBox(height: 2),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hotOffers.map((offer) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: _buildOfferCard(offer),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}