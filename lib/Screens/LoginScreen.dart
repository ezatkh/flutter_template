import 'package:flutter/material.dart';
import '../Constants/app_color.dart';
import '../Custom_Widgets/round_button.dart';
import '../Custom_Widgets/round_password.dart';
import '../Custom_Widgets/round_textfield.dart'; // Fixed the import name
import '../Custom_Widgets/under_part.dart';
import '../Custom_Widgets/upside.dart';
import 'package:get/get.dart';
import '../Routes/routes.dart'; // Import GetX

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Controllers to handle input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( // Allow scrolling when keyboard is open
          child: Column(
            children: [
              // The Upside widget at the top
              Upside(imgUrl: "assets/images/logo_init.png"),
              // Container for the main content
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0), // Improved padding for better spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Center(
                        child: const Text(
                          "Login with your account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'OpenSans',
                            fontSize: 18, // Increased font size for emphasis
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Increased spacing before the form
                      // Spacer: Add an empty Container for space
                      Form(
                        child: Column(
                          children: [
                            // Email input field
                            RoundedInputField(
                              hintText: "Email",
                              icon: Icons.email,
                              controller: emailController,
                            ),
                            const SizedBox(height: 20), // Spacing between fields
                            // Password input field
                            RoundedPasswordField(
                              controller: passwordController,
                            ),
                            const SizedBox(height: 20), // Spacing before the button
                            // Login button with navigation
                            RoundedButton(
                              text: 'LOGIN',
                              press: () {
                                // Perform your login logic here
                                String email = emailController.text;
                                String password = passwordController.text;

                                // Replace this with your actual login validation
                                if (email.isNotEmpty && password.isNotEmpty) {
                                  // Simulate login success
                                  Get.offAllNamed(Routes.dashboardScreen);
                                } else {
                                  // Show error message if login fails
                                  Get.snackbar('Login Failed', 'Please enter valid email and password',
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                            ),
                            const SizedBox(height: 10), // Spacing after the button
                            UnderPart(
                              title: "Don't have an account?",
                              navigatorText: "Register here",
                              onTap: () {
                                // Add navigation to registration screen
                                Get.toNamed(Routes.signUpScreen);
                              },
                            ),
                            const SizedBox(height: 20), // Spacing at the bottom
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
