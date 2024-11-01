import 'package:flutter/material.dart';

class ProfileStack extends StatelessWidget {
  final List<String> profileImages = [
    'https://picsum.photos/200',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',

    // Add more images as needed
  ];
  final String additionalProfilesText = "50+";

  @override
  Widget build(BuildContext context) {
    // Limit the number of images displayed
    int displayCount = 3;
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Loop through limited profile images
          for (int i = 0; i < displayCount; i++)
            Positioned(
              right: i * 10.0, // Adjust overlap
              child: Container(
                width: 45,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(profileImages[i]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          // Text for additional profiles, centered below the images
          Positioned(
            right: displayCount * 25.0 -
                65, // Position under the last displayed image
            bottom: 10, // Adjusted position for better alignment
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF3AC482),
                    Color(0xFF0FCBDF),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                additionalProfilesText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'NoirPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
