import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProfileCarousel extends StatelessWidget {
  final CarouselSliderController buttonCarouselController = CarouselSliderController();

  final List<Map<String, String>> userProfiles = [
    {'name': 'John Doe', 'image': 'images/ravish.png', 'profession': 'SDE'},
    {'name': 'Robert Brown', 'image': 'images/ravish.png', 'profession': 'SDE'},
    {'name': 'Jane Smith', 'image': 'images/ravish.png', 'profession': 'SDE'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: userProfiles.map((profile) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 348, // Set width for the card
                  height: 400, // Set height for the card
                  margin: const EdgeInsets.symmetric(horizontal: 5.0), // Margin for the gap
                  child: Opacity(
                    opacity: 1.0, // Adjust opacity (1.0 for fully visible)
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      child: Stack(
                        children: <Widget>[
                          // Background Image
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                                
                              
                              image: DecorationImage(
                                image: AssetImage(profile['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Username and Profession
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    profile['name']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NoirPro',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 2), // Space between name and profession
                                  Text(
                                    profile['profession']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'NoirPro',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.75, // Adjust for the gap
            aspectRatio: 9 / 16, // This will be ignored due to height
            height: 487, // Set carousel height to match card height
            initialPage: 0,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
