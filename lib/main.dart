import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart'; // Import GetX
import 'Routes/app_routes.dart';
import 'Services/LocalizationService.dart';
import 'States/LoginState.dart';
import 'Routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './Constants/app_color.dart'; // Import the app_color.dart file

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the LocalizationService and handle any errors
  LocalizationService localizationService = LocalizationService();
  try {
    await localizationService.initLocalization();
    print("Localization initialized successfully.");
  } catch (e) {
    print("Error initializing localization: $e");
  }

  // Start the app by passing LocalizationService to MyApp
  runApp(MyApp(localizationService: localizationService));
}

class MyApp extends StatelessWidget {
  final LocalizationService localizationService;

  const MyApp({Key? key, required this.localizationService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => localizationService),
        ChangeNotifierProvider(create: (context) => LoginState()),
      ],
      child: const AppBuilder(),
    );
  }
}

class AppBuilder extends StatelessWidget {
  const AppBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationService = context.watch<LocalizationService>();

    return GetMaterialApp(
      title: 'Shipping',
      debugShowCheckedModeBanner: false,
      theme: AppColors.darkTheme,
      // Set initial route to splash screen
      initialRoute: Routes.splashScreen,
      // Add routes from AppRoutes
      getPages: AppRoutes.routes(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('ar', 'AE'), // Arabic
      ],
      locale: Locale(localizationService.selectedLanguageCode),
      builder: (context, child) {
        return Directionality(
          textDirection: localizationService.selectedLanguageCode == 'en'
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
