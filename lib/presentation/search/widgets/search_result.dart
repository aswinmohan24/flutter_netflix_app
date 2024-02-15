import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/search_movie_play_screen.dart';
import 'package:netflix_app/presentation/search/widgets/titile.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: 1 / 1.4,
                children: List.generate(state.searchResultList.length, (index) {
                  final movie = state.searchResultList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return SearchMoviePlayScreen(
                          description: movie.description ?? 'No Description',
                          imageUrl: '$imageAppendUrl${movie.backdropPath}',
                          title: movie.originalTitle ?? 'No Title',
                        );
                      }));
                    },
                    child:
                        MainCard(imgUrl: '$imageAppendUrl${movie.posterPath}'),
                  );
                }),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imgUrl;

  const MainCard({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
