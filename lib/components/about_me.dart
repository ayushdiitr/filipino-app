import 'package:flutter/material.dart';
import 'package:testapp/components/details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              "ABOUT ME",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0.12,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: const Text(
                "Lorem ipsum dolor sit amet consectetur. Ullamcorper massa ut placerat nunc lacinia. Tortor vel ultrices elementum magna suscipit ipsum eget vel. Enim enim tempor at viverra ut leo quis egestas. Facilisis amet mattis facilisi consectetur ultrices dolor iaculis ac.",
                style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              child: const Text(
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
