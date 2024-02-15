import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/search/models/search_resp/search_resp.dart';
import 'package:netflix_app/domain/search/search_services.dart';

@LazySingleton(as: SearchServices)
class SearchImpl implements SearchServices {
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery}) async {
    try {
      // Doing API GET Request
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});
      // log('response : ${response.data.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
