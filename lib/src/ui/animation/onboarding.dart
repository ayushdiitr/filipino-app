import 'package:flutter/material.dart';
import 'package:testapp/src/ui/animation/next_skip.dart';

class OnboardingScreen extends StatelessWidget {
  final String currentPath;

  const OnboardingScreen({Key? key, required this.currentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Count Row with 1/3 on the right corner
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome to Filipino Flare!",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 24 / 18,
                          letterSpacing: 0.04,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 22,
                        height: 22,
                        child: const Text(
                          '1/3',
                          style: TextStyle(
                            fontFamily: 'NoirPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 22 / 14,
                            letterSpacing: 0.04,
                            color: Color(0xFF4D4D4D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Subtitle
                  const Text(
                    "Discover meaningful connections and explore the vibrant Filipino dating scene. Swipe through profiles and start meeting exciting people today!",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 22 / 14,
                      letterSpacing: 0.04,
                      color: Color(0xFF4D4D4D),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Image and buttons
                  Expanded(
                    child: Hero(
                      tag: 'iPhone',
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'images/iPhone.png',
                              fit: BoxFit
                                  .contain, // Ensures the image scales proportionally
                            ),
                          ),
                          NextSkipButtons(currentPath: currentPath),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
