import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 358,
      //height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // var(--White, #FFFFFF)
        border: Border.all(
          color: const Color(0xFFEEEEEE), // var(--Neutral-200, #EEEEEE)
          width: 1,
        ),
        borderRadius:  BorderRadius.circular(8),
          
        ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'images/frame.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GET VERIFIED !',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  color: Color.fromRGBO(222, 53, 11, 1),
                  fontWeight: FontWeight.w500,
                  height: 1.2, // line-height: 16.8px
                  letterSpacing: 0.02,
                ),
              ),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: 'Verify your profile for better match',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    height: 1.2, // line-height: 14.4px
                    letterSpacing: 0.02,
                    color: Color(0xFF3F4A61), // var(--Secondary-600, #3F4A61)
                  ),
                ),
              ),
            ],
          ),
            ],
          ),
          
              
          //SizedBox(height: 2),
          const Icon(Icons.arrow_forward_ios,
          color: Color.fromRGBO(202, 202, 202, 1) ),
          
          
        ],
      ),
    );
  }
}
