import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the frames
        child: Column(
          children: [
            frame3639(), // Frame 1
            SizedBox(height: 10), // Space between frames
            frame3639(), // Frame 2
            SizedBox(height: 10), // Space between frames
            frame3639(), // Frame 3
          ],
        ),
      ),
    );
  }

  Widget frame3639() {
    return Container(
      width: double.infinity, // Fill width (similar to 366px)
      height: 52, // Fixed height
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEEEEEE), // Neutral-200 color
            width: 1, // 1px border bottom
          ),
        ),
      ),
      child: Row(
        children: [
          // Add your inner elements here
        ],
      ),
    );
  }
}
