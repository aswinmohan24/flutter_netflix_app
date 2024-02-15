import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/hot_and_new/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String backDropPath;
  final String movieName;
  final String movieDescription;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.backDropPath,
    required this.movieName,
    required this.movieDescription,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        kheight,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              height: 400,
              child: Column(
                children: [
                  Text(
                    month,
                    style: const TextStyle(fontSize: 20, color: kGreyColor),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        letterSpacing: 6),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width - 60,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  VideoWidget(
                    imageUrl: backDropPath,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 30,
                            fontFamily: kFont1,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                      const CustomButtonWidget(
                          opacity: .5,
                          iconSize: 20,
                          textSize: 15,
                          icon: Icons.notifications,
                          title: 'Remind me'),
                      kWidth20,
                      const CustomButtonWidget(
                          opacity: .5,
                          iconSize: 20,
                          textSize: 15,
                          icon: Icons.info,
                          title: 'Info'),
                      kWidth
                    ],
                  ),
                  Text(
                    'Coming on $month',
                    style: const TextStyle(fontSize: 15),
                  ),
                  kHeight20,
                  Text(
                    movieName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  kheight,
                  Text(
                    movieDescription,
                    maxLines: 4,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kGreyColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
