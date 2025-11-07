import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();

  // Static method to show the Notification overlay (dialog)
  static void show(BuildContext context) {
    // showGeneralDialog = a built-in Flutter function that creates custom animated dialogs which can slide, fade, scale, etc.
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // allows closing by tapping outside
      barrierLabel: 'Notifications', // accessibility label
      barrierColor: Colors.black54, // semi-transparent black background
      transitionDuration: const Duration(milliseconds: 300), // animation speed

      // pageBuilder = builds the content of the dialog (our custom screen)
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NotificationScreen(); // show this widget as the overlay
      },

      // transitionBuilder = defines how the dialog will animate in/out
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // SlideTransition makes it slide from top (y = -1) to center (y = 0)
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // start above screen
            end: Offset.zero, // final position (normal)
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut, // smooth easing curve
            ),
          ),
          child: child, // the dialog widget itself
        );
      },
    );
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List of notifications 
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Tanker booking confirmation (with ID)',
      'color': Colors.grey.withOpacity(0.1),
      'textColor': Colors.black87,
    },
    {
      'title': 'Tanker arriving soon (in 30 Minutes)',
      'color': Colors.grey.withOpacity(0.1),
      'textColor': Colors.black87,
    },
    {
      'title': 'Payment received successfully',
      'color': Colors.grey.withOpacity(0.1),
      'textColor': Colors.black87,
    },
    {
      'title': 'Scheduled maintenance alerts',
      'color': const Color.fromARGB(255, 248, 119, 119),
      'textColor': Colors.white,
    },
    {
      'title': 'Complaint assigned to team',
      'color': Colors.grey.withOpacity(0.1),
      'textColor': Colors.black87,
    },
    {
      'title': 'Complaint resolved successfully',
      'color': Colors.grey.withOpacity(0.1),
      'textColor': Colors.black87,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Screen height/width for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topCenter, // position dialog at the top center
      child: Material(
        color: Colors.transparent, // transparent background for overlay
        child: Container(
          width: screenWidth, // full width
          height: screenHeight * 0.9, // take 90% of screen height
          margin: EdgeInsets.only(top: screenHeight * 0.1), // 10% top gap
          decoration: BoxDecoration(
            color: Colors.white, // main background
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // subtle shadow
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),

          // Main column layout (Header + List + Footer)
          child: Column(
            children: [
              // 🔹 HEADER SECTION
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF5B4FB8), // purple header color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      child: const Image(
                        image: AssetImage('assets/home/noti.png'),
                        width: 29,
                        height: 29,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      'All Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // LIST OF NOTIFICATIONS
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: notifications.length + 1, // +1 for See More/Close row
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE0E0E0),
                  ),
                  itemBuilder: (context, index) {
                    // If we reach the end, show "See More + Close" row
                    if (index == notifications.length) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                                color: Colors.grey.shade200, width: 1),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // "See More" button (green text)
                            TextButton(
                              onPressed: () {
                                // TODO: 
                              },
                              child: const Text(
                                'See More',
                                style: TextStyle(
                                  color: Color(0xFF4CAF50),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            // "X" Close icon button
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // close the overlay dialog
                              },
                              icon: const Icon(Icons.close),
                              color: const Color(0xFF5B4FB8), // purple icon
                              iconSize: 28,
                            ),
                          ],
                        ),
                      );
                    }

                    // Build each individual notification tile
                    final notification = notifications[index];
                    return Container(
                      color: notification['color'], // background color
                      child: ListTile(
                        dense: true, // smaller height
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        leading: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: notification['textColor'], // dot color
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: Text(
                          notification['title'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: notification['textColor'],
                          ),
                        ),
                        onTap: () {
                          // TODO
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
