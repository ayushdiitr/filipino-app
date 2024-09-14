import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:testapp/src/ui/screens/splash/otpscreen.dart';
import 'package:testapp/src/ui/screens/splash/main.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      setState(() {}); // Refresh UI when phone number changes
    });
  }

  bool get isPhoneNumberValid {
    final phoneNo = phoneController.text.trim();
    // Checking if the phone number length is exactly 10 digits
    return phoneNo.length == 10;
  }

  Future<void> _savePhoneNo(BuildContext context) async {
    final String phoneNo = phoneController.text.trim();

    if (phoneNo.isNotEmpty) {
      try {
        // Simulate backend call
        final Map<String, Object> response = {
          "body": jsonEncode({
            "user_id":
                12345, // Replace this with any user ID you want to simulate
            "phone_number": phoneNo, // Example phone number
          }),
          "statusCode": 201, // Simulating a successful creation status
        };

        if (response["statusCode"] == 201) {
          final Map<String, dynamic> responseData =
              jsonDecode(response["body"] as String);
          final int userId = responseData['user_id'];
          // Navigate
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
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.2,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 32,
                        child: Image.asset("images/backicon.png"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 24.0, right: 16),
                    child: Text.rich(
                      TextSpan(
                        text: 'Enter your ', // Default text style
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Phone Number',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Baskerville',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 24),
                  // Updated IntlPhoneField with flag removed
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: IntlPhoneField(
                      cursorColor: Colors.black,
                      controller: phoneController,
                      decoration: const InputDecoration(
                          labelText: 'Enter your phone number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'NoirPro',
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                          )),
                      initialCountryCode: 'IN',
                      showCountryFlag: false, // Removes the flag
                      flagsButtonPadding: const EdgeInsets.only(left: 12.0),
                      dropdownIconPosition: IconPosition
                          .trailing, // Places the arrow after the field
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  onPressed:
                      isPhoneNumberValid ? () => _savePhoneNo(context) : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isPhoneNumberValid ? Colors.black : Colors.grey,
                    foregroundColor: Colors.white,
                    textStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
