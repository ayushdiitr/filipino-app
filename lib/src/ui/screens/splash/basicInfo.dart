import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/genderScreen.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  _BasicInfoState createState() => _BasicInfoState();
}
List<String> list = List.generate(83, (index) => (index + 18).toString());

class _BasicInfoState extends State<BasicInfo> {
  // Added TextEditingControllers to capture user input
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  String ageValue = list.first;


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
                        value: 0.5,
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
                            text: 'Basic Info',
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
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Share your basic info to tailor your SkyBuddy experience and connect with like-minded travelers on your upcoming journey",
                        style: TextStyle(
                          fontFamily: 'NoirPro',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: Colors.black,
                          controller: firstNameController, // Added controller

                          style: const TextStyle(color: Colors.black), // Text color when focused
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle:  TextStyle(color: Colors.black), // Label color when not focused
                            border:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusColor: Colors.black,
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCCCCCC)), // Border color when not focused
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black), // Border color when focused
                            ),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                            height: 16.0), // Add space between the text fields
                        TextField(
                          cursorColor: Colors.black,
                          controller: lastNameController, // Added controller
                          style: const TextStyle(color: Colors.black), // Text color when focused
                          decoration: const InputDecoration(
                            labelText: 'Last Name (Optional)',
                            labelStyle:  TextStyle(color: Colors.black), // Label color when not focused
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCCCCCC)), // Border color when not focused
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black), // Border color when focused
                            ),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                            height: 16.0), // Add space between the text fields
                        TextField(
                          cursorColor: Colors.black,
                          controller: occupationController, // Added controller
                          style: const TextStyle(color: Colors.black), // Text color when focused
                          decoration: const InputDecoration(
                            labelText: 'Occupation (Optional)',
                            labelStyle:  TextStyle(color: Colors.black), // Label color when not focused
                            border:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCCCCCC)), // Border color when not focused
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black), // Border color when focused
                            ),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                        const SizedBox(
                            height: 16.0), // Add space between the text fields
                        SizedBox(
                          width: double.infinity,

                          child: DropdownMenu<String>(
                          initialSelection: list.first,
                          width: double.infinity,
                          onSelected: (value) {
                            setState(() {
                              ageValue = value!;
                            });
                          },
                          dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
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
                    String firstName = firstNameController.text.trim();
                    String lastName = lastNameController.text.trim();
                    String occupation = occupationController.text.trim();

                    // Provide default values if the fields are empty
                    if (lastName.isEmpty) {
                      lastName = "No Last Name Provided";
                    }
                    if (occupation.isEmpty) {
                      occupation = "No Occupation Provided";
                    }
                    // Print the user's basic information in the terminal
                    print("Full Name: ${firstNameController.text}");
                    print("Last Name: ${lastNameController.text}");
                    print("Occupation: ${occupationController.text}");
                    print("Age: $ageValue");
                    // Define what happens when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Genderscreen()),
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
