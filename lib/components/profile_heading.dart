import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, 
          height: 56, 
          decoration: const BoxDecoration(
            color: Colors.white, 
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFF5F5F5), 
                width: 1, 
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4), 
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(202, 202, 202, 1), 
                    width: 1, 
                  ),
                  borderRadius: BorderRadius.circular(4), 
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new, 
                  color: Color.fromRGBO(202, 202, 202, 1), 
                ),
              ),
              const SizedBox(width: 10), 
              Expanded( 
                child: Text(
                  'My Heading',
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontFamily: 'Baskerville', 
                    fontSize: 16,
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
        const TextField(
          decoration: InputDecoration(
            fillColor: Colors.white, 
            hintText: "e.g. Photographer at Walter white",
            enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 0.7,
                    ),
                  ),
            focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(75, 75, 75, 1),
                      width: 0.7,
                    ),
                  ),
            
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
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
      ],
    );
  }
}