import 'package:flutter/material.dart';
import 'package:testapp/components/explore/carousel.dart';
import 'package:testapp/components/explore/profile_tags.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/components/explore/title.dart';
import 'package:testapp/components/explore/exploreButton.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          backgroundColor: _appBackgroundColor,
          stretchTriggerOffset: 50,
          toolbarHeight: 60,
          flexibleSpace: FlexibleSpaceBar(),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // EditProfile(),

                  const SizedBox(height: 48),
                  // const SquareImageWithButton(
                  //   imgUrl:
                  //       "https://images.unsplash.com/photo-1472586662442-3eec04b9dbda?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  // ),
                  // const SizedBox(height: 16),
                  // Verification(),

                  const SizedBox(height: 16),
                ],
              ),
            );
          }, childCount: 1),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: .0),
            child: Column(
              children: [
                //HeadingSection(),
                TitleScreen(),
                // SizedBox(
                //   height: 440,
                //   child:
                // ),
                // ExploreButton(),
                FilterTags(
                    title: 'Ideal Connections',
                    subtitle:
                        'People filtered by shared interests, ready for connection'),
                ProfileCarousel(),
                const SizedBox(height: 20),
              ],
            ),
          );
        }, childCount: 1)),
      ]),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
