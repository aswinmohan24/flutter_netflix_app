// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotand_new_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotandNewResp _$HotandNewRespFromJson(Map<String, dynamic> json) =>
    HotandNewResp(
      page: json['page'] as num?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HotAndNewData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HotandNewRespToJson(HotandNewResp instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

HotAndNewData _$HotAndNewDataFromJson(Map<String, dynamic> json) =>
    HotAndNewData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
    )
      ..posterpPath = json['poster_path'] as String?
      ..originalName = json['original_name'] as String?;

Map<String, dynamic> _$HotAndNewDataToJson(HotAndNewData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterpPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'title': instance.title,
    };
