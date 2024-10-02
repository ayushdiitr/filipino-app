import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title: Explore
          Text(
            'Explore',
            style: const TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.15,
              letterSpacing: 0.02,
              color: Color(0xFF000000), // Primary heading color
            ),
          ),
          const SizedBox(height: 8), // Spacing between title and subtitle
          // Subtitle
          Text(
            'Embark on a Journey of Discovery: Find shared interests, and connect with travellers effortlessly',
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.2, // Equivalent to line-height: 16.8px
              letterSpacing: 0.02,
              color: Color(0xFF4D4D4D), // Secondary text color
            ),
          ),
          const SizedBox(height: 20),
          //const SizedBox(width: 24),
           // Spacing between subtitle and images

          // Row with three images and their corresponding text
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // First image and text
              Column(
                children: [
                  Container(
                    width: 71.5,
                    height: 70,
                    child: Image.asset("images/title.png"),
                    decoration: BoxDecoration(
                      color: Colors.grey, // Replace with your image
                      borderRadius:  BorderRadius.circular(8),
                        
                      ),
                    ),
                  
                  const SizedBox(height: 10),
                  const Text(
                    '✨ New',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2, // Equivalent to line-height: 14.4px
                      letterSpacing: 0.02,
                      color: Color(0xFF000000), // Primary text color
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Second image and text
              
              Column(
                children: [
                  Container(
                    width: 71.5,
                    height: 70,
                    child: Image.asset("images/title.png"),
                    decoration: BoxDecoration(
                      color: Colors.grey, // Replace with your image
                      borderRadius:  BorderRadius.circular(8),
                        
                      ),
                    ),
                  
                  const SizedBox(height: 10),
                  const Text(
                    '✅ Verified',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2, // Equivalent to line-height: 14.4px
                      letterSpacing: 0.02,
                      color: Color(0xFF000000), // Primary text color
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Third image and text
              Column(
                children: [
                  Container(
                    width: 71.5,
                    height: 70,
                    child: Image.asset("images/title.png"),
                    decoration: BoxDecoration(
                      color: Colors.grey, // Replace with your image
                      borderRadius:  BorderRadius.circular(8),
                      
                      ),
                    ),
                  
                  const SizedBox(height: 10),
                  const Text(
                    '🟢 Active',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2, // Equivalent to line-height: 14.4px
                      letterSpacing: 0.02,
                      color: Color(0xFF000000), // Primary text color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
