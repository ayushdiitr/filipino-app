import 'package:flutter/material.dart';

class ProfileStack extends StatelessWidget {
  final List<String> profileImages = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbitfieldconsulting.com%2Fposts%2Frandom-testing&psig=AOvVaw1JQr5tYyyP9ahTjGqvpoQf&ust=1729459191219000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPD0utmvm4kDFQAAAAAdAAAAABAE', // Replace with actual image URLs
    'https://images.squarespace-cdn.com/content/v1/5e10bdc20efb8f0d169f85f9/1626540043972-24ITZFD4GJ69DY1K7KDE/surfing-js.png?format=1500w',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEmsZS3noZ1lkqsSLVsIo-HbNNuQVNEsNmOjE35sVt_wenW9MQdr1ykvXzRuVm6tWFO9U&usqp=CAU',
  ];
  final String additionalProfilesText = "50+";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Define height for the Stack
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Loop through the profile images
          for (int i = 0; i < profileImages.length; i++)
            Positioned(
              left: i * 20.0, // Adjust overlap as needed
              child: CircleAvatar(
                radius: 30, // Adjust size as needed
                backgroundImage: NetworkImage(profileImages[i]),
              ),
            ),
          // Text for additional profiles
          Positioned(
            left: profileImages.length * 20.0, // Position after the last image
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.teal, // Background color for text
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                additionalProfilesText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
