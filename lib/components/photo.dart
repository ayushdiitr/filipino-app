import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

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
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _dragOffset += details.primaryDelta!;
          });
        },
        onHorizontalDragEnd: (details) {
          if (_dragOffset > 100) {
            // Swipe Right (like)
            widget.onSwipeComplete(true);
            print("Liked!");
          } else if (_dragOffset < -100) {
            // Swipe Left (dislike)
            widget.onSwipeComplete(false);
            print("Disliked!");
          }
          setState(() {
            _dragOffset = 0; // Reset the position after the swipe ends
          });
        },
        child: Stack(
          children: [
            // Image swipe animation (moves with drag)
            Transform.translate(
              offset: Offset(_dragOffset, 0),
              child: Transform.rotate(
                angle: _dragOffset / 200 * pi / 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),

            // Icon (like/dislike) when swiped (appears in the center and grows in size)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: MediaQuery.of(context).size.width * 0.5 - 30,
              child: AnimatedOpacity(
                opacity: (_dragOffset.abs() / 100).clamp(0.0, 1.0), // Fade in as swipe progresses
                duration: Duration(milliseconds: 200),
                child: AnimatedScale(
                  scale: (_dragOffset.abs() / 100).clamp(1.0, 1.5), // Grow the icon as you swipe
                  duration: Duration(milliseconds: 200),
                  child: CircleAvatar(
                    radius: 40, // Adjust the size of the icon here
                    backgroundColor: Colors.black,
                    child: Image.asset(
                      _dragOffset > 0
                          ? 'images/fav.png' // "Like" icon for right swipe
                          : 'images/dislike.png', // "Dislike" icon for left swipe
                    ),
                  ),
                ),
              ),
            ),

            // Title and bio at the bottom of the card
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: 5),
                  Text(
                    widget.bio,
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      height: 16.9 / 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
