import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:testapp/src/ui/screens/splash/basicInfo.dart';


class Otpscreen extends StatefulWidget {
  Otpscreen({super.key});

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    _isHidden = true;
  }

  void _toggleOtpView() {
    setState(() {
      _isHidden = !_isHidden;
    });
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
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Sent to ",
                              style: TextStyle(
                                  fontFamily: 'NoirPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080)),
                            ),
                            Text(
                              "+91778798898",
                              style: TextStyle(
                                  fontFamily: 'NoirPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF808080)),
                            ),
                            SizedBox(width: 8), // Space between text and icon
                            Icon(
                              Icons.circle_rounded,
                              size: 10, // Adjust size as needed
                            ),
                            TextButton(
                              onPressed: null,
                              child: Text('Edit'),
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
                      onChanged: (phone) {
                        print(phone);
                      },
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "The code should arrive within ",
                          style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF808080)),
                        ),
                        Text(
                          "00:30s",
                          style: TextStyle(
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
                    // Define what happens when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BasicInfo()),
                    );
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
