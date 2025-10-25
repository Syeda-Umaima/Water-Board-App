// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _obscureText = true;
//   bool _rememberMe = false;
//   bool _isLoading = false;
//   final TextEditingController _consumerController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 12,
//                     offset: Offset(0, 6),
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: AssetImage('assets/background.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),

//           Builder(
//             builder: (context) {
//               final height = MediaQuery.of(context).size.height;
//               return Positioned(
//                 top: height * 0.18,
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: Container(
//                   padding: EdgeInsets.all(18),
//                   color: Colors.white,
//                   child: Center(
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 5),
//                           Text(
//                             'Consumer Number',
//                             style: TextStyle(
//                               color: const Color.fromARGB(255, 13, 13, 13),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15,
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: TextFormField(
//                               controller: _consumerController,
//                               keyboardType: TextInputType.numberWithOptions(),
//                               decoration: InputDecoration(
//                                 hintText: '000000000',
//                                 hintStyle: TextStyle(color: Colors.grey[600]),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15,
//                                   horizontal: 15,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Password',
//                             style: TextStyle(
//                               color: const Color.fromARGB(255, 13, 13, 13),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15,
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                 color: Colors.grey.withOpacity(0.3),
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: TextFormField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 suffixIcon: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscureText = !_obscureText;
//                                     });
//                                   },
//                                   icon: _obscureText
//                                       ? Icon(
//                                           Icons.visibility,
//                                           color: Colors.grey,
//                                         )
//                                       : Icon(
//                                           Icons.visibility_off,
//                                           color: Colors.grey,
//                                         ),
//                                 ),

//                                 hintText: '...........',
//                                 hintStyle: TextStyle(color: Colors.grey[600]),

//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 15,
//                                   horizontal: 15,
//                                 ),
//                               ),
//                               obscureText: _obscureText,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 if (value.length < 6) {
//                                   return 'Password must be at least 6 characters';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Checkbox(
//                                 value: _rememberMe,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     _rememberMe = value ?? false;
//                                   });
//                                 },
//                               ),
//                               Text(
//                                 'Keep me signed in',
//                                 style: TextStyle(
//                                   color: Colors.grey[700],
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               minimumSize: Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: _isLoading
//                                 ? SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.white,
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                           ),
//                           SizedBox(height: 10),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color.fromARGB(
//                                 255,
//                                 215,
//                                 224,
//                                 234,
//                               ),
//                               minimumSize: Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: _isLoading
//                                 ? SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.blue,
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'Register',
//                                     style: TextStyle(
//                                       color: const Color.fromARGB(
//                                         255,
//                                         87,
//                                         87,
//                                         87,
//                                       ),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
