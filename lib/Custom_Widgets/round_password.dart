// lib/widgets/rounded_password_field.dart

import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key,
    required this.controller, // Add controller as a required parameter
    this.hintText, // Allow hint text to be passed
  }) : super(key: key);

  final TextEditingController controller; // Required controller
  final String? hintText; // Optional hint text

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller, // Use the passed controller
        obscureText: true, // Keep the password obscure
        cursorColor: AppColors.lightBackgroundColor, // Change cursor color if needed
        decoration: InputDecoration(
          filled: true, // Enable filled background
          fillColor: AppColors.primaryColor, // Set the background to the primary color
          icon: Icon(
            Icons.lock,
            color: AppColors.lightBackgroundColor, // Change icon color for contrast
          ),
          hintText: hintText ?? "Password", // Use hint text or default value
          hintStyle: TextStyle(color: AppColors.lightBackgroundColor, fontFamily: 'OpenSans',fontSize: 14), // Change hint text color for contrast
          border: InputBorder.none,
        ),
      ),
    );
  }
}
