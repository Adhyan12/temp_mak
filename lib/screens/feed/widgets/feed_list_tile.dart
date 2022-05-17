import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../router/routes.dart';

class FeedListTile extends StatelessWidget {
  const FeedListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.venueProfileScreen);
        },
        child: CircularProfileAvatar(
          '',
          radius: 25,
          elevation: 0.0,
          child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl:
                'https://media-cdn.tripadvisor.com/media/photo-s/1a/b8/46/6d/london-stock.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: const Text(
        "Announcing happy hours this thursday (19th May)",
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text(
        "Pratik Baid",
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      trailing: const Text(
        "10:30AM",
        style: TextStyle(fontSize: 12.0, color: Colors.black),
      ),
    );
  }
}
