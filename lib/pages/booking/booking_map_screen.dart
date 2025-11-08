import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';
import 'package:water_board_app/pages/booking/booking_confirmation_screen.dart';

class BookingMapScreen extends StatefulWidget {
  const BookingMapScreen({super.key});

  @override
  State<BookingMapScreen> createState() => _BookingMapScreenState();
}

class _BookingMapScreenState extends State<BookingMapScreen> {
  bool _isBookHovered = false;
  bool _isViewHovered = false;
  final LatLng _center = const LatLng(31.5204, 74.3487);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double headerHeight = 140;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(backgroundColor: Colors.white),

      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.95,
              child: Column(
                children: [
                  // header
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: headerHeight,
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
                          padding: const EdgeInsets.only(left: 25, bottom: 20, right: 20),
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
                                ],
                              ),
                              IconButton(
                                onPressed: () => NotificationScreen.show(context),
                                icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 32),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Menu 
                      Positioned(
                        top: 25,
                        left: 15,
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),

                          const Text(
                            'Delivery Location',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),

                          // map
                          Container(
                            height: 132,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: _center,
                                  initialZoom: 15.0,
                                  interactionOptions: const InteractionOptions(
                                    flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                                  ),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    userAgentPackageName: 'com.example.waterboardapp',
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        width: 40.0,
                                        height: 40.0,
                                        point: _center,
                                        child: const Icon(
                                          Icons.location_pin,
                                          color: Color.fromARGB(255, 230, 29, 29),
                                          size: 40.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          //cards
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(horizontal: 25),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                    Image.asset(
                                      'assets/tanker.png',
                                      width: 250,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                    const Text(
                                      'AD-3720',
                                      style: TextStyle(
                                        color: AppColors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Divider(color: Colors.black12, height: 20, thickness: 1),
                                    const SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.fire_truck_outlined,
                                              color: Colors.grey.withOpacity(0.7),
                                              size: 22,
                                            ),
                                            const Text(
                                              ' 4000 Liter',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Amount ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            const Text(
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
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Estimated Delivery Time 1 Hour 20 minutes',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                  ],
                                ),
                              ),
                              // Confirm Button
                              Positioned(
                                bottom: -25,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: MouseRegion(
                                    onEnter: (_) => setState(() => _isBookHovered = true),
                                    onExit: (_) => setState(() => _isBookHovered = false),
                                    child: SizedBox(
                                      width: 240,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const BookingConfirmationScreen(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _isBookHovered
                                              ? const Color.fromARGB(255, 100, 150, 102)
                                              : const Color.fromARGB(255, 129, 183, 131),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          elevation: 3,
                                        ),
                                        child: const Text(
                                          'Confirm',
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

                          const SizedBox(height: 38),

                          // button
                          Center(
                            child: MouseRegion(
                              onEnter: (_) => setState(() => _isViewHovered = true),
                              onExit: (_) => setState(() => _isViewHovered = false),
                              child: SizedBox(
                                width: 240,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isViewHovered
                                        ? const Color.fromARGB(255, 200, 201, 200)
                                        : const Color.fromARGB(255, 226, 227, 226),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'Pay Now',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20), 
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}