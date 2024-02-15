import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/hot_and_new/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String backDropPath;
  final String movieName;
  final String movieDescription;
  const EveryonesWatchingWidget({
    super.key,
    required this.backDropPath,
    required this.movieName,
    required this.movieDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          movieDescription,
          style: const TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(
          imageUrl: backDropPath,
        ),
        kHeight20,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                opacity: .5,
                iconSize: 30,
                textSize: 15,
                icon: Icons.ios_share,
                title: 'Share'),
            kWidth,
            CustomButtonWidget(
                opacity: .5,
                iconSize: 30,
                textSize: 15,
                icon: Icons.add,
                title: 'My List'),
            kWidth,
            CustomButtonWidget(
                opacity: .5,
                iconSize: 30,
                textSize: 15,
                icon: Icons.play_arrow,
                title: 'Play'),
            kWidth
          ],
        ),
      ],
    );
  }
}
