import 'package:flutter/material.dart';

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
          // Left side colored panel
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

          // Right side text content
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hot Offers',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
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
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
