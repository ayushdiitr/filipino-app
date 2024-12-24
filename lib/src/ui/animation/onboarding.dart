import 'package:flutter/material.dart';
import 'package:testapp/src/ui/animation/iphone.dart';
import 'package:testapp/src/ui/animation/next_skip.dart';
import 'package:testapp/src/ui/animation/meetups.dart';
import 'package:testapp/src/ui/animation/match.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Count Row with 1/3 on the right corner
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Space between to push elements apart
                  children: [
                    Text(
                      "Welcome to Filipino Flare!",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 24 / 18,
                        letterSpacing: 0.04,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 22,
                      // decoration: BoxDecoration(
                      //   color: Color(0xFF4D4D4D), // Secondary-Text color
                      //   borderRadius: BorderRadius.circular(11),
                      // ),
                      child: Text(
                        '1/3',
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                          color: Color(0xFF4D4D4D),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Subtitle
                Text(
                  "Discover meaningful connections and explore the vibrant Filipino dating scene. Swipe through profiles and start meeting exciting people today!",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 22 / 14,
                    letterSpacing: 0.04,
                    color: Color(0xFF4D4D4D), // Secondary-Text color
                  ),
                ),
                SizedBox(height: 20),

                Column(
                  children: [
                    iPhonePhoto(),
                    NextSkipButtons(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
