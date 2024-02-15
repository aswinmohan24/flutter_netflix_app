import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';

import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card.dart';

import 'package:netflix_app/presentation/home/widgets/number_card.dart';

import 'package:netflix_app/widgets/main_title.dart';

import 'package:netflix_app/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const LoadDataInHomeScreen());
    });
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, _) {
            return NotificationListener<UserScrollNotification>(
              // to get the scroll direction from user side
              onNotification: (notification) {
                final ScrollDirection scrollDirection = notification.direction;
                log(scrollDirection.toString());

                if (scrollDirection == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                }

                // else if (scrollDirection == ScrollDirection.idle) {
                //   scrollNotifier.value = false;
                // }

                else {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.isError) {
                        return const Center(
                          child: Text('Error while getting data'),
                        );
                      }

                      //List<HotAndNewData> maped to releasedast list<String>
                      final releasesPastPoster =
                          state.pastYearMovieList.map((m) {
                        return '$imageAppendUrl${m.posterpPath}';
                      }).toList();

                      //List<HotAndNewData> maped to trendingno list<String>

                      final trendingNowPoster =
                          state.trendingMovieList.map((m) {
                        return '$imageAppendUrl${m.posterpPath}';
                      }).toList();

                      //List<HotAndNewData> maped to tenseDaramaPoster list<String>

                      final tensDaramasPoster =
                          state.tenseDaramaMovieList.map((m) {
                        return '$imageAppendUrl${m.posterpPath}';
                      }).toList();

                      //List<HotAndNewData> maped to southIndianMoviePoster list<String>

                      final southIndianMoviePoster =
                          state.southIndianMovieList.map((m) {
                        return '$imageAppendUrl${m.posterpPath}';
                      }).toList();
                      // releasesPastPoster.shuffle();
                      // trendingNowPoster.shuffle();
                      // tensDaramasPoster.shuffle();
                      // southIndianMoviePoster.shuffle();

                      //List<HotAndNewData> maped to tvShowPoster list<String for displaying on number title card widget>
                      final tvShowPoster = state.trendingTvList.map((e) {
                        return '$imageAppendUrl${e.posterpPath}';
                      }).toList();

                      return ListView(
                        children: [
                          const BackGroundCard(),
                          MainTitleCard(
                            posterList: releasesPastPoster,
                            title: 'Released in the past year',
                          ),
                          kheight,
                          MainTitleCard(
                            posterList: trendingNowPoster,
                            title: 'Trending Now',
                          ),
                          kheight,
                          NumberTitileCard(
                            tvShowPosterList: tvShowPoster,
                          ),
                          kheight,
                          MainTitleCard(
                              posterList: tensDaramasPoster,
                              title: 'Tense Dramas'),
                          kheight,
                          MainTitleCard(
                              posterList: southIndianMoviePoster,
                              title: 'South Indian Cinema'),
                        ],
                      );
                    },
                  ),

                  //scrollNotifier will notify a boolean value if its true a container will be displayed or it is false a sized box will be displayed , it's done using ternary operator
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 9),
                          child: Container(
                            color: Colors.black.withOpacity(.1),
                            width: double.infinity,
                            height: 100,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://pngimg.com/uploads/netflix/netflix_PNG15.png",
                                      width: 40,
                                      height: 40,
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
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Tv Shows',
                                      style: kHomeTitleStyle,
                                    ),
                                    Text(
                                      'Movies',
                                      style: kHomeTitleStyle,
                                    ),
                                    Text(
                                      'Categories',
                                      style: kHomeTitleStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : kheight,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NumberTitileCard extends StatelessWidget {
  final List<String> tvShowPosterList;
  const NumberTitileCard({
    super.key,
    required this.tvShowPosterList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(
            title: 'Top 10 TV Shows in India Today',
          ),
          kheight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        imageUrl: tvShowPosterList[index],
                        index: index,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
