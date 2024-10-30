import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final Duration transitionDuration; // Duration for the transition

  SlidePageRoute({
    required this.page,
    this.transitionDuration = const Duration(milliseconds: 500),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero; // End at the original position
      const curve = Curves.easeInOut; // The animation curve

      // Tween for the forward transition (entering)
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // Tween for the reverse transition (exiting)
      var reverseTween = Tween(begin: end, end: begin).chain(CurveTween(curve: curve));
      var reverseOffsetAnimation = secondaryAnimation.drive(reverseTween);

      // Use SlideTransition for both entering and exiting animations
      return SlideTransition(
        position: animation.status == AnimationStatus.reverse
            ? reverseOffsetAnimation
            : offsetAnimation,
        child: child,
      );
    },
    transitionDuration: transitionDuration, // Set the transition duration
    reverseTransitionDuration: transitionDuration, // Set the reverse transition duration
  );
}
