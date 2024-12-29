import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/components/chat/chat_screen_title.dart';
import 'package:testapp/components/bottom_menu.dart';
import 'package:testapp/components/like/togglebutton.dart';
import 'package:testapp/components/like/like_image.dart';

final profileProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  const String apiUrl =
      'http://35.154.234.237/profile/profileDetails/9b885766-be84-460a-a22a-b0602773e39c/'; // Replace with your API URL

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    return responseData['data'];
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
});

class LikePage extends ConsumerWidget {
  LikePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsyncValue = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: profileAsyncValue.when(
        data: (profileData) {
          final likedUsers = profileData['liked_users'] as List<dynamic>;

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: null,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                stretchTriggerOffset: 50,
                toolbarHeight: 20,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        children: [
                          ChatScreenTitle(
                            title: 'Likes Received',
                            subtitle:
                                'Connection Invitation sent to you will be shown here',
                          ),
                          ToggleButton(),
                          const SizedBox(height: 20),

                          // Display liked users dynamically
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: likedUsers.map((user) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/like/details');
                                },
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: LikeImage(user: user),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
