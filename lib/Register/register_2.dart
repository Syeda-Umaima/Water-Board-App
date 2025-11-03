import 'package:flutter/material.dart';
import 'package:water_board_app/Register/otp_verify.dart';
import 'package:water_board_app/Register/register_3.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});
  @override
  State<Register2> createState() => _Register2State();
}
class _Register2State extends State<Register2> {
  bool _resendOTP = true;
  bool _isLoading = false; 

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
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
                          const SizedBox(height: 10),
                          const Text(
                            'Consumer Number',
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
                          // FIXED: Text wrapped automatically based on screen width
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                height: 1.4,
                              ),
                              children: [
                                const TextSpan(text: 'If you dont have '),
                                TextSpan(
                                  text: 'Consumer Number ',
                                  style: TextStyle(
                                    color: const Color(0xFF1BB525),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const TextSpan(text: 'then Go ahead with CNIC'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'CNIC',
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
                          builder: (context) => Register3(),
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
                          const SizedBox(height: 10),
                          ElevatedButton(
                      onPressed: () {
                        // Navigate to Quick Complain Screen
                      },
                      style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black,
                              elevation: 8,
                        backgroundColor: Color(0xFF8DC96C)
,
                         minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                      child: const Text('Quick Complain', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
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