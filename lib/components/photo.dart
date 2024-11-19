import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testapp/src/ui/homepage/msg_popup.dart';

class SquareImageWithButton extends StatelessWidget {
  final String imgUrl;

  const SquareImageWithButton({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Forces the aspect ratio to be square
      child: Stack(
        children: [
          // The image
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Optional: For rounded corners
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover, // Ensures the image covers the entire square
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          
          // Title and Subtitle at the bottom center just above the buttons
          Positioned(
            //top: 488,
            bottom: 110, // Position the text block above the buttons
            left: 20,
            right: 0, // Stretch it across the full width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title - "Riya Bhist"
                Container(
                  //width: 326, // Fixed width for the title container
                  //height: 48, // Fixed height
                  // decoration: BoxDecoration(
                  //   color: Colors.transparent, // No background color
                  // ),
                  child: Center(
                    child: Text(
                      "koko_123",
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.02,
                        height: 30.98 / 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height:5), // Space between title and subtitle

                // Subtitle - "UX Designer"
                Container(
                  width: 326, // Fixed width for the subtitle container
                  height: 17, // Fixed height
                  // decoration: BoxDecoration(
                  //   color: Colors.transparent, // No background color
                  // ),
                  child: Center(
                    child: Text(
                      "UX Designer",
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.02,
                        height: 16.9 / 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Button 
          Positioned(
            //top: 678,
            bottom: 30,
            right: 47, 
            left: 47, 
            child: Container(
              width: 296, 
              height: 56, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread buttons evenly
                children: [
                  // Button 1
                  Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F), // Primary dark color
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Button 1 tapped");
                      },
                      child: Image.asset('images/return.png'),
                    ),
                  ),
                  SizedBox(width:10),
                  // Button 2
                  Container(
                    width: 56,
                    height: 56,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Button 2 tapped");
                      },
                      child: Image.asset('images/dislike.png'),
                    ),
                  ),
                  SizedBox(width:10),
                  // Button 3
                  Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Button 3 tapped");
                      },
                      child: Image.asset('images/verified.png'),
                    ),
                  ),
                  SizedBox(width:10),
                  // Button 4
                  Container(
                    width: 56,
                    height: 56,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Button 4 tapped");
                      },
                      child: Image.asset('images/fav.png'),
                    ),
                  ),
                  SizedBox(width:10),
                  // Button 5
                  Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Button 5 tapped");
                      },
                      child: Image.asset('images/msg.png'),
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
