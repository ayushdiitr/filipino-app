import 'package:flutter/material.dart';
import 'package:testapp/src/ui/animation/meetups.dart';
import 'package:testapp/src/ui/animation/next_skip.dart';

class OnboardingScreen2 extends StatelessWidget {
  final String currentPath;

  const OnboardingScreen2({Key? key, required this.currentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Title and Count Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "2. Send Connection Requests and Plan Meet-Ups",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 24 / 18,
                        letterSpacing: 0.04,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    alignment: Alignment.center,
                    width: 22,
                    height: 22,
                    child: Text(
                      '1/3',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.04,
                        color: Color(0xFF4D4D4D),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Subtitle
              Text(
                "Send Buddy Requests. Once Accepted, plan meet-ups, seek advice, and make the most of your travel experience.",
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 22 / 14,
                  letterSpacing: 0.04,
                  color: Color(0xFF4D4D4D),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(height: 20),
              // Image and Next/Skip Buttons
              Expanded(
                child: Column(
                  children: [
                    // MeetupScreen should take available space but not overflow
                    Expanded(
                      child: MeetupScreen(),
                    ),
                    // SizedBox(height: 20), // Adjust spacing as needed
                    NextSkipButtons(currentPath: currentPath),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
