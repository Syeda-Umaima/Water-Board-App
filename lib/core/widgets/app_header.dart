import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle; // nullable no default
  final bool showMenu;
  final bool showNotification;
  final VoidCallback? onNotificationTap;

  const AppHeader({
    Key? key,
    required this.title,
    this.subtitle, //optional                 
    this.showMenu = true,
    this.showNotification = true,
    this.onNotificationTap,
  falsy }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasSubtitle = subtitle != null && subtitle!.trim().isNotEmpty;

    return Stack(
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
            padding: EdgeInsets.only(
              left: showMenu ? 25.0 : 25.0,
              bottom: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    if (hasSubtitle)
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    else
                      const SizedBox(height: 20), 
                  ],
                ),

                // Notification
                if (showNotification)
                  IconButton(
                    onPressed: onNotificationTap ?? () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Menu 
        if (showMenu)
          Positioned(
            top: 25,   
            left: 15,
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
      ],
    );
  }
}