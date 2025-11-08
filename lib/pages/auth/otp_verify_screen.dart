import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/app_header.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/pages/auth/registration/register_consumer_screen.dart'; // Updated flow
import 'package:water_board_app/widgets/countdown_timer.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  bool _isLoading = false;
  late List<TextEditingController> _codeControllers;

  @override
  void initState() {
    super.initState();
    _codeControllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _verifyCode() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    String code = _codeControllers.map((c) => c.text).join();
    if (code.length < 4) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the complete 4-digit code')),
      );
      setState(() => _isLoading = false);
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    bool isVerified = true; // Simulate success

    if (!mounted) return;

    if (isVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP verified successfully!'),
          backgroundColor: Colors.black,
        ),
      );
      // Navigate to next step in registration flow
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RegisterConsumerScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => _isLoading = false);
  }

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

                  // OTP 
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'Enter 4 digits of OTP',
                              style: TextStyle(
                                color: AppColors.black87,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 16),

                            //Input Boxes
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                4,
                                (index) => Container(
                                  width: 50,
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: _codeControllers[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counter: Offstage(),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      } else if (value.isEmpty && index > 0) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

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
                              onPressed: _isLoading ? null : _verifyCode,
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
                                      'Verify',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),

                            const SizedBox(height: 12),

                            // Timer
                            Center(
                              child: CountdownTimer(
                                primaryColor: Colors.grey[600]!,
                                onTimerFinish: () {
                                  //resend
                                },
                              ),
                            ),

                            const SizedBox(height: 20), 
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