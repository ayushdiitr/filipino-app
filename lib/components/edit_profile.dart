import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
      children: [
        // Row to position the 'Preview' button at the top right
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 25.91 / 30, // Line height
                letterSpacing: 2, // Letter spacing
                color: Color(0xFF000000), // Pure black background color
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your navigation or animation logic here
                // print("Preview button clicked");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black, // Box background color (black)
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Preview',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Colors.white, // White text color
                    height: 16.8 / 14, // Line height
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Gap between the two texts
        const Text(
          'Complete your profile for better chance of matching',
          style: TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            height: 16.8 / 14, // Line height
            letterSpacing: 2,
            color: Color(0xFF1F1F1F), // Primary-700 background color
          ),
        ),
        const SizedBox(height: 12), // Gap of 12px before the box
        // Box with progress bar and 85% complete text
        Container(
          width: double.infinity,
          height: 30,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white, // Box background color (white)
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
            border: Border.all(
              color: const Color(0xFFEEEEEE), // Primary-200 border color
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Linear progress bar representing 85% completion
              Stack(
                children: [
                  Container(
                    width: 230, // Slider width
                    height: 5,  // Slider height
                    decoration: const BoxDecoration(
                      color: const Color(0xFFE1E1E1), // Neutral-300 background color
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                  Container(
                    width: 165, // Black bar width representing 85%
                    height: 6,  // Black bar height
                    decoration: const BoxDecoration(
                      color: Colors.black, // Black bar color
                      borderRadius: const BorderRadius.all(
                         Radius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
              // "85% Complete" text
              const Text(
                '85% Complete',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.02,
                  color: Color(0xFF1F1F1F), // Primary-700 text color
                  height: 14.4 / 12, // Line height
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
