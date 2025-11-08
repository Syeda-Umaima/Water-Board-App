import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/app_header.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/pages/auth/registration/register_loading_screen.dart';

class RegisterConsumerScreen extends StatefulWidget {
  const RegisterConsumerScreen({super.key});

  @override
  State<RegisterConsumerScreen> createState() => _RegisterConsumerScreenState();
}

class _RegisterConsumerScreenState extends State<RegisterConsumerScreen> {
  bool _resendOTP = true;
  bool _isLoading = false;
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                children: [
                  // Header
                  const AppHeader(
                    title: 'New Consumer Reg',
                    subtitle: 'Welcome to the app',
                    showMenu: false,
                    showNotification: false,
                  ),

                  // Form 
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      color: Colors.white,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'Consumer Number',
                              style: TextStyle(
                                color: AppColors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 1.5,
                                ),
                              ),
                              child: TextFormField(
                                controller: _mobileController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0000000000',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  height: 1.4,
                                ),
                                children: const [
                                  TextSpan(text: 'If you dont have '),
                                  TextSpan(
                                    text: 'Consumer Number ',
                                    style: TextStyle(
                                      color: Color(0xFF1BB525),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(text: 'then Go ahead with CNIC'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'CNIC',
                              style: TextStyle(
                                color: AppColors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 1.5,
                                ),
                              ),
                              child: TextFormField(
                                controller: _cnicController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '................',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _resendOTP,
                                  activeColor: Colors.purpleAccent[700],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _resendOTP = value ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  'Select Submit to Proceed Next',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                elevation: 8,
                                backgroundColor: AppColors.primaryButton,
                                minimumSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterLoadingScreen(),
                                  ),
                                );
                              },
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                elevation: 8,
                                backgroundColor: AppColors.lightGreenButton,
                                minimumSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Quick Complain',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
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