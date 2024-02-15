import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> likedVideosIdNotifier = ValueNotifier({});
ValueNotifier<Set<int>> myListindexNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo downloadsRepo)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(state.copyWith(
        // showing loading on ui
        isLoading: true,
        videoList: [],
        isError: false,
      ));
      // get trending images for fast laugh screen
      final result = await downloadsRepo.getDownloadsImages();
      final resultState = result.fold((l) {
        return const FastLaughState(
            videoList: [], isLoading: false, isError: true);
      }, (r) {
        return FastLaughState(videoList: r, isLoading: false, isError: false);
      });

      // show to ui
      emit(resultState);
    });
  }
}
