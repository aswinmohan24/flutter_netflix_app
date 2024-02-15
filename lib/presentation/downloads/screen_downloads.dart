import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widgetList = [
    const SmartDownloads(),
    const Section2(),
    const Scetion3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBarWidget(title: 'Downloads')),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: widgetList.length));
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for You',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          "We will download a personalized selection of \n movies and shows for you, so there's \n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading || state.downloads.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.5),
                          radius: size.width * .4,
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(
                            left: 140,
                          ),
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          borderRadius: 10,
                          angle: 20,
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(right: 140),
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          borderRadius: 10,
                          angle: -20,
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(right: 0),
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          borderRadius: 10,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Scetion3 extends StatelessWidget {
  const Scetion3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          minWidth: 350,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: kButtonColorBlue,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Set Up',
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          minWidth: 300,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.margin,
    required this.imageList,
    this.angle = 0,
    required this.borderRadius,
  });

  final EdgeInsets margin;
  final String imageList;
  final double angle;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * .41,
        height: size.width * .61,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: kBlackColor,
            image: DecorationImage(image: NetworkImage(imageList))),
      ),
    );
  }
}
