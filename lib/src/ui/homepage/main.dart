import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            HomeScreen()
            // ProfileHeader(
            //   imageUrl: 'url_to_profile_picture',
            //   name: 'John Doe',
            //   bio: 'Coffee enthusiast, Traveler, Photographer',
            // ),
            // Expanded(
            //   child: PostList(posts: userPosts),
            // ),
          ],
        ),
      ),
    );
  }
}
