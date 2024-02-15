import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  //fit: BoxFit.cover,
                  image: NetworkImage(kHomeMainImage))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _playButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
          foregroundColor: kBlackColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
    );
  }
}
