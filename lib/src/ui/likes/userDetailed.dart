import 'package:flutter/material.dart';
import 'package:testapp/components/details_card.dart';
import 'package:testapp/components/like/Bottom_Button.dart';
import 'package:testapp/components/like/like_header.dart';
import 'package:testapp/components/like/like_profile.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/components/prompt_text.dart';
import 'package:testapp/components/swipe_card.dart';
import 'package:testapp/components/top_buttons.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/src/new/homepage/icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LikedUserDetailed extends StatefulWidget {
  const LikedUserDetailed({super.key});

  @override
  State<LikedUserDetailed> createState() => _LikedUserDetailedState();
}

class _LikedUserDetailedState extends State<LikedUserDetailed>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool hasScrolled = false;
  Color _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);
  bool _showHeart = false;
  bool _showDislike = false;
  double _dragOffset = 0.0;

  late AnimationController _animationController;
  late AnimationController _dislikeAnimationController;

  late AnimationController _fadeController;
  late AnimationController _dislikeFadeController;
  late AnimationController _scaleController;
  late AnimationController _dislikeScaleController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  late Animation<double> _dislikeScaleAnimation;
  late Animation<double> _dislikeFadeAnimation;

  List<dynamic> users = []; // Store fetched user data
  bool isLoading = true; // Show a loading indicator while fetching data

  // Fetch data from the API
  Future<void> fetchUserData() async {
    final String apiUrl =
        'http://35.154.234.237/getAllUsers/'; // Replace with your API URL

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        setState(() {
          users =
              responseData['data']; // Store the fetched data in the users list
          print(users[1]['profile_picture']);
          isLoading = false; // Stop the loading indicator once data is fetched
        });
      } else {
        // Handle error response
        setState(() {
          isLoading = false;
        });
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error: $error');
    }
  }

  int _currentUserIndex = 0;

  void _onSwipeComplete(bool isLiked) {
    setState(() {
      if (_currentUserIndex < users.length - 1) {
        _currentUserIndex++;
      } else {
        _currentUserIndex = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
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

    // Animation Controllers for the heart/dislike feedback
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _dislikeFadeController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _dislikeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _dislikeScaleAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _dislikeAnimationController,
        curve: Curves.easeOutBack,
      ),
    );

    _dislikeFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _dislikeAnimationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _triggerHeartAnimation() {
    if (users.isEmpty) return;

    setState(() {
      _showHeart = true;
      _appBackgroundColor = Colors.white;
    });

    _animationController.forward(from: 0);
  }

  void _triggerDislikeAction() {
    if (users.isEmpty) return;

    setState(() {
      _showDislike = true;
      _appBackgroundColor = Colors.white;
    });

    _dislikeAnimationController.forward(from: 0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    _dislikeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Scaffold(
        body: Center(child: Text('No more profiles')),
      );
    }

    final currentUser = users[_currentUserIndex];

    return Scaffold(
      backgroundColor: _appBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: _appBackgroundColor,
                toolbarHeight: 40,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: _appBackgroundColor,
                    child: Padding(
                      padding: !hasScrolled
                          ? const EdgeInsets.only(left: 16, top: 30)
                          : const EdgeInsets.only(left: 16.0, top: 36),
                      child: LikeHeader(), // Replace with actual widget
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        // Update the drag offset based on the horizontal drag movement
                        setState(() {
                          // This calculates how far the user has dragged horizontally
                          _dragOffset += details.primaryDelta! *
                              (300 / MediaQuery.of(context).size.width);
                        });
                      },
                      onHorizontalDragEnd: (details) {
                        // Handle the swipe logic once the user finishes the drag
                        if (_dragOffset > 100) {
                          // Call the onSwipeComplete callback with 'true' for like
                          _onSwipeComplete(true);
                        } else if (_dragOffset < -100) {
                          // Call the onSwipeComplete callback with 'false' for dislike
                          _onSwipeComplete(false);
                        }

                        // Reset the drag offset after the swipe is completed
                        setState(() {
                          _dragOffset = 0;
                        });
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 12.0,
                                  bottom: 6.0,
                                  top: 6.0,
                                  left: 12.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8, // 60% of the screen height
                                    child: SwipeCard(
                                      imgUrl: currentUser['profile_picture'],
                                      // 'https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Fallback if null
                                      name: currentUser['name'],
                                      bio: currentUser['bio'],
                                      isGestureEnabled: false,
                                      details: currentUser,
                                      onSwipeComplete: _onSwipeComplete,
                                    ),
                                    // child: SquareImageWithButton(
                                    //   imgUrl: currentUser.imgUrl,
                                    //   name: currentUser.name,
                                    //   bio: currentUser.bio,
                                    //   onSwipeComplete: _onSwipeComplete,
                                    // ),
                                  ),
                                  // const SizedBox(height: 16),
                                  // const CardRow(),
                                  // const HomeScreen(),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            right: 47,
            left: 47,
            child: BottomButton(
              id: currentUser['id'],
            ),
          ),
          if (_showHeart)
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: FadeTransition(
                    opacity: _fadeController,
                    child: ScaleTransition(
                      scale: _scaleController,
                      child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (_showDislike)
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: FadeTransition(
                    opacity: _dislikeFadeController,
                    child: ScaleTransition(
                      scale: _dislikeScaleController,
                      child: Icon(
                        Icons.cancel,
                        size: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          // Fixed Bottom Buttons
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
