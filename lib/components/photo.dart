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
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 10), // Padding around the IconButton
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the button
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.white, // Border color
                    width: 1, // Border width
                  ),
                  horizontal: BorderSide(
                    color: Colors.white, // Border color
                    width: 1, // Border width
                  ),
                ),
                borderRadius: BorderRadius.circular(21), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 16,
                    child: Image.asset("images/chat_bubble.png"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
