import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class ScreenHomeMainCard extends StatelessWidget {
  final String imageurl;
  const ScreenHomeMainCard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 125,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: kRadius10,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imageurl))),
      ),
    );
  }
}
