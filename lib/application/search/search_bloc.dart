import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_app/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchServices _searchServices;
  SearchBloc(this._downloadService, this._searchServices)
      : super(SearchState.initial()) {
    // on idle state event
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));

        return;
      }

      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));

      // get trending results
      final result = await _downloadService.getDownloadsImages();
      final _state = result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );

      // show to ui

      emit(_state);
    });

    // on search state

    on<SearchMovie>((event, emit) async {
      emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: true,
          isError: false));

      // call search movie api
      final result =
          await _searchServices.searchMovies(movieQuery: event.movieQuery);

      log('searching ${event.movieQuery}');

      final state1 = result.fold((l) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (searchList) {
        return SearchState(
            searchResultList: searchList.results,
            idleList: state.idleList,
            isLoading: false,
            isError: false);
      });

      // show to ui
      emit(state1);
    });
  }
}
