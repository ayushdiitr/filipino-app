import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/post_list.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/src/ui/splash/screen2.dart';
import 'package:testapp/components/about_me.dart';
//import 'package:sign_in_button/sign_in_button.dart';
//import 'package:testapp/src/ui/screens/splash/screen2.dart';
//import 'package:testapp/src/ui/screens/splash/interest.dart';
//import 'package:testapp/src/ui/screens/splash/screen2.dart';
//import 'package:testapp/src/ui/screens/splash/lifestyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileHeader(
              name: 'Riya Bisht',
              bio: 'Photographer',
              isVerified: true,
            ),
            SizedBox(height: 16),
            SquareImageWithButton(
                imgUrl:
                    "data:image/jpeg;base64,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"),
          ],
        ),
      ),
    );
  }
}
