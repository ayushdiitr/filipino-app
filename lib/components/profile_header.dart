import 'package:flutter/material.dart';
import 'package:testapp/components/profile_text.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String bio;

  ProfileHeader(
      {required this.imageUrl, required this.name, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(height: 8),
        ProfileText(name, style: TextStyle(fontSize: 24)),
        ProfileText(bio),
      ],
    );
  }
}
