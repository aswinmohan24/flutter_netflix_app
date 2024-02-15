import 'package:flutter/material.dart';

import 'package:netflix_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kWidth,
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              // fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast),
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
            height: 20,
            width: 20,
          ),
          kWidth,
        ],
      ),
    );
  }
}
