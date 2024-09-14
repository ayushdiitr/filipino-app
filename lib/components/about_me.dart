import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Row"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,  // This makes the column take only the necessary space
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 8),  // Adds space between the icon and text
                  Text("Gender", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,  // This makes the column take only the necessary space
                children: [
                  Icon(Icons.location_on),
                  SizedBox(height: 8),  // Adds space between the icon and text
                  Text("Location", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,  // This makes the column take only the necessary space
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(height: 8),  // Adds space between the icon and text
                  Text("Age", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

