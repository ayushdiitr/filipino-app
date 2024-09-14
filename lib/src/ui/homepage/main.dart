import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/post_list.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/src/ui/splash/screen2.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/prompt_text.dart';
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
      body: SingleChildScrollView(
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              HomeScreen(),
              SquareImageWithButton(
                  imgUrl:
                      "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              PromptTextScreen(
                promptTitle: 'LANGUAGES I KNOW',
                hasButton: true,
                // promptDesc:
                //     'Lorem ipsum dolor sit amet consectetur. Vulputate molestie eget eget tellus ipsum adipiscing et congue vulputate.',
              ),
              PromptTextScreen(
                promptTitle: 'Prompt 1',
                promptDesc:
                    'Lorem ipsum dolor sit amet consectetur. Vulputate molestie eget eget tellus ipsum adipiscing et congue vulputate.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
