import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          //top: 10.87, // Distance from the top
          //left: 12.55, // Distance from the left
          child: Opacity(
            opacity: 1.0, // Opacity set to 1.0, so it is fully visible
            child: Image.asset(
              'images/match.png', // Path to your image
              width: 222.47, // Width of the image
              height: 482.7, // Height of the image
            ),
          ),
        ),
      ],
    );
  }
}
