import 'package:flutter/material.dart';
import 'package:testapp/components/basics_section.dart';
import 'package:testapp/components/details_card.dart';
import 'package:testapp/components/edit_profile.dart';
import 'package:testapp/components/photo.dart';
import 'package:testapp/components/photo_popup.dart';
import 'package:testapp/components/profile_bio.dart';
import 'package:testapp/components/profile_header.dart';
import 'package:testapp/components/prompt_text.dart';
import 'package:testapp/components/prompts.dart';
import 'package:testapp/components/top_buttons.dart';
import 'package:testapp/components/about_me.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/components/verified.dart';
import 'package:testapp/components/heading.dart';
import 'package:testapp/components/profile_heading.dart';
import 'package:testapp/components/edit_profile.dart';
import 'package:testapp/components/profile_bio.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ScrollController _scrollController;
  late bool hasScrolled = false;
  Color _appBackgroundColor = const Color.fromRGBO(245, 245, 245, 1);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        double offset = _scrollController.offset.clamp(0.0, 100.0);
        double percentage = offset / 100.0;

        setState(() {
          _appBackgroundColor = Color.lerp(
            const Color.fromRGBO(245, 245, 245, 1),
            Colors.white,
            percentage,
          )!;
        });
      }
    });

    // Listen to scroll changes
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        // Change color when scrolled beyond 0.0 offset
        if (_scrollController.offset > 50.0) {
          setState(() {
            _appBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
            hasScrolled = false;
          });
        } else {
          setState(() {
            _appBackgroundColor = Colors.white;
            hasScrolled = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100.0,
                titleSpacing: 30,
                backgroundColor: Colors.transparent,
                // leading: MenuDrawerPersonal(),
                title: Row(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    )
                  ],
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, bottom: 5, right: 10),
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 70,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Preview",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
                elevation: 0.0,
                pinned: true,
                bottom: PreferredSize(
                  // Add this code
                  preferredSize: const Size.fromHeight(-8), // Add this code
                  child: Container(), // Add this code
                ),
              ),
            ];
          },
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                const SquareImageWithButton(
                  imgUrl:
                      "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                const SizedBox(height: 16),
                const CardRow(),
                const HomeScreen(),
                const SizedBox(height: 16),
                const SquareImageWithButton(
                  imgUrl:
                      "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
                const SizedBox(height: 16),
                const PromptTextScreen(
                  promptTitle: 'Prompt 1',
                  promptDesc:
                      'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                ),
                // const SizedBox(height: 16),
                // const SquareImageWithButton(
                //   imgUrl:
                //       "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                // ),
                // const SizedBox(height: 16),
                // const PromptTextScreen(
                //   promptTitle: 'Prompt 1',
                //   promptDesc:
                //       'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                // ),
                // const SizedBox(height: 16),
                // Verification(),
                // const PromptTextScreen(
                //   promptTitle: 'Laptop',
                //   hasButton: true,
                // ),
                //MyProfile(),
                //EditProfile(),
                const SizedBox(height: 16),
                BioSection(
                  title: 'Langauges I Know',
                  subtitle: 'Choose the languages you know',
                ),
                //Verification(),
                const SizedBox(height: 16),
              ],
            ),
          )),
      // body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
      //   SliverAppBar(
      //     pinned: true,
      //     floating: true,
      //     backgroundColor: _appBackgroundColor,
      //     stretchTriggerOffset: 50,
      //     toolbarHeight: 60,
      //     flexibleSpace: FlexibleSpaceBar(
      //       // background: Container(
      //       //   color: _appBackgroundColor,
      //       //   child: Padding(
      //       //     padding: !hasScrolled
      //       //         ? const EdgeInsets.only(
      //       //             left: 16,
      //       //             right: 16.0,
      //       //             top: 30,
      //       //           )
      //       //         : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      //       //     child: ProfileHeader(
      //       //       name: 'Edit Profile',
      //       //       bio: 'Complete your profile',
      //       //       isVerified: true,
      //       //       hasScrolled: hasScrolled,
      //       //     ),
      //       //   ),
      //       // ),
      //       title: Text(
      //         "Edit Profile",
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontSize: 20,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //     ),
      //   ),
      //   SliverList(
      //     delegate:
      //         SliverChildBuilderDelegate((BuildContext context, int index) {
      //       return Padding(
      //         padding:
      //             const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      //         child: Column(
      //           children: [
      //             const SizedBox(height: 24),
      //             const SquareImageWithButton(
      //               imgUrl:
      //                   "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      //             ),
      //             const SizedBox(height: 16),
      //             const CardRow(),
      //             const HomeScreen(),
      //             const SizedBox(height: 16),
      //             const SquareImageWithButton(
      //               imgUrl:
      //                   "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      //             ),
      //             const SizedBox(height: 16),
      //             const PromptTextScreen(
      //               promptTitle: 'Prompt 1',
      //               promptDesc:
      //                   'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      //             ),
      //             // const SizedBox(height: 16),
      //             // const SquareImageWithButton(
      //             //   imgUrl:
      //             //       "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      //             // ),
      //             // const SizedBox(height: 16),
      //             // const PromptTextScreen(
      //             //   promptTitle: 'Prompt 1',
      //             //   promptDesc:
      //             //       'lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      //             // ),
      //             // const SizedBox(height: 16),
      //             // Verification(),
      //             // const PromptTextScreen(
      //             //   promptTitle: 'Laptop',
      //             //   hasButton: true,
      //             // ),
      //             //MyProfile(),
      //             //EditProfile(),
      //             const SizedBox(height: 16),
      //             BioSection(
      //               title: 'Langauges I Know',
      //               subtitle: 'Choose the languages you know',
      //             ),
      //             //Verification(),
      //             const SizedBox(height: 16),
      //           ],
      //         ),
      //       );
      //     }, childCount: 1),
      //   ),
      //   SliverList(
      //       delegate:
      //           SliverChildBuilderDelegate((BuildContext context, int index) {
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: .0),
      //       child: Column(
      //         children: [
      //           // HeadingSection(),
      //           // const SizedBox(height: 16),
      //           // const BioSection(
      //           //     title: 'My Bio', subtitle: 'Write a fun and punchy intro'),
      //           // const SizedBox(height: 100),
      //           // const SizedBox(height: 16),
      //           // ProfilePrompts(),
      //           // const BasicsSection(
      //           //     title: 'Basics', subtitle: 'Choose the interests'),
      //           // const BasicsSection(
      //           //     title: 'More about yourself',
      //           //     subtitle: 'Choose the interests'),
      //           // const BioSection(
      //           //     title: 'Languages I know',
      //           //     subtitle: 'Choose the languages you know'),
      //         ],
      //       ),
      //     );
      //   }, childCount: 1)),
      // ]),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
