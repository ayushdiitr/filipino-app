import 'package:flutter/material.dart';

class CloseButtonScreen extends StatelessWidget {
  const CloseButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0), // Adjust padding if needed
      child: Stack(
        children: [
          // Close button
          Positioned(
            child: GestureDetector(
              onTap: () {
                // Navigate to the next screen (you can define your navigation here)
                // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
              },
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 60,  // Fixed width
                  minHeight: 60, // Fixed height
                ),
                padding: const EdgeInsets.symmetric(vertical: 5), // Padding
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F), // Background color
                  borderRadius: BorderRadius.circular(12), // Circular border for all corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14), // Shadow color
                      spreadRadius: 0,
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12), // Shadow color
                      spreadRadius: 0,
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10), // Shadow color
                      spreadRadius: 0,
                      blurRadius: 7,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03), // Shadow color
                      spreadRadius: 0,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: -180 * 3.1416 / 180, // Rotate by -45 degrees
                    child: const Icon(
                      Icons.close, // Close (cross) icon
                      size: 27.36,  // Width and height for the cross symbol
                      color: Colors.white, // White color for the cross symbol
                    ),
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
