import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/ui/screens/splash/genderScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class BasicInfo extends StatefulWidget {
  final int userId;
  const BasicInfo({super.key, required this.userId});

  @override
  _BasicInfoState createState() => _BasicInfoState();
}


class _BasicInfoState extends State<BasicInfo> {
  // Added TextEditingControllers to capture user input
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  String? selectedDate;

  Future<void> saveBasicInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String firstName = firstNameController.text.trim();

    // Validate first name
    if (firstName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your first name')),
      );
      return; // Stop further execution if validation fails
    }

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your date of birth')),
      );
      return;
    }

    // Save data to SharedPreferences
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastNameController.text.trim());
    await prefs.setString('occupation', occupationController.text.trim());
    await prefs.setString('age', selectedDate!);
    await prefs.setInt('userId', widget.userId);
    // Navigate to the next screen after saving data
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Genderscreen()),
    );
  }

  void showDatePicker(BuildContext context){
    Picker(
      hideHeader: true,
      adapter: DateTimePickerAdapter(
        type: PickerDateTimeType.kDMY,
        isNumberMonth: true,
        yearBegin: 1990,
        yearEnd: DateTime.now().year,
      ),
      title: const Text("Select Date of Birth"),
      onConfirm: (Picker picker, List value){
        DateTime selected = (picker.adapter as DateTimePickerAdapter).value!;
        setState(() {
          selectedDate = DateFormat('dd-MM-yyyy').format(selected);
        });
      },
    ).showDialog(context);
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
                        GestureDetector(
                          onTap: () => showDatePicker(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedDate != null ? Colors.black: Colors.grey,
                                width: 1.0,
                              ),
                              // borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedDate != null ?
                                      "Date of Birth: $selectedDate"
                                      : "Select Date of Birth",
                                  style: TextStyle(
                                    color: selectedDate != null
                                        ? Colors.black
                                        : Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const Icon(Icons.calendar_today, color: Colors.black,),
                              ],
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

          // The button is placed at the bottom of the screen.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  onPressed: () async{
                    await saveBasicInfo();
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
