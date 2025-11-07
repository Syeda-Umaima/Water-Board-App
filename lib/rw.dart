import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();

  //Method to show Notification overlay
  static void show(BuildContext context){
    showGeneralDialog(context: context, barrierDismissible: true, barrierLabel: 'Notifications', barrierColor: Colors.black54,transitionDuration: const Duration(microseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => const NotificationScreen(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut)
        ),
        child: child,
      );
    },);
  }
}


class _NotificationScreenState extends State<NotificationScreen> {

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth,
          height: screenHeight * 0.9,
          margin: EdgeInsets.only(top: screenHeight * 0.1),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -2)
            )]
          ),
          
          //Main Column
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF5B4FB8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
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

                    const Text('All Notifications',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}