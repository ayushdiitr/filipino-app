import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
        children: [
          
          Expanded(
            child: Container(
              width: screenWidth,
              height: 52.0,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), // Fully rounded corners for all sides
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
                children: [
                  Image.asset(
                    'images/cross.png', // Ensure image path is correct
                    width: 18.0,
                    height: 18.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Not For Me",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      color: Colors.black, // Set text color to black
                    ),
                  ),
                ],
              ),
            ),
          ),

          
          SizedBox(width: 10), 

          
          Expanded(
            child: Container(
              width: screenWidth,
              height: 52.0,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), // Fully rounded corners for both sides
                color: Colors.black, // Black background for "Like" button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
                children: [
                  Image.asset(
                    'images/heart.png', // Ensure image path is correct
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Like",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.02,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
