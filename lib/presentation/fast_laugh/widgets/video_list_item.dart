import 'package:flutter/material.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:video_player/video_player.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

// for creating fast laugh screen usign stack
// ignore: must_be_immutable
class VideoListItem extends StatelessWidget with ChangeNotifier {
  final int index;

  VideoListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrls = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrls, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // left side of fast laugh stack in row
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: kBlackColor.withOpacity(.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        color: kWhiteColor,
                        size: 30,
                      )),
                ),
                // right side of fast laugh in row
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdNotifier,
                      builder: (context, likedList, _) {
                        final indexValue = index;
                        if (likedList.contains(indexValue)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.remove(indexValue);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoACtionsWidget(
                                iconColor: Colors.red,
                                icon: Icons.favorite,
                                title: 'Liked'),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.add(indexValue);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoACtionsWidget(
                                //iconColor: Colors.red,
                                icon: Icons.favorite,
                                title: 'Like'),
                          );
                        }
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: myListindexNotifier,
                      builder: (context, myNewList, _) {
                        final myListIndex = index;
                        if (myNewList.contains(myListIndex)) {
                          return GestureDetector(
                            onTap: () {
                              myListindexNotifier.value.remove(myListIndex);
                              myListindexNotifier.notifyListeners();
                            },
                            child: const VideoACtionsWidget(
                                icon: Icons.playlist_add_check, title: 'Added'),
                          );
                        } else {
                          return GestureDetector(
                              onTap: () {
                                myListindexNotifier.value.add(myListIndex);
                                myListindexNotifier.notifyListeners();
                              },
                              child: const VideoACtionsWidget(
                                  icon: Icons.add, title: 'My List'));
                        }
                      },
                    ),
                    const VideoACtionsWidget(icon: Icons.share, title: 'Share'),
                    const VideoACtionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//this widget is created for right side list of fast laugh screen add,emoji,share and etc..
class VideoACtionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  const VideoACtionsWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconColor = kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final void Function(bool isPlaying) onStateChanged;

  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    videoPlayerController.initialize().then((value) {
      setState(() {
        videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
