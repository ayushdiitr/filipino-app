import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreHeader extends StatelessWidget {
  final String currentPath;
  const ExploreHeader({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24), // Space between texts
        Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Add space between text and image
          children: [
            Text(
              currentPath,
              style: const TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.02,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "images/close_explore_btn.png",
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
