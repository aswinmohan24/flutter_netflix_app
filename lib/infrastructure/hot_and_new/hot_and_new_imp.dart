import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hotand_new_resp/hot_and_new_service.dart';
import 'package:netflix_app/domain/hot_and_new/model/hotand_new_resp.dart';

@LazySingleton(as: HotAndNewServices)
class HotAndNewImplementation implements HotAndNewServices {
  @override
  Future<Either<MainFailure, HotandNewResp>> getHotandNewMovieData() async {
    try {
      // Doing API GET Request
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      // log('response : ${response.data.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotandNewResp.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotandNewResp>> getHotandNewTvData() async {
    try {
      // Doing API GET Request
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      // log('response : ${response.data.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotandNewResp.fromJson(response.data);

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
