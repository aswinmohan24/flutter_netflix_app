import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 200,
              width: 50,
            ),
            Container(
              width: 125,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imageUrl, scale: 1.0))),
            ),
          ],
        ),
        Positioned(
          left: 30,
          top: 85,
          child: BorderedText(
            // It's a package for adding stroke in a text widget
            strokeWidth: 3.0,
            strokeColor: kWhiteColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: kBlackColor,
                  //decoration: TextDecoration.none,
                  // decorationColor: kBlackColor,
                  fontSize: 120,
                  //fontFamily: GoogleFonts.londrinaOutline().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
