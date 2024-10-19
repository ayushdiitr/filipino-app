import 'package:flutter/material.dart';

class ProfileQueues extends StatelessWidget {
  ProfileQueues({super.key});

  final List<String> languages = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: Row(
          children: [
            ...languages.map(
              (language) => Padding(
                padding:
                    const EdgeInsets.only(right: 16), // Space between items
                child: Stack(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(73),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3AC482), Color(0xFF0FCBDF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(73),
                        child: Image.asset(
                          'images/viewer.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AC482),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
