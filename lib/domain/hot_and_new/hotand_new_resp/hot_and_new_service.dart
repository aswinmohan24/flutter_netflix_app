import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/model/hotand_new_resp.dart';

abstract class HotAndNewServices {
  Future<Either<MainFailure, HotandNewResp>> getHotandNewMovieData();
  Future<Either<MainFailure, HotandNewResp>> getHotandNewTvData();
}
