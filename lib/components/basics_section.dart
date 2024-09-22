import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BasicsSection extends StatefulWidget {
  @override
  State<BasicsSection> createState() => _BasicsSectionState();
}

class _BasicsSectionState extends State<BasicsSection> {
  List<String> prompts = [
    'Write a fun and punchy intro',
    'Add a prompt',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF), // var(--White, #FFFFFF)
          border: Border.all(
            color: const Color(0xFFEEEEEE), // var(--Neutral-200, #EEEEEE)
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basics',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.02,
              ),
            ),
            SizedBox(height: 2),
            Text.rich(
              TextSpan(
                text: 'Choose the interests',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  height: 1.2, // line-height: 14.4px
                  letterSpacing: 0.02,
                  color: Color(0xFF3F4A61), // var(--Secondary-600, #3F4A61)
                ),
              ),
            ),
            ...prompts
                .map((i) => Row(
                      children: [
                        const SizedBox(height: 8),
                        const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            hintText: "Add a prompt",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xFFE1E1E1),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 10.0,
                            ), // Padding to center the hint text
                            hintStyle: const TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.02,
                              color: Color.fromRGBO(75, 75, 75, 1),
                            ),
                          ),
                        ),
                      ],
                    ))
                .toList()
          ],
        ));
  }
}
