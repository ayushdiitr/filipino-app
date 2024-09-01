import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:testapp/src/ui/screens/splash/basicInfo.dart';
import 'package:testapp/src/ui/screens/splash/screen2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Otpscreen extends StatefulWidget {
  final String phoneNumber;
  final int userId;

  Otpscreen({super.key, required this.phoneNumber, required this.userId});

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  bool _isHidden = true;
  String _otpCode = ""; // Variable to store OTP code
  int _remainingTime = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _isHidden = true;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        if (mounted) {
          _showTimeUpDialog();
        }
        _timer?.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _toggleOtpView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _showTimeUpDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Didn't received the code ?",
                style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF808080)),
              ),
              ListTile(
                title: const Text(
                  'Send again',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  _resendOtp();
                },
              ),
              ListTile(
                title: const Text(
                  'Edit number',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _verifyOtp() async {
    final url = Uri.parse(
        'http://10.0.2.2:8000/api/v1/register/${widget.userId}/verify_otp/'); // Replace with your backend URL

    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'phone_number': widget.phoneNumber,
          'otp': _otpCode,
        }),
      );

      if (!mounted) return; // Ensure the widget is still mounted

      if (response.statusCode != 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BasicInfo(
                    userId: widget.userId,
                  )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      if (!mounted) return; // Ensure the widget is still mounted

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  Future<void> _resendOtp() async {
    final url = Uri.parse(
        'http://10.0.2.2:8000/api/v1/register/${'user_id'}/regenaret_otp/');

    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'phone_number': widget.phoneNumber,
        }),
      );
      if (!mounted) return; // Ensure the widget is still mounted

      if (response.statusCode != 200) {
        Navigator.pop(context);
        _remainingTime = 45;
        _startTimer();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Maximum OTP attempts reached, try again after 1 hour')),
        );
      }
    } catch (e) {
      if (!mounted) return; // Ensure the widget is still mounted

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
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
                        value: 0.4,
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
                            text: 'Verification Code',
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Sent to ",
                              style: TextStyle(
                                  fontFamily: 'NoirPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080)),
                            ),
                            Text(
                              widget.phoneNumber,
                              style: const TextStyle(
                                  fontFamily: 'NoirPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF808080)),
                            ),
                            const SizedBox(
                                width: 8), // Space between text and icon
                            const Icon(
                              Icons.circle_rounded,
                              size: 10, // Adjust size as needed
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BasicInfo(userId: 2),
                                  ),
                                );
                              },
                              child: const Text('Edit'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      cursorColor: Colors.black,
                      obscureText: _isHidden,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Enter your code',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: IconButton(
                            onPressed: _toggleOtpView,
                            icon: Icon(_isHidden
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: "------",
                        hintStyle: const TextStyle(
                          letterSpacing:
                              16, // Adjust the spacing between dashes
                        ),
                      ),
                      onChanged: (otp) {
                        setState(() {
                          _otpCode = otp; // Update OTP code
                        }); // Print OTP code to the terminal
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      children: [
                        const Text(
                          "The code should arrive within ",
                          style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF808080)),
                        ),
                        Text(
                          "00:${_remainingTime.toString().padLeft(2, '0')}s", // Display the remaining time
                          style: const TextStyle(
                            fontFamily: 'NoirPro',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
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
                    _verifyOtp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
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
                      Text('Verify'),
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
