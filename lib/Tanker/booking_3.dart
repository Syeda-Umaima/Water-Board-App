import 'package:flutter/material.dart';
import 'package:water_board_app/Hot_offers.dart';
import 'package:water_board_app/Tanker/booking_2.dart';

class BookingScreen_one extends StatefulWidget {
  const BookingScreen_one({super.key});

  @override
  State<BookingScreen_one> createState() => _BookingScreen_oneState();
}

class _BookingScreen_oneState extends State<BookingScreen_one> {

  // ADDED: Hover states for buttons
  bool _isBookHovered = false;
  bool _isViewHovered = false;

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
            const SizedBox(height: 20),

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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/tanker.png',
                        width: 250,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1000 Liter',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Starts From  ',
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
                      const SizedBox(height: 35), // ADDED: Space for half-overlapping button
                    ],
                  ),
                ),
                
                Positioned(
                  bottom: -25, // Position to overlap container
                  left: 0,
                  right: 0,
                  child: Center(
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isBookHovered = true),
                      onExit: (_) => setState(() => _isBookHovered = false),
                      child: SizedBox(
                        width: 240, // ADDED: Fixed width for button
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen_two(),
                        ),
                      );
                          },
                          style: ElevatedButton.styleFrom(
                            // Color changes on hover
                            backgroundColor: _isBookHovered
                                ? Color.fromARGB(255, 100, 150, 102)
                                : Color.fromARGB(255, 129, 183, 131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            elevation: 3,
                          ),
                          child: Text(
                            'Book Your Tanker',
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
            
            // MODIFIED: Spacing for the overlapping button
            const SizedBox(height: 30),
            
            // MODIFIED: View Previous Bookings button with hover effect
            Center(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isViewHovered = true),
                onExit: (_) => setState(() => _isViewHovered = false),
                child: SizedBox(
                  width: 240, // ADDED: Same fixed width as first button
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // MODIFIED: Color changes on hover
                      backgroundColor: _isViewHovered
                          ? Color.fromARGB(255, 200, 201, 200)
                          : Color.fromARGB(255, 226, 227, 226),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // MODIFIED: Same padding as first button
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      elevation: 2,
                    ),
                    child: Text(
                      'View Previous Bookings',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15, // MODIFIED: Same font size as first button
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, // ADDED: Prevent text overflow
                      maxLines: 1, // ADDED: Keep text in single line
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