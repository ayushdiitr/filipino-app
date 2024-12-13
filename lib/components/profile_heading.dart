import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyProfile extends StatefulWidget {
  final String currentPath;

  const MyProfile({super.key, required this.currentPath});
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _controller = TextEditingController();
  int _currentLength = 0;
  final TextEditingController locationController = TextEditingController();

  void _updateLength() {
    setState(() {
      _currentLength = _controller.text.length;
    });
  }

  late String text = widget.currentPath.toString()[0].toUpperCase() +
      widget.currentPath.toString().substring(1);

  // Function to send data to the API
  Future<void> updateProfile() async {
    const String baseUrl =
        "http://35.154.234.237"; // Replace with your base URL
    const String endpoint =
        "/updateProfile/9b885766-be84-460a-a22a-b0602773e39c/";

    // Prepare the payload
    Map<String, String> data = {
      widget.currentPath: _controller.text,
    };
    // Send POST request
    try {
      final response = await http.post(
        Uri.parse(
            '$baseUrl/updateProfile/9b885766-be84-460a-a22a-b0602773e39c/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile updated successfully'),
        ));
        Navigator.pop(context);
      } else {
        // Handle failure response
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to update profile'),
        ));
      }
    } catch (error) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $error'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  height: 32,
                  child: Image.asset("images/backicon.png"),
                ),
              ),
            ),
            // const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Baskerville',
                  fontSize: 20,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: double.infinity,
            //   height: 56,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     border: Border(
            //       bottom: BorderSide(
            //         color: Color(0xFFF5F5F5),
            //         width: 1,
            //       ),
            //     ),
            //   ),
            // ),
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
                    onChanged: (_) =>
                        _updateLength(), // Update length on change
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: updateProfile,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // Full-width button
            backgroundColor: const Color(0xFF4CAF50), // Custom button color
          ),
          child: const Text(
            'Save Profile',
            style: TextStyle(
              fontFamily: 'NoirPro',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
