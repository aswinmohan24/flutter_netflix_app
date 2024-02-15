import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hotand_new_resp/hot_and_new_service.dart';
import 'package:netflix_app/domain/hot_and_new/model/hotand_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices hotAndNewServices;
  HotAndNewBloc(this.hotAndNewServices) : super(HotAndNewState.initial()) {
    // get hotandnew movie data event
    on<LoadDataInComingSoon>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOnesWatchingList: [],
            isLoading: false,
            isError: false);
        return;
      }
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOnesWatchingList: [],
          isLoading: true,
          isError: false));

      final result = await hotAndNewServices.getHotandNewMovieData();
      final newState = result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true);
      }, (HotandNewResp resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyOnesWatchingList: state.everyOnesWatchingList,
            isLoading: false,
            isError: false);
      });
      //showing to ui
      emit(newState);
    });

    on<LoadDataInEveryonesWatching>((event, emit) async {
      if (state.everyOnesWatchingList.isNotEmpty) {
        HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: state.everyOnesWatchingList,
            isLoading: false,
            isError: false);
        return;
      }
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOnesWatchingList: [],
          isLoading: true,
          isError: false));

      final result = await hotAndNewServices.getHotandNewTvData();
      final newState = result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true);
      }, (HotandNewResp resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOnesWatchingList: resp.results,
            isLoading: false,
            isError: false);
      });
      //showing to ui
      emit(newState);
    });
  }
}
