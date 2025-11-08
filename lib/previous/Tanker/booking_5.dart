import 'package:flutter/material.dart';

class BookingScreen_five extends StatefulWidget {
  const BookingScreen_five({super.key});

  @override
  State<BookingScreen_five> createState() => _BookingScreen_fiveState();
}

class _BookingScreen_fiveState extends State<BookingScreen_five> {
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
            const SizedBox(height: 40),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              padding: const EdgeInsets.only(left: 14, right: 14),
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
                children: [
                  const SizedBox(height: 40),
                  Text('Booking Confirmed', style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 30,),
                  Image(image: AssetImage('assets/animations/success.gif'), height: 80, width: 140,),
                  SizedBox(height: 30,),
                  Image(image: AssetImage('assets/tanker.png'), height: 80, width: 140,),
                  SizedBox(height: 10,),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 1,
                    // indent: -10,
                    // endIndent: 16,
                  ),
                  Text('Track your Tanker Location', style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}