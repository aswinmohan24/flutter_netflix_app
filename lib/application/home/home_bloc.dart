import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hotand_new_resp/hot_and_new_service.dart';
import 'package:netflix_app/domain/hot_and_new/model/hotand_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices homeScreenServices;
  HomeBloc(this.homeScreenServices) : super(HomeState.initial()) {
    // On event LoadData calling in HomeScreen
    on<LoadDataInHomeScreen>((event, emit) async {
      //sent loading to ui
      emit(state.copyWith(isLoading: true, isError: false));

      //get data from api
      final movieResult = await homeScreenServices.getHotandNewMovieData();
      final tvResult = await homeScreenServices.getHotandNewTvData();

      //transform data
      final state1 = movieResult.fold((MainFailure failure) {
        return const HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDaramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true);
      }, (HotandNewResp response) {
        final pastYear = response.results;
        final trending = response.results;
        final dramas = response.results;
        final southIndian = response.results;

        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southIndian.shuffle();
        return HomeState(
            pastYearMovieList: response.results,
            trendingMovieList: trending,
            tenseDaramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            isError: false);
      });
      emit(state1);

      final state2 = tvResult.fold((MainFailure failure) {
        return const HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDaramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true);
      }, (HotandNewResp resp) {
        final top10TvList = resp.results;
        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseDaramaMovieList: state.tenseDaramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10TvList,
            isLoading: false,
            isError: false);
      });

      //show to ui
      emit(state2);
    });
  }
}
