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
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Space between text and icon buttons
      crossAxisAlignment:
          CrossAxisAlignment.center, // Ensure overall vertical centering
      children: [
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center text and icons vertically
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align content of column to the start
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center name and verified icon vertically
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
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center bio, dot, and active text vertically
                  children: [
                    Text(
                      bio,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(108, 108, 108, 1),
                        fontFamily: 'NoirPro',
                      ),
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
        // Right side icon buttons, centered vertically
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the icons vertically
          children: [
            if (hasScrolled)
              IconButton(
                icon: const Icon(Icons.keyboard_return),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
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
