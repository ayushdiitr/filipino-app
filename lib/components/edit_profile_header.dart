import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class EditProfileHeader extends StatefulWidget {
  final bool hasScrolled;

  const EditProfileHeader({super.key, required this.hasScrolled});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for 'Preview' button and 'Edit Profile' text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 25.91 / 30,
                letterSpacing: 2,
                color: Color(0xFF000000),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your navigation or animation logic here
                // print("Preview button clicked");
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Preview',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Colors.white,
                    height: 16.8 / 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        widget.hasScrolled
            ? const Text(
                'Complete your profile for a better chance of matching',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 16.8 / 14,
                  letterSpacing: 2,
                  color: Color(0xFF1F1F1F),
                ),
              )
            : Container(),

        widget.hasScrolled ? SizedBox(height: 12) : Container(),
        // Progress bar container
        widget.hasScrolled
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFEEEEEE)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 5,
                        child: LinearProgressIndicator(
                          value: 0.85,
                          color: Colors.black,
                          backgroundColor: const Color(0xFFEEEEEE),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Space between progress bar and text
                    const Text(
                      '85% Complete',
                      style: TextStyle(
                        fontFamily: 'NoirPro',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.02,
                        color: Color(0xFF1F1F1F),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 0),
        // const SizedBox(height: 20),
      ],
    );
  }
}
