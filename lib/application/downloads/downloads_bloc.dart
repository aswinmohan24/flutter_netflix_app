import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@Injectable()
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo
      _downloadsRepo; // created an object for IDownloadsRepo to get the methods
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    // API call event starts and isLoading become true
    on<_GetDownloadsImages>((event, emit) async {
      if (state.downloads.isNotEmpty) {
        emit(state.copyWith(
          downloads: state.downloads,
          isLoading: false,
          downloadFailureOrSuccessOption: none(),
        ));
      }

      emit(state.copyWith(
        isLoading: true,
        downloadFailureOrSuccessOption: none(),
      ));

      final Either<MainFailure, List<Downloads>> downloadOptions =
          await _downloadsRepo.getDownloadsImages(); //  start the api call

      //log(downloadOptions.toString());
      emit(downloadOptions.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadFailureOrSuccessOption: Some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadFailureOrSuccessOption: some(right(success)))));
    });
  }
}
