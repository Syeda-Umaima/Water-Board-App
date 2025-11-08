import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'booking_5.dart';

class BookingScreen_four extends StatefulWidget {
  const BookingScreen_four({super.key});

  @override
  State<BookingScreen_four> createState() => _BookingScreen_fourState();
}

class _BookingScreen_fourState extends State<BookingScreen_four> {

  bool _isBookHovered = false;
  bool _isViewHovered = false;

  // For the map's initial view define a default central location.
  final LatLng _center = const LatLng(31.5204, 74.3487); // Lahore, Pakistan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
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
                          const Color.fromARGB(0, 249, 247, 247).withOpacity(0.2),
                          const Color.fromARGB(0, 249, 247, 247).withOpacity(0.5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end, 
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            'Tanker Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        IconButton(
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 38,
                  left: 15,
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 28,
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
            const SizedBox(height: 15),

            Text('Delivery Location', 
            style: TextStyle( color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),),
            
            SizedBox(height: 5),
            Container(
              height: 132,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                // Clamps the map content to the rounded corners
                // borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: _center, 
                    initialZoom: 15.0, 
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate, 
                    ),
                  ),
                  children: [
                    // Tile Layer using free OpenStreetMap tiles
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.waterboardapp',
                    ),
                    // Marker Layer to add the red pin
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: _center, // Place the marker at the center
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

            const SizedBox(height: 8), 

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
                      // SizedBox(height: 5,),
                      Image.asset(
                        'assets/tanker.png',
                        width: 250,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      // const SizedBox(height: 5),
                      Text('AD-3720', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      SizedBox(height: 2),

                      const Divider(
                        color: Colors.black12,
                        height: 20,
                        thickness: 1,
                        // indent: 16,
                        // endIndent: 16,
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.fire_truck_outlined, color: Colors.grey.withOpacity(0.7),weight: 5, size: 22,),
                              Text(
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
                              Text(
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
                      SizedBox(height: 12,),
                          Text('Estimated Delivery Time 1 Hour 20 minutes', style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                          ),),
                      const SizedBox(height: 20), 
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
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen_five(),
                        ),
                      );
                          },
                          style: ElevatedButton.styleFrom(

                            backgroundColor: _isBookHovered
                                ? Color.fromARGB(255, 100, 150, 102)
                                : Color.fromARGB(255, 129, 183, 131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            elevation: 3,
                          ),
                          child: Text(
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
                          ? Color.fromARGB(255, 200, 201, 200)
                          : Color.fromARGB(255, 226, 227, 226),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      elevation: 2,
                    ),
                    child: Text(
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