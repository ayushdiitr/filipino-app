import 'package:flutter/material.dart';

class iPhonePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned image with the given properties
        Positioned(
          //top: 14.46, // Adjusts the top position of the image
          //left: 16.72, // Adjusts the left position of the image
          //width: 296.33, // Sets the width of the image
          //height: 642.32, // Sets the height of the image
          child: Opacity(
            opacity: 1.0, // Set opacity to 1.0 to make the image visible
            child: Image.asset(
              'images/iPhone.png', // Path to the image
              fit: BoxFit.contain, // Adjusts how the image fits
            ),
          ),
        ),
      ],
    );
  }
}
