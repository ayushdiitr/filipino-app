import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 390, // Full width
      //height: 129, // Hug (129px)
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: 12), // Padding for green box
      decoration: const BoxDecoration(
        color: Color(0xFFE3FCEF), // var(--Status-Success-100, #E3FCEF)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // "My Heading" text
          const Text(
            'My Heading',
            style: TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2, // Line-height: 17.28px
              letterSpacing: 0.02,
              color: Color(0xFF1F1F1F), // var(--Primary-700, #1F1F1F)
            ),
          ),
          const SizedBox(height: 4), // Gap between "My Heading" and second text
          // "Complete your profile" text
          const Text(
            'Complete your profile for better chance of matching',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.2, // Line-height: 16.8px
              letterSpacing: 0.02,
              color: Color(0xFF3F4A61), // var(--Secondary-600, #3F4A61)
            ),
          ),
          const SizedBox(height: 12), // Gap before the prompt box

          // Prompt box
          SizedBox(
            width: double.infinity, // Fill width (358px in this case)
            height: 52, // Hug height (47px)
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0), // Padding for text
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50), // Max 50 characters
                ],
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusColor: Colors.black,
                  hintText: "Add a prompt",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(75, 75, 75, 1),
                      width: 0.7,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ), // Padding to center the hint text
                  hintStyle: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.02,
                    color: Color(0xFFADB7CC),
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
