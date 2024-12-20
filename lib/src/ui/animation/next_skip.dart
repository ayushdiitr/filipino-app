import 'package:flutter/material.dart';

class NextSkipButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adding padding around the content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First button (Skip)
          Container(
            //width: 342, // Fixed width
            height: 42, // Fixed height
            //padding: EdgeInsets.only(top: 10), // Padding for the button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color(0xFF1C1B1C), // Neutral-600 color
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Align(
              alignment: Alignment.center, // Center the text within the button
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.57, // Line height equivalent to 22px
                  letterSpacing: 0.04,
                  color: Colors.black, // Text color for Skip button
                ),
              ),
            ),
          ),
          SizedBox(height: 10), // Gap between buttons
          // Second button (Next)
          Container(
            //width: 342, // Fixed width
            height: 42, // Fixed height
            //padding: EdgeInsets.only(top: 10), // Padding for the button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFF1F1F1F), // Primary-700 color for background
            ),
            child: Align(
              alignment: Alignment.center, // Center the text within the button
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.57, // Line height equivalent to 22px
                  letterSpacing: 0.04,
                  color: Color(0xFFFFFFFF), // White text color for Next button
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
