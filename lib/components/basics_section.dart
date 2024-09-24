import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BasicsSection extends StatefulWidget {
  final String title;
  final String subtitle;

  const BasicsSection({super.key, required this.title, required this.subtitle});

  @override
  State<BasicsSection> createState() => _BasicsSectionState();
}

class _BasicsSectionState extends State<BasicsSection> {
  List<Map> basics = [
    {
      'title': 'Work',
      'icon': Icons.work_outline,
      'data': 'Add workplace',
    },
    {
      'title': 'Education',
      'icon': Icons.school_outlined,
    },
    {
      'title': 'Gender',
      'icon': Icons.person_outline,
    },
    {
      'title': 'Location',
      'icon': Icons.location_on_outlined,
    },
    {
      'title': 'Hometown',
      'icon': Icons.home_outlined,
    },
  ];

  List<Map> interest = [
    {
      'title': 'Looking for',
      'icon': Icons.person_search_outlined,
      'data': 'Add workplace',
    },
    {
      'title': 'Education',
      'icon': Icons.business_center,
    },
    {
      'title': 'Drinking',
      'icon': Icons.wine_bar,
    },
    {
      'title': 'Smoking',
      'icon': Icons.smoking_rooms_outlined,
    },
    {
      'title': 'Politics',
      'icon': Icons.gavel,
    },
    {
      'title': 'Star Sign',
      'icon': Icons.star_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF), // var(--White, #FFFFFF)
          border: Border.all(
            color: const Color(0xFFEEEEEE), // var(--Neutral-200, #EEEEEE)
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.02,
              ),
            ),
            const SizedBox(height: 2),
            Text.rich(
              TextSpan(
                text: widget.subtitle,
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 1.2, // line-height: 14.4px
                  letterSpacing: 0.02,
                  color: Color(0xFF3F4A61), // var(--Secondary-600, #3F4A61)
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...(widget.title == 'Basics' ? basics : interest).map(
              (i) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(i['icon']),
                          SizedBox(width: 8),
                          Text(
                            i.values.first.toString(),
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.2, // line-height: 16.8px
                              letterSpacing: 0.02,
                              color: Color(
                                  0xFF4B4B4B), // var(--Secondary-600, #3F4A61)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(
                              fontFamily: 'NoirPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              height: 1.2, // line-height: 16.8px
                              letterSpacing: 0.02,
                              color: Color(
                                  0xFF4B4B4B), // var(--Secondary-600, #3F4A61)
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ));
  }
}
