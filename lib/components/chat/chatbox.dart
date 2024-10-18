import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        //width: 358,
        height: 56,
        padding: const EdgeInsets.only(top: 16), 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.circular(8),
            
          border: Border.all(
            color: Color(0xFFCACACA), 
            width: 1, 
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: SizedBox(
                width: 264, 
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    hintText: "Start Typing",
                    hintStyle: TextStyle(
                      
                      fontFamily: 'NoirPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      color: Color(0xFF808080), 
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 20),  
                  ),
                  style: const TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right:16), 
              child: Icon(
                Icons.arrow_forward_ios,
                size: 19,
                color: Color(0xFF808080), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}


