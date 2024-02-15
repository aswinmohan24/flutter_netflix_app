import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'package:netflix_app/presentation/hot_and_new/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/hot_and_new/widgets/everyones_watching_widget.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New & Hot',
            style: TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          actions: [
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
          bottom: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: kBlackColor,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: kWhiteColor,
            indicator:
                BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
            tabs: const [
              Tab(
                text: '🍿 Coming Soon',
              ),
              Tab(
                text: "👀 Everyone's Choice",
              )
            ],
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key('coming_soon'),
          ),
          EveryOnesWatchingList()
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });

    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while Loading List'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('Coming Soon List is empty'),
          );
        } else {
          return ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                log(movie.releaseDate.toString());
                final date = DateTime.parse(movie.releaseDate!);
                final formattedDate = DateFormat.MMMd().format(date);
                log(formattedDate);
                final splittedDate = formattedDate.split(' ');

                if (movie.id == null) {
                  return const SizedBox();
                }
                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: splittedDate.first,
                    day: splittedDate.last,
                    backDropPath: '$imageAppendUrl${movie.backdropPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    movieDescription: movie.overview ?? 'No Description');
              });
        }
      },
    );
  }
}

class EveryOnesWatchingList extends StatelessWidget {
  const EveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryonesWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while Loading List'),
            );
          } else if (state.everyOnesWatchingList.isEmpty) {
            return const Center(
              child: Text('EveryOnes List is empty'),
            );
          } else {
            return ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: state.everyOnesWatchingList.length,
                itemBuilder: (context, index) {
                  final tvShow = state.everyOnesWatchingList[index];

                  if (tvShow.id == null) {
                    return const SizedBox();
                  }
                  if (tvShow.backdropPath == null) {
                    return const SizedBox(child: Icon(Icons.broken_image));
                  }
                  return EveryonesWatchingWidget(
                      backDropPath: '$imageAppendUrl${tvShow.backdropPath}',
                      movieName: tvShow.originalName ?? 'No Title',
                      movieDescription: tvShow.overview ?? 'No Description');
                });
          }
        },
      ),
    );
  }
}
