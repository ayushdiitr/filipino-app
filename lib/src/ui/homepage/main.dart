import 'package:flutter/material.dart';
import 'package:testapp/components/details_card.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/post_list.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/components/top_buttons.dart';
import 'package:testapp/src/ui/splash/screen2.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/prompt_text.dart';
import 'package:testapp/components/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: HeaderButtons(),
            );
          }, childCount: 1)),
          const SliverAppBar(
            pinned: true,
            floating: true,
            // stretchTriggerOffset: 50,
            toolbarHeight: 72,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: ProfileHeader(
                  name: 'Anshika',
                  bio: 'SWE',
                  isVerified: true,
                ),
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12.0), // Restores original padding
              child: Column(
                children: [
                  // SizedBox(height: 24),
                  SquareImageWithButton(
                    imgUrl:
                        "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                  SizedBox(height: 16),
                  CardRow(),
                  HomeScreen(),
                  SizedBox(height: 16),
                  PromptTextScreen(
                    promptTitle: 'You have reached the end of the page',
                    promptDesc: 'Would you like to see more?',
                  ),
                  SizedBox(height: 20),
                  CloseButtonScreen(),
                  SizedBox(height: 20),
                ],
              ),
            );
          }, childCount: 1)),
        ],
      ),
    );
  }
}
