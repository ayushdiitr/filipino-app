import 'package:flutter/material.dart';

class MeetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 12.0), // Adjust padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left image
          SizedBox(
            width: 46, // Fixed width for left image
            height: 208, // Fixed height for left image
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(8), // Rounded corner for the left image
              ),
              child: Image.asset(
                'images/image2.png', // Path for the left image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10), // Gap between images
          // Center image
          SizedBox(
            width: 204, // Fixed width for center image
            height: 420, // Fixed height for center image
            child: Hero(
              tag: 'iPhone',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Rounded corners for center image
                child: Image.asset(
                  'images/meet.png', // Path for the center image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // Gap between images
          // Right image
          SizedBox(
            width: 90, // Fixed width for right image
            height: 208, // Fixed height for right image
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight:
                    Radius.circular(8), // Rounded corner for the right image
              ),
              child: Image.asset(
                'images/image.png', // Path for the right image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
