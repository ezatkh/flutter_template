import 'package:flutter/material.dart';
import '../Constants/app_color.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Get the screen size
    return Container(
      width: size.width, // Use full width of the screen
      height: size.height * 0.44, // Responsive height (45% of the screen height)
      color: AppColors.primaryColor,
        child: Image.asset(
          imgUrl,
          alignment: Alignment.topCenter,
          fit: BoxFit.fitHeight, // Make sure the image covers the area responsively
        ),
    );
  }
}
