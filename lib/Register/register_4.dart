import 'package:flutter/material.dart';
import 'package:water_board_app/Register/register_1.dart';
import 'package:water_board_app/home.dart';

class Register4 extends StatefulWidget {
  const Register4({super.key});
  @override
  State<Register4> createState() => _Register4State();
}

class _Register4State extends State<Register4> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _isLoading = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(text: 'Syeda Umaima');
  final TextEditingController _addressController = TextEditingController(text: '13/4 Block C Gulshan Iqbal');

  final _formKey = GlobalKey<FormState>();

  Widget _inputField({ required String label, required Widget child, bool showCheck = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(child: child),
              if (showCheck)
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.check_circle, color: Colors.green, size: 20),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Header
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
                      const Color.fromARGB(0, 249, 247, 247).withOpacity(0.2),
                      const Color.fromARGB(0, 249, 247, 247).withOpacity(0.5),
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
                        'Create Account',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          // Consumer Name
                          _inputField(
                            label: 'Consumer Name',
                            showCheck: true,
                            child: TextFormField(
                              controller: _nameController,
                              readOnly: true,
                              style: const TextStyle(fontSize: 15, color: Colors.black87),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                              ),
                            ),
                          ),

                          // Address
                          _inputField(
                            label: 'Address',
                            showCheck: true,
                            child: TextFormField(
                              controller: _addressController,
                              readOnly: true,
                              style: const TextStyle(fontSize: 15, color: Colors.black87),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                              ),
                            ),
                          ),

                          // Password
                          _inputField(
                            label: 'Password',
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: _obscureText,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                hintText: '................',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Enter password';
                                if (value.length < 6) return 'Min 6 characters';
                                return null;
                              },
                            ),
                          ),

                          // Confirm Password
                          _inputField(
                            label: 'Confirm password',
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _obscureConfirmText,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                hintText: '................',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmText ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureConfirmText = !_obscureConfirmText;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value != _passwordController.text) return 'Passwords do not match';
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Confirm Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF005FF6),
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 6,
                                shadowColor: Colors.blue.withOpacity(0.4),
                              ),
                              onPressed: _isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                                        );
                                      }
                                    },
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                    )
                                  : const Text(
                                      'Confirm',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 40),
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

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}