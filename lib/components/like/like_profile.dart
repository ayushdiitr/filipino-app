import 'package:flutter/material.dart';

class LikeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image with linear gradient
        Positioned(
          //left: -36, // Positioning the image
          child: Container(
            width: 438,
            height: 594,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('images/Rectangle 1.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD9D9D9),
                  Color(0xFFD9D9D9),
                  Color(0x00000000).withOpacity(0),
                  Color(0x66000000),
                ],
              ),
            ),
          ),
        ),
        
        // Text container on the image
        Positioned(
          top: 491,
          left: 20,
          child: Container(
            width: 326,
            height: 82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  'Riya Bhist',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    height: 26.4 / 22,
                    letterSpacing: 0.02,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // Gap between name and bio
                // Bio
                Text(
                  'UX Designer at Google',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 12 / 10,
                    letterSpacing: 0.02,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // Gap between bio and subtitle
                // Subtitle
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Eget vel diam cursus euismod.',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 14.4 / 12,
                    letterSpacing: 0.02,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
