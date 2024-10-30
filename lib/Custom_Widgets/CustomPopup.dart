import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Services/LocalizationService.dart';

class CustomPopups {

  static void showCustomDialog({
    required BuildContext context,
    required Icon icon,
    required String title,
    required String cancelTitle,
    required String message,
    required String deleteButtonText,
    required VoidCallback onPressButton,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(cancelTitle, style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD02727), // Button background color
                foregroundColor: Colors.white, // Button text color
              ),
              child: Text(deleteButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                onPressButton();
              },
            ),
          ],
        );
      },
    );
  }

  static void showThreeButtonDialog({
    required BuildContext context,
    required Icon icon,
    required String title,
    required String message,
    required String firstButtonText,
    required String secondButtonText,
    required VoidCallback onFirstButtonPressed,
    required VoidCallback onSecondButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD02727), // Button background color
                foregroundColor: Colors.white, // Button text color
              ),
              child: Text(firstButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                onFirstButtonPressed();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF28A745), // Different background color for the second button
                foregroundColor: Colors.white, // Button text color
              ),
              child: Text(secondButtonText),
              onPressed: () {
                Navigator.of(context).pop();
                onSecondButtonPressed();
              },
            ),
          ],
        );
      },
    );
  }

  static void informationDialog({
    required BuildContext context,
    required Icon icon,
    required String message,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Button background color
                foregroundColor: Colors.white, // Button text color
              ),
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
                onButtonPressed();
              },
            ),
          ],
        );
      },
    );
  }

  static void showCustomInternetDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(Provider.of<LocalizationService>(context, listen: false).getLocalizedString('ok')),
            ),
          ],
        );
      },
    );
  }

  static void _showTimeoutDialog(BuildContext context, LocalizationService localizationService) {
    CustomPopups.informationDialog(
      context: context,
      icon: Icon(Icons.error, color: Colors.red, size: 40),
      message: localizationService.isLocalizationLoaded
          ? localizationService.getLocalizedString('timeoutHistoryPayments')
          : 'Timeout error. Please try again later.',
      buttonText: localizationService.isLocalizationLoaded
          ? localizationService.getLocalizedString('ok')
          : 'OK',
      onButtonPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
