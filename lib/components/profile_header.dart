import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String bio;
  final bool isVerified;
  final bool hasScrolled;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.bio,
    this.hasScrolled = false,
    this.isVerified = false, // Assuming verified is optional
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Baskerville',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                        width: 11), // Spacing between name and verified icon
                    if (isVerified)
                      const Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.black, // Verified icon color
                      ),
                  ],
                ),
                const SizedBox(height: 2), // Spacing between name and bio
                Row(
                  children: [
                    Text(
                      bio,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(108, 108, 108, 1),
                          fontFamily: 'NoirPro'),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromRGBO(
                          0, 135, 90, 1), // Green dot for active status
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Active',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 14,
                        color: Color.fromRGBO(0, 135, 90, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Right side icon buttons
        Row(
          children: [
            if (hasScrolled)
              IconButton(
                icon: const Icon(Icons.keyboard_return),
                color: Colors.black,
                onPressed: () {
                  // Handle back action
                },
              ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              color: Colors.black,
              onPressed: () {
                // Handle more options action
              },
            ),
          ],
        ),
      ],
    );
  }
}
