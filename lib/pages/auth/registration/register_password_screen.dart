import 'package:flutter/material.dart';
import 'package:water_board_app/core/constants/app_colors.dart';
import 'package:water_board_app/core/widgets/app_header.dart';
import 'package:water_board_app/core/widgets/bottom_nav_bar.dart';
import 'package:water_board_app/pages/home/home_screen.dart';

class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen({super.key});

  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(text: 'Syeda Umaima');
  final TextEditingController _addressController = TextEditingController(text: '13/4 Block C Gulshan Iqbal');
  final _formKey = GlobalKey<FormState>();

  Widget _inputField({
    required String label,
    required Widget child,
    bool showCheck = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
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
        const SizedBox(height: 8),
      ],
    );
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
                    title: 'Create Account',
                    subtitle: 'Welcome to the app',
                    showMenu: false,
                    showNotification: false,
                  ),

                  // Form 
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      color: Colors.white,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              _inputField(
                                label: 'Consumer Name',
                                showCheck: true,
                                child: TextFormField(
                                  controller: _nameController,
                                  readOnly: true,
                                  style: const TextStyle(fontSize: 15, color: AppColors.black87),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                  ),
                                ),
                              ),
                              _inputField(
                                label: 'Address',
                                showCheck: true,
                                child: TextFormField(
                                  controller: _addressController,
                                  readOnly: true,
                                  style: const TextStyle(fontSize: 15, color: AppColors.black87),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                  ),
                                ),
                              ),
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
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryButton,
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
                                              MaterialPageRoute(builder: (_) => const HomeScreen()),
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
                              const SizedBox(height: 20),
                            ],
                          ),
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

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}