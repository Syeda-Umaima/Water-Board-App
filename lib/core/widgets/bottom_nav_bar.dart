import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/pages/home/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // IconButton(
          //   icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white, size: 24),
          //   onPressed: () {
          //     if (Navigator.canPop(context)) {
          //       Navigator.pop(context);
          //     }
          //   },
          //   padding: EdgeInsets.zero,
          //   constraints: const BoxConstraints(),
          // ),
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/drawer/back.png'),
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 24),
            onPressed: () {
              // TODO
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          IconButton(
            icon: const Icon(Icons.person, color: Colors.white, size: 24),
            onPressed: () {
              // TODO
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
