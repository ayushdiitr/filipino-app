import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final List posts;

  PostList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.article),
          title: Text(posts[index].title),
          subtitle: Text(posts[index].summary),
        );
      },
    );
  }
}
