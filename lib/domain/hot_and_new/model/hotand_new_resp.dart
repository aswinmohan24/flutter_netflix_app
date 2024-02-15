import 'package:json_annotation/json_annotation.dart';
part 'hotand_new_resp.g.dart';

@JsonSerializable()
class HotandNewResp {
  @JsonKey(name: 'page')
  num? page;

  @JsonKey(name: 'results')
  List<HotAndNewData> results;

  HotandNewResp({this.page, this.results = const []});

  factory HotandNewResp.fromJson(Map<String, dynamic> json) {
    return _$HotandNewRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewRespToJson(this);
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'poster_path')
  String? posterpPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

// this field for everyones choice widget, use original name instaed of original title
  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  HotAndNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.title,
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
