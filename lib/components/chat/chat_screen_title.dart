import 'package:flutter/material.dart';

class ChatScreenTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const ChatScreenTitle(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title: Explore
          Text(
            title,
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
            subtitle,
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
            children: [],
          ),
        ],
      ),
    );
  }
}
