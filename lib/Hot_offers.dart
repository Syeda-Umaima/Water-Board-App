import 'package:flutter/material.dart';

class HotOffersScreen extends StatelessWidget {
  const HotOffersScreen({super.key});

  // All offers data
  final List<Map<String, dynamic>> allOffers = const [
    {
      'title': 'MasterCard Discount',
      'subtitle': '15% OFF',
      'description': '15% discount with mastercard',
      'color': Color(0xFFEB001B),
      'icon': Icons.credit_card,
    },
    {
      'title': 'VISA Offer',
      'subtitle': '23% OFF',
      'description': '',
      'color': Color(0xFF1A1F71),
      'icon': Icons.credit_card,
    },
    {
      'title': 'JazzCash Cashback',
      'subtitle': '10% CASHBACK',
      'description': '10% cashback on bill payment',
      'color': Color(0xFF00A651),
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'EasyPaisa Offer',
      'subtitle': 'FREE WAIVER',
      'description': 'Free late fee waiver',
      'color': Color(0xFF1DA1F2),
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'Bank Alfalah',
      'subtitle': '20% OFF',
      'description': '20% discount on online payment',
      'color': Color(0xFF0033A0),
      'icon': Icons.account_balance,
    },
    {
      'title': 'HBL Payment Offer',
      'subtitle': '15% OFF',
      'description': '15% off with mobile banking',
      'color': Color(0xFF0066B3),
      'icon': Icons.account_balance,
    },
    {
      'title': 'Tanker Booking Discount',
      'subtitle': '20% OFF',
      'description': '20% off first booking',
      'color': Color(0xFF4CAF50),
      'icon': Icons.local_shipping,
    },
    {
      'title': 'Online Bill Payment',
      'subtitle': 'REWARD POINTS',
      'description': 'Earn reward points on every payment',
      'color': Color(0xFFFF9800),
      'icon': Icons.receipt,
    },
    {
      'title': 'Refer a Friend',
      'subtitle': 'RS 200 CREDIT',
      'description': 'Get RS 200 credit for each referral',
      'color': Color(0xFF9C27B0),
      'icon': Icons.share,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hot Offers'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemCount: allOffers.length,
          itemBuilder: (context, index) {
            return _buildOfferCard(allOffers[index]);
          },
        ),
      ),
    );
  }

  Widget _buildOfferCard(Map<String, dynamic> offer) {
    return Container(
      decoration: BoxDecoration(
        color: offer['color'],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    offer['icon'],
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Flexible(
                  child: Text(
                    offer['subtitle'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                if (offer['description'].isNotEmpty)
                  Text(
                    offer['description'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}