import 'package:flutter/material.dart';

class SquareImagePopup extends StatelessWidget {
  final String imgUrl;

  const SquareImagePopup({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The image
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // The first box below the image
        Container(
          width: 350,
          height: 57,
          padding: const EdgeInsets.fromLTRB(26, 20, 26, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Opacity(
            opacity: 0.3,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.black,
                hintText: "Write your message",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  letterSpacing: 0.02,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            // child: Text(
            //   "Write your message",
            //   style: TextStyle(
            //     fontFamily: 'NoirPro',
            //     fontSize: 14,
            //     fontWeight: FontWeight.w400,
            //     height: 1.2,
            //     letterSpacing: 0.02,
            //     color: Color(0xFF000000),
            //   ),
            // ),
          ),
        ),

        const SizedBox(height: 10),

        // The second box, which is a button
        GestureDetector(
          onTap: () {
            // Navigate to: None, so no action here
            // Animate: Instant, so no animation is required
          },
          child: Container(
            width: 350,
            height: 52,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFF000000),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/heart.png',
                  width: 20,
                  height: 18.35,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Send Like",
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    letterSpacing: 0.02,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.2,
              letterSpacing: 0.02,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
