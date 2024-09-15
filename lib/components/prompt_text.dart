import 'package:flutter/material.dart';

class PromptTextScreen extends StatelessWidget {
  final String promptTitle;
  final String promptDesc;
  final bool hasButton;

  const PromptTextScreen({
    Key? key,
    required this.promptTitle,
    this.promptDesc = '',
    this.hasButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(16.0), // Adjust padding around the whole screen
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Prompt Text
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              promptTitle,
              style: const TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Text color (assuming white for contrast)
              ),
            ),
          ),
          const SizedBox(height: 12), // Space between texts
          // Lorem Ipsum Text
          if (hasButton)
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color.fromRGBO(235, 235, 235, 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 5,
                  ),
                  child: const Text(
                    'Hindi',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      letterSpacing: 0.12,
                      color: Colors
                          .black, // Text color (assuming white for contrast)
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color.fromRGBO(235, 235, 235, 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 5,
                  ),
                  child: const Text(
                    'English',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      letterSpacing: 0.02,
                      color: Colors
                          .black, // Text color (assuming white for contrast)
                    ),
                  ),
                ),
              ],
            ),
          Text(
            promptDesc,
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.02,
              color: Colors.black, // Text color (assuming white for contrast)
            ),
          ),
        ],
      ),
    );
  }
}
