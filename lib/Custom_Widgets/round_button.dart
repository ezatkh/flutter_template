// lib/widgets/rounded_button.dart

import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.press,
    this.textColor = Colors.white,
    required this.text,
  }) : super(key: key);

  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30), // Match the rounded corners
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 17),
          ),
          onPressed: press,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, // Use primary color
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: TextStyle(
              letterSpacing: 2,
              color: textColor,
              fontSize: 14, // Adjusted font size for better readability
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Match the rounded corners
            ),
            elevation: 5, // Add elevation for depth
          ),
        ),
      ),
    );
  }
}
