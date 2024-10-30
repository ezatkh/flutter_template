// lib/widgets/rounded_input_field.dart

import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller, // Add controller as a parameter
    this.hintFontSize=14, // Add controller as a parameter
    this.obscureText = false, // To handle password visibility
  }) : super(key: key);

  final String? hintText;
  final double? hintFontSize;
  final IconData icon;
  final TextEditingController? controller; // Optional controller
  final bool obscureText; // To handle password visibility

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
            offset: const Offset(0, 5), // Changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller, // Use the passed controller
        obscureText: obscureText, // Use the obscure text parameter
        cursorColor: AppColors.lightBackgroundColor, // Change cursor color if needed
        decoration: InputDecoration(
          filled: true, // Enable filled background
          fillColor: AppColors.primaryColor, // Set the background to the primary color
          icon: Icon(
            icon,
            color: AppColors.lightBackgroundColor, // Change icon color for contrast
          ),
          hintText: hintText, // Set the hint text
          hintStyle: TextStyle(color: AppColors.lightBackgroundColor, fontFamily: 'OpenSans', fontSize: hintFontSize), // Change hint text color for contrast
          border: InputBorder.none,
        ),
      ),
    );
  }
}
