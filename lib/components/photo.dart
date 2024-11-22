import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testapp/src/ui/homepage/msg_popup.dart';

class SquareImageWithButton extends StatefulWidget {
  final String imgUrl;

  const SquareImageWithButton({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  _SquareImageWithButtonState createState() => _SquareImageWithButtonState();
}

class _SquareImageWithButtonState extends State<SquareImageWithButton> {
  double _dragOffset = 0; 

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
            
            print("Liked!");
          } else if (_dragOffset < -100) {
            
            print("Disliked!");
          }
          setState(() {
            _dragOffset = 0; 
          });
        },
        child: Stack(
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Transform.translate(
                offset: Offset(_dragOffset, 0), 
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            
            Positioned(
              bottom: 110, 
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Container(
                    child: Center(
                      child: Text(
                        "koko_123",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                          height: 30.98 / 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5), 
                  
                  Container(
                    width: 326,
                    height: 17,
                    child: Center(
                      child: Text(
                        "UX Designer",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                          height: 16.9 / 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            
            Positioned(
              bottom: 30,
              right: 47,
              left: 47,
              child: Container(
                width: 296,
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button 1
                    _buildButton(48, 48, 'images/return.png', () {
                      print("Button 1 tapped");
                    }),
                    SizedBox(width: 10),
                    // Button 2
                    _buildButton(56, 56, 'images/dislike.png', () {
                      print("Button 2 tapped");
                    }),
                    SizedBox(width: 10),
                    // Button 3
                    _buildButton(48, 48, 'images/verified.png', () {
                      print("Button 3 tapped");
                    }),
                    SizedBox(width: 10),
                    // Button 4
                    _buildButton(56, 56, 'images/fav.png', () {
                      print("Button 4 tapped");
                    }),
                    SizedBox(width: 10),
                    // Button 5
                    _buildButton(48, 48, 'images/msg.png', () {
                      print("Button 5 tapped");
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build buttons with specific sizes
  Widget _buildButton(double width, double height, String imagePath, VoidCallback onTap) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
      decoration: BoxDecoration(
        color: Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(32),
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(imagePath),
      ),
    );
  }
}
