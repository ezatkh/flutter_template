// AppRoutes.dart
import 'package:get/get.dart';
import 'package:shipping/Routes/routes.dart';
import '../Screens/SignUpScreen.dart';
import '../Screens/SplashScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/DashboardScreen.dart'; // Import the DashboardScreen

class AppRoutes {
  static List<GetPage> routes() {
    return [
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(name: Routes.signInScreen, page: () =>  LoginScreen()),
      GetPage(name: Routes.dashboardScreen, page: () => DashboardScreen()), // Add this line
      GetPage(name: Routes.signUpScreen, page: () => SignUpScreen()), // Add this line
    ];
  }
}
