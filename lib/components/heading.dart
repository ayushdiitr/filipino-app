import 'package:flutter/material.dart';

class HeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 390, // Full width
      //height: 129, // Hug (129px)
      padding: const EdgeInsets.symmetric(vertical: 16), // Padding for green box
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
          Container(
            width: double.infinity, // Fill width (358px in this case)
            height: 40, // Hug height (47px)
            padding: const EdgeInsets.only(top: 16), // Padding 16px from the top
            decoration: BoxDecoration(
              color: Colors.white, // var(--White, #FFFFFF)
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4), // Border radius: 4px for top-left
              ),
              border: Border.all(
                color: const Color(0xFFEEEEEE), // var(--Neutral-200, #EEEEEE)
                width: 1, // 1px border
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16), // Padding for text
              child: Text(
                'e.g. Photographer at Walter white',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  height: 1.25, // Line-height: 15px
                  letterSpacing: 0.02,
                  color: Color(0xFFADB7CC), // var(--Secondary-200, #ADB7CC)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
