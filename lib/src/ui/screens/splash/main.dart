import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';
//import 'package:testapp/src/ui/screens/splash/screen2.dart';
import 'package:testapp/src/ui/screens/splash/interest.dart';
import 'package:testapp/src/ui/screens/splash/screen2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Image.asset(
                  "images/SignupImage.png",
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Welcome to ', // Default text style
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'FilipinoMeet',
                        style: GoogleFonts.libreBaskerville(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text.rich(
                  TextSpan(
                    text:
                        "Join channels based on your flight details, connecting effortlessly with fellow travelers heading to the same destination. Let's elevate your journey together!",
                    style: TextStyle(
                      fontFamily: 'NoirPro',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              //Google Sign in Button
              Center(
                // padding: const EdgeInsets.symmetric(horizontal: ),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      // Define what happens when the button is pressed
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      side:
                          const BorderSide(width: 1, color: Color(0xFFF5F5F5)),
                      // elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Custom border radius
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/googleicon.png",
                            width: 20.0, height: 20.0),
                        Text('Continue with Google'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                // padding: const EdgeInsets.symmetric(horizontal: ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          // Define what happens when the button is pressed
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneLogin()));
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
                          // elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          // padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.call),
                            Text('Continue with Phone'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        text: "By proceeding, you acknowledge and agree to our",
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Terms and Conditions",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
