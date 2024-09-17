import 'package:flutter/material.dart';

class HeaderButtons extends StatelessWidget {
  final bool isVerified;

  const HeaderButtons({
    super.key,
    this.isVerified = false, // Assuming verified is optional
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24), // Space between texts
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: 1 > 0 ? Colors.black : Colors.white,
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Text(
                'All',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(width: 10), // Spacing between buttons
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Text(
                'Top Matches',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(width: 10), // Spacing between buttons
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: const Text(
                'Filters',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
