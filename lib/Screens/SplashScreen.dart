import 'package:flutter/material.dart';
import '../Constants/app_color.dart';
import '../Routes/routes.dart';
import '../Services/LocalizationService.dart';
import 'package:provider/provider.dart';
import 'LoginScreen.dart';
import 'package:get/get.dart'; // Import GetX

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoOpacity;
  late Animation<double> _backgroundLighten;
  late Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));

    _logoOpacity = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _backgroundLighten = Tween(begin: 0.2, end: 1.0).animate(_controller);
    _logoScale = Tween(begin: 1.2, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    _controller.addStatusListener((status) async {
      await Provider.of<LocalizationService>(context, listen: false).initLocalization();
      if (status == AnimationStatus.completed) {
        _handleNavigation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor.withOpacity(_backgroundLighten.value), // Use AppColors
            ),
            child: Center(
              child: Opacity(
                opacity: _logoOpacity.value,
                child: Transform.scale(
                  scale: _logoScale.value,
                  child: Image.asset('assets/images/logo_init.png'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleNavigation() {
    Get.offAllNamed(Routes.signInScreen); // Navigate to login using the named route
  }
}
