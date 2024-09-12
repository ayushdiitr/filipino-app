import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/src/ui/screens/splash/meetScreen.dart';

class Emailscreen extends StatefulWidget {
  const Emailscreen({super.key});

  @override
  _EmailInfoState createState() => _EmailInfoState();
}

class _EmailInfoState extends State<Emailscreen> {
  // Add a TextEditingController to capture the email input
  final TextEditingController emailController = TextEditingController();

  bool isChecked = false;

  Future<void> saveEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = emailController.text.trim();

    // Regular expression for email validation
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Validate email
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email!')),
      );
      return; // Stop further execution if validation fails
    } else if (!emailRegExp.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address!')),
      );
      return; // Stop further execution if validation fails
    }

    // Save data to SharedPreferences
    await prefs.setString('email', email);

    // Navigate to the next screen after saving data
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Meetscreen()),
    );
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
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.8,
                        color: Colors.black,
                        backgroundColor: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InputChip(
                          label: Text(
                            'BASIC INFO',
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              letterSpacing: 0.8,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          visualDensity:
                              VisualDensity(horizontal: -4.0, vertical: -4.0),
                          backgroundColor:
                              Colors.white, // White background color
                        ),
                        const SizedBox(height: 12),
                        const Text.rich(
                          TextSpan(
                            text: 'Enter your ', // Default text style
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Email Address',
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
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 16.0,
                          ),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "Share your basic info to tailor your SkyBuddy experience and connect with like-minded travelers on your upcoming journey",
                              style: TextStyle(
                                fontFamily: 'NoirPro',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          cursorColor: Colors.black,
                          controller: emailController, // Use the controller
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'NoirPro',
                          ), // Text color when focused
                          decoration: const InputDecoration(
                            labelText: 'Enter email address',
                            labelStyle: TextStyle(
                                color: Colors
                                    .grey), // Label color when not focused
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(
                                      0xFFCCCCCC)), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .black), // Border color when focused
                            ),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Aligns elements to the bottom
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked, // You need to define this boolean
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text("Yes i would like to receive offers via email",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: isChecked
                          ? () => saveEmail()
                          : null, // Button only enabled if checked
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
                          Text('Next'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
