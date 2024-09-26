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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late bool hasScrolled = false;
  Color _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);
  bool _showHeart = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

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
  }

  void _triggerHeartAnimation() {
    setState(() {
      _showHeart = true; // Show heart
    });

    // Start animation
    _animationController.forward(from: 0);

    // Hide heart after the animation is complete
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showHeart = false; // Hide heart
        });
        _animationController.reset();
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12.0),
                        child: Column(
                          children: [
                            const SquareImageWithButton(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                            const SizedBox(height: 16),
                            const CardRow(),
                            const HomeScreen(),
                            const SizedBox(height: 16),
                            const SquareImageWithButton(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                            const SizedBox(height: 16),
                            const PromptTextScreen(
                              promptTitle: 'Prompt 1',
                              promptDesc:
                                  'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                            ),
                            const SizedBox(height: 16),
                            const SquareImageWithButton(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                      const BasicsSection(
                        title: 'Basics',
                        subtitle: 'Choose your basics',
                      ),
                      const BasicsSection(
                        title: 'Interests',
                        subtitle: 'Choose your interests',
                      ),
                      BioSection(
                        title: 'Languages I know',
                        subtitle: 'Choose the languages you know',
                      ),
                      const SizedBox(height: 100),
                    ],
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
                            color: Colors.black,
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
              heroTag: 'close',
              onPressed: () {},
              backgroundColor: Colors.black,
              tooltip: 'Dislike',
              child: Center(
                child: Transform.rotate(
                  angle: -180 * 3.1416 / 180, // Rotate by -180 degrees
                  child: const Icon(
                    Icons.close, // Close (cross) icon
                    size: 27.36,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: 'like',
              onPressed: () {
                _triggerHeartAnimation();
              },
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
