import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeadingSection extends StatefulWidget {
  @override
  _HeadingSectionState createState() => _HeadingSectionState();
}

class _HeadingSectionState extends State<HeadingSection> {
  final TextEditingController _controller = TextEditingController();
  int currentCharCount = 0; // Initialize character count

  @override
  void initState() {
    super.initState();
    // Add listener to update character count
    _controller.addListener(() {
      setState(() {
        currentCharCount = _controller.text.length; // Update character count
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFE3FCEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'My Heading',
            style: TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF1F1F1F),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Complete your profile for better chance of matching',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.2,
              letterSpacing: 0.02,
              color: Color(0xFF3F4A61),
            ),
          ),
          const SizedBox(height: 12), // Gap before the prompt box

          // Prompt box with character count
          SizedBox(
            width: double.infinity,
            height: 52,
            child: Stack(
              children: [
                TextField(
                  controller: _controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50), // Max 50 characters
                  ],
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Colors.black,
                    hintText: "Add a prompt",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFEEEEEE),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(75, 75, 75, 1),
                        width: 0.7,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.02,
                      color: Color(0xFFADB7CC),
                    ),
                  ),
                ),
                // Character count overlay
                Positioned(
                  right: 10, // Adjust as needed
                  bottom: 12, // Adjust to position it properly
                  child: Text(
                    '$currentCharCount/50', // Display character count
                    style: const TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      letterSpacing: 0.02,
                      color: Color(0xFFCACACA),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
