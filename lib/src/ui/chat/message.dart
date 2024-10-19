import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ChatHeader is fixed and not scrollable
          ChatHeader(),

          // The rest of the screen is scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageScreen(), // Merged MessageScreen content
                ],
              ),
            ),
          ),

          // ChatBox (fixed at the bottom)
          ChatBox(),
        ],
      ),
    );
  }
}

// ChatHeader Component
class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // Back action
            },
          ),
          const SizedBox(width: 8),
          Stack(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(73),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(73),
                  child: Image.asset(
                    'images/viewer.png', // User avatar
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 40,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Color(0xFF3AC482), // Active status indicator
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 18),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajay Nagar',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 21.03 / 14,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '@ajngr2002',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 18.02 / 12,
                    letterSpacing: 0.02,
                    color: Color(0xFF7E919A),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 24,
            color: Color(0xFF1C1B1F),
          ),
        ],
      ),
    );
  }
}

// MessageScreen Component
class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First message frame
          Container(
            width: 311,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis. Fermentum augue aliquet lorem enim sem egestas tristique.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                height: 1.5,
              ),
            ),
          ),
          // Timestamp outside the message frame
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "10:25",
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.3),
                letterSpacing: 0.02,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Centered "2:30 PM" time frame
          Center(
            child: Container(
              width: 74,
              height: 22,
              decoration: BoxDecoration(
                color: Color(0xFFD1D1D6),
                borderRadius: BorderRadius.circular(78),
              ),
              child: const Center(
                child: Text(
                  "2 : 30 PM",
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Second message frame
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                height: 1.5,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                height: 1.5,
              ),
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Est molestie cras quis commodo enim enim iaculis.",
              style: TextStyle(
                fontFamily: 'NoirPro',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02,
                color: Colors.black.withOpacity(0.6),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ChatBox Component (fixed at the bottom)
class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFCACACA),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Start Typing",
                    hintStyle: TextStyle(
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      color: Color(0xFF808080),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: Color(0xFF808080),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
