import 'package:flutter/material.dart';
import 'package:testapp/components/chat/chat_screen_title.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/components/like/TopSectionGrid.dart';
import 'package:testapp/components/like/invites.dart';
import 'package:testapp/components/like/togglebutton.dart';
import 'package:testapp/components/like/like_image.dart';
import 'package:testapp/components/like/like_header.dart';

class LikePage extends StatefulWidget {
  LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
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
      //backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          leading: null,
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          //backgroundColor: _appBackgroundColor,
          backgroundColor: Colors.white,
          stretchTriggerOffset: 50,
          toolbarHeight: 20,
          // flexibleSpace: FlexibleSpaceBar(),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return  Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              children: [
                //-------------Like Screen---------------
                ChatScreenTitle(
                    title: 'Likes Received', subtitle: 'Connection Invitation sent to you will be shown here'),
                    //BorderBox(),
                    //SizedBox(height: 10),
                    //InvitesBox(),
                    //SizedBox(height: 20),
                    ToggleButton(),
                    SizedBox(height: 20),
                    //LikeImage(),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First card
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: LikeImage(),
                      ),
                    ),
                    // Second card
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: LikeImage(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First card
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: LikeImage(),
                      ),
                    ),
                    // Second card
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: LikeImage(),
                      ),
                    ),
                  ],
                ),

                //LikeHeader(),
                //------add components here

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
