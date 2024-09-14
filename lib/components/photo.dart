import 'package:flutter/material.dart';

class SquareImageWithButton extends StatelessWidget {
  final String imgUrl;

  const SquareImageWithButton({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Forces the aspect ratio to be square
      child: Stack(
        children: [
          // The image
          ClipRRect(
            borderRadius:
                BorderRadius.circular(8), // Optional: For rounded corners
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover, // Ensures the image covers the entire square
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // IconButton in the bottom right corner
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              onPressed: () {
                // TODO :
              },
              icon: Icon(Icons.favorite, color: Colors.white),
              color: Colors.red, // You can adjust the icon's color here
            ),
          ),
        ],
      ),
    );
  }
}
