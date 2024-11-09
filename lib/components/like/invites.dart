import 'package:flutter/material.dart';

class InvitesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth, // Fill the entire screen width
      height: 232.0, // Fixed height
      padding: EdgeInsets.fromLTRB(17.0, 3.0, 17.0, 20.0), // Padding (left, top, right, bottom)
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(
          color: Color(0xFF9B9B9B), // Border color #9B9B9B (gray)
          width: 1.0, // Border width
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center everything vertically
        children: [
          // Image
          Opacity(
            opacity: 1.0, // Set opacity to 1.0 (fully visible)
            child: Image.asset(
              'images/sadness.png', // Replace with your image path
              width: 90.0, // Image width
              height: 90.0, // Image height
            ),
          ),
          
          SizedBox(height: 10), // Gap between the image and title

          // Title Text
          Opacity(
            opacity: 1.0, // Fully visible (change to 0.0 to make invisible)
            child: Text(
              'NO INVITIES YET',
              style: TextStyle(
                fontFamily: 'NoirPro', // Font family (ensure it's available)
                fontSize: 16.0, // Font size
                fontWeight: FontWeight.w600, // Font weight
                height: 19.2 / 16, // Line height
                letterSpacing: 0.02, // Letter spacing
                //textAlign: TextAlign.center, // Center alignment
                decoration: TextDecoration.none, // No underline
                color: Colors.black, // Text color
              ),
            ),
          ),

          SizedBox(height: 7), // Gap between title and subtitle

          // Subtitle Text
          Opacity(
            opacity: 0.7, // 70% opacity (adjust as needed)
            child: Text(
              'Complete your profile for better chance of matching',
              style: TextStyle(
                fontFamily: 'NoirPro', // Font family
                fontSize: 14.0, // Font size
                fontWeight: FontWeight.w400, // Font weight
                height: 16.8 / 14, // Line height
                letterSpacing: 0.02, // Letter spacing
                //textAlign: TextAlign.center, // Center alignment
                decoration: TextDecoration.none, // No underline
                color: Colors.black, // Text color
              ),
            ),
          ),

          SizedBox(height: 22), // Gap between subtitle and button

          // Button Frame (Container with border)
          Container(
            width: 129.0, // Width of the frame
            height: 37.0, // Height of the frame
            //padding: EdgeInsets.only(top: 10.0), // Padding at the top
            decoration: BoxDecoration(
              color: Colors.transparent, // Transparent background
              borderRadius: BorderRadius.circular(64), // Rounded corners
              border: Border.all(
                color: Colors.black, // Border color
                width: 1.0, // Border width
              ),
            ),
            child: Center(
              // Button Text inside the frame
              child: Opacity(
                opacity: 1.0, // Fully visible (change to 0.0 to make invisible)
                child: Text(
                  'Complete Profile',
                  style: TextStyle(
                    fontFamily: 'NoirPro', // Font family
                    fontSize: 14.0, // Font size
                    fontWeight: FontWeight.w400, // Font weight
                    height: 16.8 / 14, // Line height
                    letterSpacing: 0.02, // Letter spacing
                    //textAlign: TextAlign.center, // Center alignment
                    decoration: TextDecoration.none, // No underline
                    color: Colors.black, // Text color
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

