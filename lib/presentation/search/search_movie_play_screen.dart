import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';

class SearchMoviePlayScreen extends StatelessWidget {
  const SearchMoviePlayScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 140,
                  top: 60,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 100,
                        color: kWhiteColor,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CustomButtonWidget(
                      textSize: 15,
                      icon: Icons.download_for_offline,
                      title: 'Download'),
                  kWidth,
                  const CustomButtonWidget(
                      textSize: 15, icon: Icons.playlist_add, title: 'My List')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 25, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                maxLines: 10,
                style: const TextStyle(fontSize: 15, color: kWhiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
