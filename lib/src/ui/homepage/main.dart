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
  late ScrollController _scrollController;
  late bool hasScrolled = true;
  Color _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Listen to scroll changes
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Change color when scrolled beyond 0.0 offset
        if (_scrollController.offset > 50.0) {
          if (_appBackgroundColor != Colors.white) {
            setState(() {
              _appBackgroundColor = Colors.white;
              hasScrolled = false;
            });
          }
        } else {
          if (_appBackgroundColor != const Color.fromRGBO(245, 245, 245, 1)) {
            setState(() {
              hasScrolled = true;
              _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: HeaderButtons(),
            );
          }, childCount: 1)),
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: _appBackgroundColor,
            // stretchTriggerOffset: 50,
            toolbarHeight: 72,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: _appBackgroundColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: ProfileHeader(
                    name: 'Anshika',
                    bio: 'SWE',
                    isVerified: true,
                    hasScrolled: hasScrolled,
                  ),
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
                ],
              ),
            );
          }, childCount: 1)),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: 'close',
                onPressed: () {},
                backgroundColor: Colors.black,
                tooltip: 'Dislike',
                child: Center(
                  child: Transform.rotate(
                    angle: -180 * 3.1416 / 180, // Rotate by -45 degrees
                    child: const Icon(
                      Icons.close, // Close (cross) icon
                      size: 27.36, // Width and height for the cross symbol
                      color: Colors.white, // White color for the cross symbol
                    ),
                  ),
                )),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: 'like',
              onPressed: () {},
              backgroundColor: Colors.black,
              tooltip: 'Send a like',
              child: const Center(
                child: Icon(
                  Icons.favorite_outline,
                  size: 27.36,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
