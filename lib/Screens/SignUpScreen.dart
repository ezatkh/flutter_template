import 'package:flutter/material.dart';
import '../Constants/app_color.dart';
import '../Custom_Widgets/round_button.dart';
import '../Custom_Widgets/round_password.dart';
import '../Custom_Widgets/round_textfield.dart'; // Ensure the import is correct
import '../Custom_Widgets/under_part.dart';
import '../Custom_Widgets/upside.dart';
import 'package:get/get.dart';
import '../Routes/routes.dart'; // Import GetX

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // Controllers to handle input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( // Allow scrolling when keyboard is open
          child: Column(
            children: [
              // The Upside widget at the top
              const Upside(imgUrl: "assets/images/logo_init.png"),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding for better spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      const SizedBox(height: 20), // Fixed spacing
                      Center(
                        child: const Text(
                          "Create your account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'OpenSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Spacing before the form
                      Center(
                        child: Form(
                          child: Column(
                            children: [
                              // Email input field
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              // Password input field
                              RoundedPasswordField(
                                controller: passwordController,
                              ),
                              RoundedPasswordField(
                                controller: confirmpasswordController,
                              ),
                              const SizedBox(height: 20), // Spacing before the button
                              // Sign-up button with navigation
                              RoundedButton(
                                text: 'SIGN UP',
                                press: () {
                                  // Perform your signup logic here
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String confirmPassword = confirmpasswordController.text;

                                  // Replace this with your actual signup validation
                                  if (confirmPassword.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                                    // Simulate signup success
                                    Get.offAllNamed(Routes.dashboardScreen);
                                  } else {
                                    // Show error message if signup fails
                                    Get.snackbar('Sign Up Failed', 'Please enter valid information',
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                              ),
                              const SizedBox(height: 20), // Spacing after the button
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  // Add navigation to login screen
                                  Get.toNamed(Routes.signInScreen);
                                },
                              ),
                              const SizedBox(height: 20), // Spacing before additional actions
                            ],
                          ),
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
