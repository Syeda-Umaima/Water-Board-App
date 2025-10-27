import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              // ✅ Background Image with gradient overlay
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140, // Kept the height as is for balance
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  // ✅ Added gradient overlay (dark bottom-left → light top-right)
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        const Color.fromARGB(255, 9, 23, 62).withOpacity(0.1), // darker bottom-left
                        const Color.fromARGB(0, 249, 247, 247).withOpacity(0.4), // lighter top-right
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 25.0, bottom: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ for cleaner layout
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Syeda Umaima',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      // ✅ Notification icon aligned to right properly
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: IconButton(
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
                            size: 32, // ✅ slightly smaller and balanced
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ✅ Menu Icon (fixed positioning issue)
              Positioned(
                top: 25,
                left: 15,
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white, size: 28),
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
          // Moved 'Our Services' inside the container to match the mockup where it's part of the rounded section
          Container(
            // Added margin, padding, decoration for rounded corners, white background, and subtle shadow to exactly match the mockup's container style
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Our Services',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600, // Adjusted to bolder to match mockup
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20), // Added spacing below title to match mockup
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Changed to spaceEvenly for better centering and spacing like in mockup
                  children: [
                    Expanded( // Wrapped in Expanded to better control width and wrapping
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Centered for text alignment under icons
                        children: [
                          // Grouped each service into its own column with sized image and text for grid-like appearance
                          Column(
                            children: [
                              Image.asset('assets/home/1.png', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Tanker Booking',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Reduced spacing between services to make container smaller/tighter
                          Column(
                            children: [
                              Image.asset('assets/home/2.jpg', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Bills Payment &\nDuplicate Bill', // Added \n to force two lines as per image and instructions
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Reduced spacing between services to make container smaller/tighter
                          Column(
                            children: [
                              Image.asset('assets/home/3.png', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'FAQs / Feedback', // Fixed text to match mockup exactly
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded( // Wrapped in Expanded to better control width and wrapping
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Centered for text alignment under icons
                        children: [
                          // Grouped each service into its own column with sized image and text for grid-like appearance
                          Column(
                            children: [
                              Image.asset('assets/home/4.png', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Report a Complaint', // Fixed typo to match mockup
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Reduced spacing between services to make container smaller/tighter
                          Column(
                            children: [
                              Image.asset('assets/home/5.png', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'New Connection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16), // Reduced spacing between services to make container smaller/tighter
                          Column(
                            children: [
                              Image.asset('assets/home/6.png', height: 60, width: 60, fit: BoxFit.contain), // Sized image to match icon size in mockup
                              SizedBox(height: 5),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'ChatBot',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}