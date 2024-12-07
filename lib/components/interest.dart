import 'package:flutter/material.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'INTERESTS',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 0.12,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          // Interests boxes
          Wrap(
            spacing: 10, // Gap between boxes
            runSpacing: 10, // Gap between rows
            children: [
              interestBox('🚜 Machine'),
              interestBox('🧦 Textile'),
              interestBox('🧑‍🎨 Design'),
              interestBox('🧑‍🎨 Design'),
              interestBox('🎨 Arts'),
            ],
          ),
        ],
      ),
    );
  }

  Widget interestBox(String text) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 102,
        minHeight: 37,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA), // Background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
        ),
        border: Border.all(
          color: const Color(0xFFF5F5F5), // Border color
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
