import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TalkAboutScreen extends StatefulWidget {
  const TalkAboutScreen({super.key});

  @override
  _TalkAboutScreenState createState() => _TalkAboutScreenState();
}

class _TalkAboutScreenState extends State<TalkAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0), // Adjusted bottom padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 1.0,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 32.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Give them Something to your ',
                        style: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Talk about ',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      "Choose your height to help us find matches that meet your preferences.",
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Prompt boxes
                  _buildPromptBox('First Prompt'),
                  const SizedBox(height: 10), // Space between boxes
                  _buildPromptBox('Second Prompt'),
                  const SizedBox(height: 10), // Space between boxes
                  _buildPromptBox('Third Prompt'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle next action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F1F1F), // Primary-700 color
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Next'),
                    ),
                  ),
                  const SizedBox(height: 10), // Space between buttons
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: TextButton(
                      onPressed: () {
                        // Handle skip action
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF1F1F1F), // Primary-700 color
                        textStyle: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 22 / 14,
                          letterSpacing: 0.04,
                        ),
                      ),
                      child: const Text('Skip'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the Prompt Box with text and select button
  Widget _buildPromptBox(String promptText) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      
      width: 358, // Fixed width
      height: 56, // Fixed height
      //margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),

        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(4),
        //   bottomLeft: Radius.circular(4),
        // ),
        border: Border.all(
          color: const Color(0xFFCCCCCC), // Border color: Black-20
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            promptText,
            style: const TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.57, // Line height (22px)
              letterSpacing: 0.04,
              color: Color(0xFF8E8E8E), // Primary-500 color
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle select action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F1F1F), // Primary-700 color
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Select',
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white, // Text color for contrast with dark button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
