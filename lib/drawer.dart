import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();

  // Static method to show drawer as overlay
  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Drawer',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const AppDrawer();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth * 0.7, // 70% width
          height: screenHeight * 0.86, // 86% height
          margin: EdgeInsets.only(
            top: screenHeight * 0.1, // 10% top gap
            bottom: screenHeight * 0.04, // 4% bottom gap
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(2, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header - Increased height
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 35, 16, 25),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5B4FB8), Color(0xFF7B68C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_pic.jpg'),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Syeda Umaima',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Menu Items - Reduced spacing
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _buildMenuItem(
                        imagePath: 'assets/drawer/home.png',
                        label: 'Home',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/tanker_booking.png',
                        label: 'Tanker Booking',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/consumer_registration.png',
                        label: 'Consumer Registration',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/news_alerts.png',
                        label: 'News & Alerts',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/bills_payments.png',
                        label: 'Bills & Other Payments',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/complaints.png',
                        label: 'Complaints',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/payment_history.png',
                        label: 'My Bills & Payment History',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/usage_reports.png',
                        label: 'Usage Reports',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/contact_helpline.png',
                        label: 'Contact & Helpline',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/settings.png',
                        label: 'Setting / Language Change',
                      ),
                      _buildMenuItem(
                        imagePath: 'assets/drawer/logout.png',
                        label: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
              
              // Close Button
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      backgroundColor: const Color(0xFF5B4FB8),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String imagePath,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        // Add your navigation logic here
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            SizedBox(
              width: 26,
              height: 20,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 14,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}