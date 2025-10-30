import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BookingScreen_three extends StatefulWidget {
  const BookingScreen_three({super.key});

  @override
  State<BookingScreen_three> createState() => _BookingScreen_threeState();
}

class _BookingScreen_threeState extends State<BookingScreen_three> {

  bool _isBookHovered = false;
  bool _isViewHovered = false;

  // For the map's initial view define a default central location.
  final LatLng _center = const LatLng(31.5204, 74.3487); // Lahore, Pakistan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(backgroundColor: Colors.white),
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

                    padding: const EdgeInsets.only(
                      bottom: 25, 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end, 
                      children: [
                        // 1. Tanker Booking Text
                        Padding(
                          // 📐 ADDED: Explicit left padding to account for the menu icon's space
                          padding: const EdgeInsets.only(left: 70.0),
                          child: Text(
                            'Tanker Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28, // Increased font size for prominence
                            ),
                          ),
                        ),
                        // 2. Notification Icon
                        IconButton(
                          // 📐 ADDED: Explicit right padding for consistent spacing
                          padding: const EdgeInsets.only(right: 20.0),
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
                            size: 34, // Increased size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 3. Menu Icon
                Positioned(
                  // 📐 ADJUSTED: Moved down to align vertically with the text/icon row
                  top: 50, 
                  left: 15,
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30, // Increased size
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

            Text('Delivery Location', 
            style: TextStyle( color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),),
            const SizedBox(height: 5,),

            // 🗺️ START: Replaced map placeholder with FlutterMap widget
            Container(
              height: 200, // Fixed height for the map card
              margin: const EdgeInsets.symmetric(horizontal: 25),
              // 📦 Added box decoration and shadow to match the card style of the image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                // ✂️ Clamps the map content to the rounded corners
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: _center, // Center the map
                    initialZoom: 15.0, // Zoom level to see the area
                    interactionOptions: const InteractionOptions(
                      // Disabled map rotation
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate, 
                    ),
                  ),
                  children: [
                    // 🖼️ Tile Layer using free OpenStreetMap tiles
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.waterboardapp', // Replace with your package name
                    ),
                    // 📌 Marker Layer to add the red pin
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: _center, // Place the marker at the center
                          child: const Icon(
                            Icons.location_pin,
                            color: Color.fromARGB(255, 230, 29, 29), // Red color for the pin
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 🗺️ END: Map Widget Area

            const SizedBox(height: 20), // Spacing between map and the next stack

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
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/tanker.png',
                        width: 250,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 5),
                      const Text('AD-3720', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.fire_truck_outlined, color: Colors.grey.withOpacity(0.7), size: 22,),
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
                                'Total Amount  ',
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
                      const SizedBox(height: 20),
                          const Text('Estimated Delivery Time 1 Hour 20 minutes', style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),),
                      const SizedBox(height: 25), 
                    ],
                  ),
                ),
                
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
                      //       Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BookingScreen_two(),
                      //   ),
                      // );
                          },
                          style: ElevatedButton.styleFrom(

                            backgroundColor: _isBookHovered
                                ? const Color.fromARGB(255, 100, 150, 102)
                                : const Color.fromARGB(255, 129, 183, 131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            
            const SizedBox(height: 30),
            
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15, 
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, 
                      maxLines: 1, 
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
