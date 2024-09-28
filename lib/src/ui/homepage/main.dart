import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testapp/components/basics_section.dart';
import 'package:testapp/components/details_card.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/photo_popup.dart';
import 'package:testapp/components/profile_bio.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/components/prompt_text.dart';
import 'package:testapp/components/prompts.dart';
import 'package:testapp/components/top_buttons.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/components/verified.dart';
import 'package:testapp/components/heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class User {
  final String name;
  final String bio;
  final String imgUrl;
  final bool isVerified;
  final String? description;

  User({
    required this.name,
    required this.bio,
    required this.imgUrl,
    this.isVerified = false,
    required this.description,
  });
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool hasScrolled = false;
  Color _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);
  bool _showHeart = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  // List of users
  final List<User> _users = [
    User(
      name: 'Anshika',
      bio: 'SWE',
      imgUrl:
          "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isVerified: true,
      description: 'I am a software engineer',
    ),
    User(
      name: 'John Doe',
      bio: 'Graphic Designer',
      imgUrl:
          "https://images.unsplash.com/photo-1556740772-1a741367b93e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      isVerified: false,
      description: 'I am a graphic designer',
    ),
    // Add more users as needed
  ];

  int _currentUserIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Change color when scrolled beyond 50.0 offset
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

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Scale animation from 0 to 1
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    // Fade animation from 1 to 0
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    // Add the listener once
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showHeart = false; // Hide heart
          _currentUserIndex++; // Move to the next user
          if (_currentUserIndex >= _users.length) {
            _currentUserIndex =
                0; // Loop back to the first user or handle as needed
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No more profiles')),
            );
          }
        });
        _animationController.reset();
      }
    });
  }

  void _triggerHeartAnimation() {
    if (_users.isEmpty) return;

    setState(() {
      _showHeart = true; // Show heart
    });

    // Start animation
    _animationController.forward(from: 0);
  }

  void _triggerDislikeAction() {
    if (_users.isEmpty) return;

    setState(() {
      _currentUserIndex++;
      if (_currentUserIndex >= _users.length) {
        _currentUserIndex = 0; // Loop back or handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No more profiles')),
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _scrollController.dispose();
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure there are users to display
    if (_users.isEmpty) {
      return Scaffold(
        body: Center(child: Text('No more profiles')),
      );
    }

    // Get the current user
    final currentUser = _users[_currentUserIndex];

    return Scaffold(
      backgroundColor: _appBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: HeaderButtons(),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: _appBackgroundColor,
                toolbarHeight: 60,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: _appBackgroundColor,
                    child: Padding(
                      padding: !hasScrolled
                          ? const EdgeInsets.only(
                              left: 16,
                              right: 16.0,
                              top: 30,
                            )
                          : const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10),
                      child: ProfileHeader(
                        name: currentUser.name,
                        bio: currentUser.bio,
                        isVerified: currentUser.isVerified,
                        hasScrolled: hasScrolled,
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 12.0),
                          child: Column(
                            children: [
                              SquareImageWithButton(
                                imgUrl: currentUser.imgUrl,
                              ),
                              const SizedBox(height: 16),
                              const CardRow(),
                              const HomeScreen(),
                              const SizedBox(height: 16),
                              SquareImageWithButton(
                                imgUrl: currentUser.imgUrl,
                              ),
                              const SizedBox(height: 16),
                              const PromptTextScreen(
                                promptTitle: 'Prompt 1',
                                promptDesc:
                                    'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                              ),
                              const SizedBox(height: 16),
                              SquareImageWithButton(
                                imgUrl: currentUser.imgUrl,
                              ),
                              const SizedBox(height: 16),
                              const PromptTextScreen(
                                promptTitle: 'Prompt 1',
                                promptDesc:
                                    'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                              ),
                              const SizedBox(height: 16),
                              Verification(),
                              const SizedBox(height: 16),
                              ProfilePrompts(),
                              const PromptTextScreen(
                                promptTitle: 'Laptop',
                                hasButton: true,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        HeadingSection(),
                        BioSection(
                          title: 'My Bio',
                          subtitle: 'Write a fun and punchy intro',
                        ),
                        BasicsSection(
                          title: 'Basics',
                          subtitle: 'Choose your basics',
                        ),
                        BasicsSection(
                          title: 'Interests',
                          subtitle: 'Choose your interests',
                        ),
                        BioSection(
                          title: 'Languages I know',
                          subtitle: 'Choose the languages you know',
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  );
                }, childCount: 1),
              ),
            ],
          ),
          if (_showHeart)
            Positioned.fill(
              child: IgnorePointer(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                    Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: Icon(
                            Icons.favorite,
                            size: 200,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'dislike',
              onPressed: _triggerDislikeAction,
              backgroundColor: Colors.black,
              tooltip: 'Dislike',
              child: const Icon(
                Icons.close,
                size: 27.36,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            FloatingActionButton(
              heroTag: 'like',
              onPressed: _triggerHeartAnimation,
              backgroundColor: Colors.black,
              tooltip: 'Send a like',
              child: const Icon(
                Icons.favorite_outline,
                size: 27.36,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
