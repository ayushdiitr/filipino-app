import 'package:flutter/material.dart';
import 'package:testapp/src/ui/splash/interest_copy.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                interestBox('🚜 Machine', context),
                interestBox('🧦 Textile', context),
                interestBox('🧑‍🎨 Design', context),
                interestBox('🧑‍🎨 Design', context),
                interestBox('🎨 Arts', context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget interestBox(String text, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InterestSelectionScreen(),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
