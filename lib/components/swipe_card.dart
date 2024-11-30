import 'dart:math';
import 'package:flutter/material.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/details_card.dart';
import 'package:testapp/components/prompt_text.dart';

class SwipeCard extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String bio;
  final Function(bool) onSwipeComplete;

  const SwipeCard({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.bio,
    required this.onSwipeComplete,
  }) : super(key: key);

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust height for the image
    final imageHeight = screenHeight * 0.8; // 80% height for image

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dragOffset += details.primaryDelta! * (300 / screenWidth);
        });
      },
      onHorizontalDragEnd: (details) {
        if (_dragOffset > 100) {
          widget.onSwipeComplete(true);
          print("Liked!");
        } else if (_dragOffset < -100) {
          widget.onSwipeComplete(false);
          print("Disliked!");
        }
        setState(() {
          _dragOffset = 0;
        });
      },
      child: Center(
        child: Container(
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Entire card swipe animation (moves with drag)
                Transform.translate(
                  offset: Offset(_dragOffset, 0),
                  child: Transform.rotate(
                    angle: _dragOffset / screenWidth * pi / 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Use Stack to layer the image and text
                            Stack(
                              children: [
                                // Image takes 80% of the screen height
                                Container(
                                  height: imageHeight,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.imgUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Text over the image at the bottom
                                Positioned(
                                    bottom: 16, // Adjust this value as needed
                                    left: 16,
                                    right: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.name,
                                          style: TextStyle(
                                            fontFamily: 'NoirPro',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.02,
                                            height: 30.98 / 22,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 4,
                                                color: Colors.black,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          widget.bio,
                                          style: TextStyle(
                                            fontFamily: 'NoirPro',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.02,
                                            height: 17 / 12,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 4,
                                                color: Colors.black,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),

                            // Text content below the image
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardRow(),
                                  HomeScreen(),
                                  const PromptTextScreen(
                                    promptTitle: 'Prompt 1',
                                    promptDesc:
                                        'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                                  ),
                                  const SizedBox(height: 16),
                                  const PromptTextScreen(
                                    promptTitle: 'Prompt 1',
                                    promptDesc:
                                        'Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Like/Dislike feedback icon
                Positioned.fill(
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: (_dragOffset.abs() / 100).clamp(0.0, 1.0),
                      duration: Duration(milliseconds: 200),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        child: Icon(
                          _dragOffset > 0 ? Icons.favorite : Icons.close,
                          size: 50,
                          color: _dragOffset > 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
