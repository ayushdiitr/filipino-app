import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:testapp/src/ui/screens/splash/otpscreen.dart';
import 'dart:convert';

class PhoneLogin extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  PhoneLogin({super.key});

  //function to send data to backend
  Future<void> _savePhoneNo(BuildContext context) async {
    final String phoneNo = phoneController.text.trim();

    if (phoneNo.isNotEmpty) {
      try {
        // final response = await http.post(
        //   Uri.parse('http://10.0.2.2:8000/api/v1/register/'),
        //   headers: <String, String>{
        //     'Content-Type':'application/json; charset=UTF-8',
        //   },
        //   body: jsonEncode(<String, dynamic>{
        //     'phone_number':int.parse(phoneNo),
        //   }),
        // );
        final Map<String, Object> response = {
          "body": jsonEncode({
            "user_id":
                12345, // Replace this with any user ID you want to simulate
            "phone_number": "1234567890", // Example phone number
          }),
          "statusCode": 201, // Simulating a successful creation status
        };
        // print(jsonDecode(response.body));
        if (response["statusCode"] == 201) {
          final Map<String, dynamic> responseData =
              jsonDecode(response["body"] as String);
          // if(response.statusCode != 201 || response.statusCode == 200){
          //   final Map<String, dynamic> responseData = jsonDecode(response.body);
          final int userId = responseData['user_id'];
          //Navigate
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Otpscreen(
                      phoneNumber: phoneNo,
                      userId: userId,
                    )),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to send data')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter your phone number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 100.0), // Extra space to avoid overlapping
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.2,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 32.0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Enter your ', // Default text style
                        style: const TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Phone Number',
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text.rich(
                      TextSpan(
                        text:
                            "Please enter your phone number. We'll use this to keep you connected and informed",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: IntlPhoneField(
                      cursorColor: Colors.black,
                      controller:
                          phoneController, // Added controller to capture input

                      decoration: const InputDecoration(
                        labelText: 'Enter your phone number',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // The button is placed at the bottom of the screen.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    // Print the phone number when the button is pressed
                    _savePhoneNo(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    side: const BorderSide(width: 1, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Next'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
