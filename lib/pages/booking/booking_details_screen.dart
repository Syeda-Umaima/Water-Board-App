import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/widgets/app_drawer.dart';
import '../notifications/notification_screen.dart';
import 'package:water_board_app/pages/booking/booking_map_screen.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Syeda Umaima');
  final TextEditingController _consumerController =
      TextEditingController(text: '056987225');
  final TextEditingController _addressController =
      TextEditingController(text: '13/5 Block C5 Gulshan Iqbal');
  final TextEditingController _floorsController =
      TextEditingController(text: '3 Floors House 120 Square FT');
  final TextEditingController _contactController =
      TextEditingController(text: '0334-3800265');

  final List<String> _tankerSizes = [
    '1000 Liters',
    '2000 Liters',
    '3000 Liters',
    '4000 Liters',
    '5000 Liters'
  ];
  String? _selectedTanker = '4000 Liters';

  bool _nameValid = true;
  bool _consumerValid = true;
  bool _addressValid = true;
  bool _floorsValid = true;
  bool _contactValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _consumerController.dispose();
    _addressController.dispose();
    _floorsController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Widget _floatingLabel(String text) {
    return Positioned(
      left: 14,
      top: -10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: AppColors.black87),
        ),
      ),
    );
  }

  Widget _fieldCard({required Widget child, required String label}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.3, color: Colors.black26),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: child,
          ),
          _floatingLabel(label),
        ],
      ),
    );
  }

  Widget _leadingIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Icon(icon, size: 20, color: Colors.grey[700]),
    );
  }

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
                                const Color.fromARGB(0, 249, 247, 247)
                                    .withOpacity(0.2),
                                const Color.fromARGB(0, 249, 247, 247)
                                    .withOpacity(0.5),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              left: 25, bottom: 20, right: 20),
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
                                  Text(
                                    'Syeda Umaima',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
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
                            icon: const Icon(Icons.menu,
                                color: Colors.white, size: 28),
                            onPressed: () => AppDrawer.show(context),
                          ),
                        ),
                      ),
                    ],
                  ),


                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),

                          // fields
                          _fieldCard(
                            label: 'Consumer Name',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.badge_outlined),
                                Expanded(
                                  child: TextField(
                                    controller: _nameController,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: 'Consumer Name',
                                    ),
                                    onChanged: (v) => setState(() {
                                      _nameValid = v.trim().isNotEmpty;
                                    }),
                                  ),
                                ),
                                Icon(
                                  _nameValid
                                      ? Icons.check_circle
                                      : Icons.error,
                                  color: _nameValid
                                      ? const Color(0xFF4CAF50)
                                      : Colors.redAccent,
                                ),
                              ],
                            ),
                          ),

                          _fieldCard(
                            label: 'Consumer Number',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.map_outlined),
                                Expanded(
                                  child: TextField(
                                    controller: _consumerController,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: '056987225',
                                    ),
                                    onChanged: (v) => setState(() {
                                      _consumerValid = v.trim().isNotEmpty;
                                    }),
                                  ),
                                ),
                                Icon(
                                  _consumerValid
                                      ? Icons.check_circle
                                      : Icons.error,
                                  color: _consumerValid
                                      ? const Color(0xFF4CAF50)
                                      : Colors.redAccent,
                                ),
                              ],
                            ),
                          ),

                          _fieldCard(
                            label: 'Address',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.location_on_outlined),
                                Expanded(
                                  child: TextField(
                                    controller: _addressController,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: '13/5 Block C5 Gulshan Iqbal',
                                    ),
                                    onChanged: (v) => setState(() {
                                      _addressValid = v.trim().isNotEmpty;
                                    }),
                                  ),
                                ),
                                Icon(
                                  _addressValid
                                      ? Icons.check_circle
                                      : Icons.error,
                                  color: _addressValid
                                      ? const Color(0xFF4CAF50)
                                      : Colors.redAccent,
                                ),
                              ],
                            ),
                          ),

                          _fieldCard(
                            label: 'House Floors Data',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.home_outlined),
                                Expanded(
                                  child: TextField(
                                    controller: _floorsController,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: '3 Floors House 120 Square FT',
                                    ),
                                    onChanged: (v) => setState(() {
                                      _floorsValid = v.trim().isNotEmpty;
                                    }),
                                  ),
                                ),
                                Icon(
                                  _floorsValid
                                      ? Icons.check_circle
                                      : Icons.error,
                                  color: _floorsValid
                                      ? const Color(0xFF4CAF50)
                                      : Colors.redAccent,
                                ),
                              ],
                            ),
                          ),

                          _fieldCard(
                            label: 'Suggest suitable tanker size',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.fire_truck_outlined),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedTanker,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    items: _tankerSizes
                                        .map((s) => DropdownMenuItem(
                                              value: s,
                                              child: Text(s),
                                            ))
                                        .toList(),
                                    onChanged: (v) => setState(() {
                                      _selectedTanker = v;
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          _fieldCard(
                            label: 'Contact Number',
                            child: Row(
                              children: [
                                _leadingIcon(Icons.phone_outlined),
                                Expanded(
                                  child: TextField(
                                    controller: _contactController,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(
                                      color: Color(0xFF8F5F5F),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: '0334-3800265',
                                    ),
                                    onChanged: (v) => setState(() {
                                      _contactValid = v.trim().isNotEmpty;
                                    }),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    final TextEditingController _temp =
                                        TextEditingController(
                                            text: _contactController.text);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Edit Contact Number'),
                                        content: TextField(
                                          controller: _temp,
                                          keyboardType: TextInputType.phone,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _contactController.text =
                                                    _temp.text;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Color(0xFF57B31E)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid = _nameValid &&
                                    _consumerValid &&
                                    _addressValid &&
                                    _floorsValid &&
                                    _contactValid &&
                                    (_selectedTanker?.isNotEmpty ?? false);
                                if (!valid) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please fill all fields correctly')),
                                  );
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const BookingMapScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greenButton,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text(
                                'Proceed',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
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