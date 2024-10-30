// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/app_color.dart'; // Adjust this import based on your project structure

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'), // Title of the Dashboard
        backgroundColor: AppColors.primaryColor, // Use your primary color
      ),
      body: Center(
        child: Text(
          'Welcome to the Dashboard!', // Placeholder text
          style: TextStyle(
            fontSize: 24.sp, // Responsive font size
            fontWeight: FontWeight.bold,
            color: AppColors.textColor, // Use your text color
          ),
        ),
      ),
    );
  }
}
