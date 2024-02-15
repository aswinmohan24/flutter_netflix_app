import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/titile.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextTitle(
            title: 'Top Searches',
          ),
          kheight,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else if (state.idleList.isEmpty) {
                  return const Center(
                    child: Text('List is empty'),
                  );
                }

                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = state.idleList[index];
                      return TopSearchItemTile(
                          title: movie.title ?? 'No title',
                          imgUrl: '$imageAppendUrl${movie.posterPath}');
                    },
                    separatorBuilder: (context, index) => kHeight20,
                    itemCount: state.idleList.length);
              },
            ),
          )
        ],
      )),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * .35,
          height: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imgUrl))),
        ),
        kWidth20,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(CupertinoIcons.play_fill, color: kWhiteColor),
          ),
        ),
      ],
    );
  }
}
