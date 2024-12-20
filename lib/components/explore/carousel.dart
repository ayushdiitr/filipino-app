import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProfileCarousel extends StatefulWidget {
  @override
  _ProfileCarouselState createState() => _ProfileCarouselState();
}

class _ProfileCarouselState extends State<ProfileCarousel> {
  int _currentIndex = 0;

  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

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
            int index = userProfiles.indexOf(profile);
            bool isCenter = index == _currentIndex;

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 487, // Fixed height for each card
                  margin: const EdgeInsets.symmetric(horizontal: 5.0), // Reduced margin
                  child: Opacity(
                    opacity: isCenter ? 1.0 : 0.3, // Center profile is fully visible, side profiles are greyed out
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      //elevation: isCenter ? 5 : 0, // Elevation for center profile only
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

                          // Add grey overlay for side profiles
                        if (!isCenter)
                          Container(
                            decoration: BoxDecoration(
                              //color: Color(0xFFD9D9D9),
                              color: Colors.black, // Semi-transparent grey
                              borderRadius: BorderRadius.circular(12),
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
                                  SizedBox(height: 2),
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
            enlargeCenterPage: false, // Enlarge the center profile
            viewportFraction: 0.9,  // Set this value so the cards are not resized, only the center one is enlarged
            aspectRatio: 9 / 16,  // Aspect ratio for the cards
            height: 487, // Fixed height for each card
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;  // Update the index when the carousel changes
              });
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
