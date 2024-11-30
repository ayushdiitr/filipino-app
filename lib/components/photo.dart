import 'dart:math';
import 'package:flutter/material.dart';
import 'package:testapp/components/details_card.dart';

class SquareImageWithButton extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String bio;
  final Function(bool) onSwipeComplete;

  const SquareImageWithButton({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.bio,
    required this.onSwipeComplete,
  }) : super(key: key);

  @override
  _SquareImageWithButtonState createState() => _SquareImageWithButtonState();
}

class _SquareImageWithButtonState extends State<SquareImageWithButton> {
  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust height by subtracting header and padding
    final cardHeight = screenHeight -
        80 -
        16; // Example header height: 80px, bottom padding: 16px

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
        // child: AspectRatio(
        //   aspectRatio: 1,
        child: Container(
          height: cardHeight,
          width: screenWidth * 1, // Slightly smaller width for margins
          child: Stack(
            children: [
              // Image swipe animation (moves with drag)
              Transform.translate(
                offset: Offset(_dragOffset, 0),
                child: Transform.rotate(
                  angle: _dragOffset / screenWidth * pi / 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.imgUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),

                          // Title and bio over the image
                          Positioned(
                            bottom: 40,
                            left: 20,
                            right: 20,
                            child: Transform.translate(
                              offset: Offset(_dragOffset, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              ),
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
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
