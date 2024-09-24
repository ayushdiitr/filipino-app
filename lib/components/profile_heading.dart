import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _controller = TextEditingController();
  int _currentLength = 0;

  void _updateLength() {
    setState(() {
      _currentLength = _controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFF5F5F5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  height: 32,
                  child: Image.asset("images/backicon.png"),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'My Heading',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Baskerville',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Complete your profile for better chance of matching',
          style: TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            height: 1.2,
            letterSpacing: 0.02,
            color: Color(0xFF3F4A61),
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              height: 100,
              child: TextField(
                controller: _controller,
                onChanged: (_) => _updateLength(), // Update length on change
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "e.g. Photographer at Walter White",
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 0.7,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(75, 75, 75, 1),
                      width: 0.7,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 50.0,
                    horizontal: 10.0,
                  ),
                  hintStyle: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.02,
                    color: Color.fromRGBO(75, 75, 75, 1),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10, // Positioning for character count
              bottom: 10, // Adjust bottom padding as needed
              child: Text(
                '$_currentLength/48',
                style: const TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  color: Color(0xFFCACACA), // Character count color
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
