import 'package:flutter/material.dart';

class LikeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // Set the height of the header
      color: Colors.white, // Set the background color
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // Optional: Add horizontal padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Image.asset(
                'images/back.png', // Your custom back button image
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),

          // Title
          Container(
            //width: 92.0,
            //height: 21.0,
            child: Text(
              'Riya Bhist',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.02,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // 3 Dots Icon
          GestureDetector(
            onTap: () {
              // Define your 3 dots action here
            },
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: Color(0xFF1C1B1F),
            ),
          ),
        ],
      ),
    );
  }
}
