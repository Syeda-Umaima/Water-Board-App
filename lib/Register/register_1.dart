import 'package:flutter/material.dart';
import 'package:water_board_app/Register/otp_verify.dart';
// import 'package:water_board_app/timer.dart'; // Import for CountdownTimer

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  bool _resendOTP = true;
  bool _isLoading = false; 

  final TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color.fromARGB(0,249,247,247).withOpacity(0.2),
                      const Color.fromARGB(0,249,247,247,).withOpacity(0.5),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'New Consumer Reg',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Welcome to the app',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Form Section
          Builder(
            builder: (context) {
              final height = MediaQuery.of(context).size.height;
              return Positioned(
                top: height * 0.22,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Enter Mobile Number',
                            style: TextStyle(
                              color: Colors.black87,
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
                          const SizedBox(height: 12),
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
                                'Resend OTP',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black,
                              elevation: 8,
                              backgroundColor: Color(0xFF005FF6),
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerify(),
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
                                    'Send OTP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 10),
                          // Center(
                          //   child: CountdownTimer(primaryColor: Colors.grey[600]!,onTimerFinish: () {}),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}