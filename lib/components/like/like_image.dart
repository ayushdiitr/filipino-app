import 'package:flutter/material.dart';

class LikeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.0, // Card width
      height: 232.0, // Card height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('images/Rectangle 1.png'), // Image path
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.4), // Gradient effect on image
          ],
        ),
      ),
      child: Stack(
        children: [
          // Top-left frame with "20m"
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Text(
                '20m',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 8.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 0.02,
                ),
              ),
            ),
          ),

          // Name Text: "Anshika Rathour"
          Positioned(
            bottom: 45,
            left: 16,
            child: Text(
              'Riya Bisht',
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 0.02,
                height: 1.2,
              ),
            ),
          ),

          // Subtitle Text: "UX Designer at Google"
          Positioned(
            bottom: 25,
            left: 16,
            child: Text(
              'UX Designer at Google',
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 10.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 0.02,
                height: 1.2,
              ),
            ),
          ),

          // Image Frame Text (Just for alignment)
          Positioned(
            bottom: 10,
            left: 16,
            child: Container(
              width: 109.0, // Width of the frame
              height: 33.0, // Height of the frame
              child: Text(''), // Placeholder text for the frame
            ),
          ),
        ],
      ),
    );
  }
}


