import 'package:flutter/material.dart';

class PromptTextScreen extends StatelessWidget {
  const PromptTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust padding around the whole screen
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Prompt Text
              Container(
                width: 64,
                height: 19,
                alignment: Alignment.centerLeft,
                color: const Color(0xFF1F1F1F), // Background color
                child: const Text(
                  'Prompt 1',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 19.2 / 16, // Line height ratio
                    color: Colors.white, // Text color (assuming white for contrast)
                  ),
                ),
              ),
              const SizedBox(height: 16), // Space between texts
              // Lorem Ipsum Text
              Container(
                width: 334,
                height: 47,
                color: const Color(0xFF3F4A61), // Background color
                child: const Padding(
                  padding: EdgeInsets.all(8.0), // Adjust padding inside the container
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Vulputate molestie eget eget tellus ipsum adipiscing et congue vulputate.',
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 47 / 14, // Line height ratio (estimated)
                      letterSpacing: 0.02,
                      color: Colors.white, // Text color (assuming white for contrast)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
