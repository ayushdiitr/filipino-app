import 'package:flutter/material.dart';


class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
      
      child: Stack(
        children: [
          
          Positioned(
            left: 0,
            child: Text(
              'Asian Cupid',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                color: Colors.black, 
                letterSpacing: 0.02,
                decoration: TextDecoration.none,
                decorationColor: Colors.transparent,
              ),
            ),
          ),
          
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                 
                border: Border.all(
                  color: Color(0xFFE5E5E5), 
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back), 
                onPressed: () {
                
                },
                padding: EdgeInsets.all(0),
                iconSize: 20,
                color: Colors.black, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
