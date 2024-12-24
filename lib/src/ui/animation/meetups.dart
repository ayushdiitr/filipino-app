import 'package:flutter/material.dart';

class MeetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Adjust padding as per your need
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left image
          Expanded(
            child: Container(
              width: 128,
              height: 208,  // Add height for the left image
              child: Opacity(
                opacity: 1.0, // Set the opacity to 0 as per your request
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.8),
                  ),
                  child: Image.asset(
                    'images/image2.png', // Path for the left image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // You can adjust the gap between the images
          // Center image
          Expanded(
            child: Container(
              width: 204,
              height: 398.58,  // Add height for the center image
              child: Opacity(
                opacity: 1.0, // Set the opacity to 0 as per your request
                child: Image.asset(
                  'images/meet.png', // Path for the center image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // You can adjust the gap between the images
          // Right image
          Expanded(
            child: Container(
              width: 128,
              height: 208,  // Add height for the right image
              child: Opacity(
                opacity: 1.0, // Set the opacity to 0 as per your request
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2.8),
                  ),
                  child: Image.asset(
                    'images/image.png', // Path for the right image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
