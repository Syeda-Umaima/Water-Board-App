import 'package:flutter/material.dart';
import 'booking_4.dart';

class BookingScreen_three extends StatefulWidget {
  const BookingScreen_three({super.key});

  @override
  State<BookingScreen_three> createState() => _BookingScreen_threeState();
}

class _BookingScreen_threeState extends State<BookingScreen_three> {

  final TextEditingController _nameController = TextEditingController(text: 'Syeda Umaima');
  final TextEditingController _consumerController = TextEditingController(text: '056987225');
  final TextEditingController _addressController = TextEditingController(text: '13/5 Block C5 Gulshan Iqbal');
  final TextEditingController _floorsController = TextEditingController(text: '3 Floors House 120 Square FT');
  final TextEditingController _contactController = TextEditingController(text: '0334-3800265');

  final List<String> _tankerSizes = ['1000 Liters', '2000 Liters', '3000 Liters', '4000 Liters', '5000 Liters'];
  
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
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

    Widget _fieldCard({required Widget child, required String label}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.90, // was double.infinity
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), 
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
                    padding: const EdgeInsets.only(left: 25.0, bottom: 20, right: 20),
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
                            SizedBox(height: 4),
                            Text(
                              'Syeda Umaima',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
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

            const SizedBox(height: 8),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.transparent,
                // borderRadius: BorderRadius.circular(18),
                // border: Border.all(width: 0.2, color: Colors.black.withOpacity(0.3)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.06),
                //     blurRadius: 12,
                //     offset: const Offset(0, 6),
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  // Consumer Name
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
                              fontWeight: FontWeight.w400
                              ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: 'Consumer Name',
                            ),
                            onChanged: (v) {
                              setState(() {
                                _nameValid = v.trim().isNotEmpty;
                              });
                            },
                          ),
                        ),
                        if (_nameValid)
                          const Icon(Icons.check_circle, color: Color(0xFF4CAF50))
                        else
                          const Icon(Icons.error, color: Colors.redAccent),
                      ],
                    ),
                  ),

                  // Consumer Number
                  _fieldCard(
                    label: 'Consumer Number',
                    child: Row(
                      children: [
                        _leadingIcon(Icons.map_outlined),
                        Expanded(
                          child: TextField(
                            controller: _consumerController,
                            style: const TextStyle(
                              color: Color(0xFF8F5F5F), 
                              fontSize: 15, 
                              fontWeight: FontWeight.w400
                              ),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: '056987225',
                            ),
                            onChanged: (v) {
                              setState(() {
                                _consumerValid = v.trim().isNotEmpty;
                              });
                            },
                          ),
                        ),
                        if (_consumerValid)
                          const Icon(Icons.check_circle, color: Color(0xFF4CAF50))
                        else
                          const Icon(Icons.error, color: Colors.redAccent),
                      ],
                    ),
                  ),

                  // Address
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
                              fontWeight: FontWeight.w400
                              ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: '13/5 Block C5 Gulshan Iqbal',
                            ),
                            onChanged: (v) {
                              setState(() {
                                _addressValid = v.trim().isNotEmpty;
                              });
                            },
                          ),
                        ),
                        if (_addressValid)
                          const Icon(Icons.check_circle, color: Color(0xFF4CAF50))
                        else
                          const Icon(Icons.error, color: Colors.redAccent),
                      ],
                    ),
                  ),

                  // House Floors Data
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
                              fontWeight: FontWeight.w400
                              ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: '3 Floors House 120 Square FT',
                            ),
                            onChanged: (v) {
                              setState(() {
                                _floorsValid = v.trim().isNotEmpty;
                              });
                            },
                          ),
                        ),
                        if (_floorsValid)
                          const Icon(Icons.check_circle, color: Color(0xFF4CAF50))
                        else
                          const Icon(Icons.error, color: Colors.redAccent),
                      ],
                    ),
                  ),

                  // Suggest suitable tanker size (dropdown)
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
                              fontWeight: FontWeight.w400
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
                            onChanged: (v) {
                              setState(() {
                                _selectedTanker = v;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Contact Number with Edit
                  _fieldCard(
                    label: 'Contact Number',
                    child: Row(
                      children: [
                        _leadingIcon(Icons.phone_outlined),
                        Expanded(
                          child: TextField(
                            controller: _contactController,
                            style: const TextStyle(
                              color: Color(0xFF8F5F5F), 
                              fontSize: 15, 
                              fontWeight: FontWeight.w400
                              ),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              // contentPadding: EdgeInsets.symmetric(vertical: 0),
                              hintText: '0334-3800265',
                            ),
                            onChanged: (v) {
                              setState(() {
                                _contactValid = v.trim().isNotEmpty;
                              });
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final TextEditingController _temp =
                                    TextEditingController(text: _contactController.text);
                                return AlertDialog(
                                  title: const Text('Edit Contact Number'),
                                  content: TextField(controller: _temp, keyboardType: TextInputType.phone),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel')),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _contactController.text = _temp.text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Edit', style: TextStyle(color: Color(0xFF57B31E))),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Proceed button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // validate quickly then show snackbar
                        final valid = _nameValid &&
                            _consumerValid &&
                            _addressValid &&
                            _floorsValid &&
                            _contactValid &&
                            (_selectedTanker?.isNotEmpty ?? false);
                        if (!valid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill all fields correctly')),
                          );
                          return;
                        }
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen_four(),
                        ),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7EBF7C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Proceed', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
