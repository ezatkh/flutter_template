import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final List<Widget>? actions;

  const CustomHeader({
    Key? key,
    required this.title,
    this.onMenuPressed,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130, // Adjust height as needed
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFC62828), // Same red color as the button
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20), // Circular corners
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onMenuPressed,
              icon: Icon(Icons.menu, color: Colors.white),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: actions ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
