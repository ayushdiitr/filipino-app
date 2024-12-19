import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BottomButton extends StatefulWidget {
  final String id;

  const BottomButton({super.key, required this.id});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  // / Function to send data to the API
  Future<void> handleLike() async {
    const String baseUrl = "http://10.0.2.2:8000"; // Replace with your base URL

    // Prepare the payload
    Map<String, String> data = {
      "user1_id": widget.id,
      "user2_id": "3ab787ad-9a9a-4a52-a0c2-fd06fbd6745c"
    };
    // Send POST request
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat/conversations/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String conversationId = responseBody['data']['conversation_id'];

        print(conversationId + '-----conversationId----');
        // Handle successful response
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Conversation created successfully'),
        ));
        Navigator.pushNamed(context, '/chat/message/$conversationId');
      } else {
        // Handle failure response
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to start conversation'),
        ));
      }
    } catch (error) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: $error'),
      ));
    }
  }

  void handleNotForMePress() {
    // Your logic for "Not For Me" button press
    print("Not For Me button pressed for ID: ${widget.id}");
  }

  void handleLikePress() {
    // Your logic for "Like" button press
    handleLike();
    print("Like button pressed for ID: ${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align buttons to the left
          children: [
            Expanded(
              child: GestureDetector(
                onTap: handleNotForMePress,
                child: Container(
                  width: screenWidth,
                  height: 52.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/cross.png',
                        width: 18.0,
                        height: 18.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Not For Me",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.02,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: handleLikePress,
                child: Container(
                  width: screenWidth,
                  height: 52.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/heart.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Like",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.02,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
