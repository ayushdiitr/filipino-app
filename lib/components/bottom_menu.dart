import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          top: 10, // Padding: 10px at the top
          bottom: 4, // Padding: 4px at the bottom
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(255, 255, 255, 1), // White background
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60, // Hugged height: 60px
              width: 390, // Fixed width: 390px
              color: Colors.black, // Black background to make the box visible
            ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MaterialApp(home: Scaffold(body: BottomMenu())));
