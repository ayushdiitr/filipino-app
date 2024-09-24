import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BioSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const BioSection({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 390,
      //height: 129,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF), // var(--Status-Success-100, #E3FCEF)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // "My Heading" text
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Baskerville',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.2, // Line-height: 17.28px
              letterSpacing: 0.02,
              color: Color(0xFF1F1F1F), // var(--Primary-700, #1F1F1F)
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.2, // Line-height: 16.8px
              letterSpacing: 0.02,
              color: Color(0xFF3F4A61), // var(--Secondary-600, #3F4A61)
            ),
          ),
          SizedBox(height: 12),

          // Prompt box
          SizedBox(
            width: double.infinity,
            height: 83,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  isDense: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
