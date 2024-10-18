import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProfileCarousel extends StatelessWidget {
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
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400, // Set minimum height for the card

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Stack(
                      children: <Widget>[
                        // Background Image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(profile['image']!),
                                fit: BoxFit.cover),
                          ),
                          height: 487, // Adjust height accordingly
                        ),
                        // Username and Profession
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            color: Colors.transparent, // Transparent background
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
                                SizedBox(
                                    height:
                                        2), // Space between name and profession
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
                );
              },
            );
          }).toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 9 / 16, //this will be ignored due to height
            height: 400,
            initialPage: 0,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
