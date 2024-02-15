// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadDataInHomeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadDataInHomeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadDataInHomeScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDataInHomeScreen value) loadDataInHomeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDataInHomeScreen value)? loadDataInHomeScreen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDataInHomeScreen value)? loadDataInHomeScreen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadDataInHomeScreenImplCopyWith<$Res> {
  factory _$$LoadDataInHomeScreenImplCopyWith(_$LoadDataInHomeScreenImpl value,
          $Res Function(_$LoadDataInHomeScreenImpl) then) =
      __$$LoadDataInHomeScreenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDataInHomeScreenImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadDataInHomeScreenImpl>
    implements _$$LoadDataInHomeScreenImplCopyWith<$Res> {
  __$$LoadDataInHomeScreenImplCopyWithImpl(_$LoadDataInHomeScreenImpl _value,
      $Res Function(_$LoadDataInHomeScreenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadDataInHomeScreenImpl implements LoadDataInHomeScreen {
  const _$LoadDataInHomeScreenImpl();

  @override
  String toString() {
    return 'HomeEvent.loadDataInHomeScreen()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDataInHomeScreenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadDataInHomeScreen,
  }) {
    return loadDataInHomeScreen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadDataInHomeScreen,
  }) {
    return loadDataInHomeScreen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadDataInHomeScreen,
    required TResult orElse(),
  }) {
    if (loadDataInHomeScreen != null) {
      return loadDataInHomeScreen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadDataInHomeScreen value) loadDataInHomeScreen,
  }) {
    return loadDataInHomeScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadDataInHomeScreen value)? loadDataInHomeScreen,
  }) {
    return loadDataInHomeScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadDataInHomeScreen value)? loadDataInHomeScreen,
    required TResult orElse(),
  }) {
    if (loadDataInHomeScreen != null) {
      return loadDataInHomeScreen(this);
    }
    return orElse();
  }
}

abstract class LoadDataInHomeScreen implements HomeEvent {
  const factory LoadDataInHomeScreen() = _$LoadDataInHomeScreenImpl;
}

/// @nodoc
mixin _$HomeState {
  List<HotAndNewData> get pastYearMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tenseDaramaMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southIndianMovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingTvList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HotAndNewData> pastYearMovieList,
      List<HotAndNewData> trendingMovieList,
      List<HotAndNewData> tenseDaramaMovieList,
      List<HotAndNewData> southIndianMovieList,
      List<HotAndNewData> trendingTvList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pastYearMovieList = null,
    Object? trendingMovieList = null,
    Object? tenseDaramaMovieList = null,
    Object? southIndianMovieList = null,
    Object? trendingTvList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      pastYearMovieList: null == pastYearMovieList
          ? _value.pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovieList: null == trendingMovieList
          ? _value.trendingMovieList
          : trendingMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDaramaMovieList: null == tenseDaramaMovieList
          ? _value.tenseDaramaMovieList
          : tenseDaramaMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovieList: null == southIndianMovieList
          ? _value.southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value.trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HotAndNewData> pastYearMovieList,
      List<HotAndNewData> trendingMovieList,
      List<HotAndNewData> tenseDaramaMovieList,
      List<HotAndNewData> southIndianMovieList,
      List<HotAndNewData> trendingTvList,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pastYearMovieList = null,
    Object? trendingMovieList = null,
    Object? tenseDaramaMovieList = null,
    Object? southIndianMovieList = null,
    Object? trendingTvList = null,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$InitialImpl(
      pastYearMovieList: null == pastYearMovieList
          ? _value._pastYearMovieList
          : pastYearMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovieList: null == trendingMovieList
          ? _value._trendingMovieList
          : trendingMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tenseDaramaMovieList: null == tenseDaramaMovieList
          ? _value._tenseDaramaMovieList
          : tenseDaramaMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovieList: null == southIndianMovieList
          ? _value._southIndianMovieList
          : southIndianMovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingTvList: null == trendingTvList
          ? _value._trendingTvList
          : trendingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<HotAndNewData> pastYearMovieList,
      required final List<HotAndNewData> trendingMovieList,
      required final List<HotAndNewData> tenseDaramaMovieList,
      required final List<HotAndNewData> southIndianMovieList,
      required final List<HotAndNewData> trendingTvList,
      required this.isLoading,
      required this.isError})
      : _pastYearMovieList = pastYearMovieList,
        _trendingMovieList = trendingMovieList,
        _tenseDaramaMovieList = tenseDaramaMovieList,
        _southIndianMovieList = southIndianMovieList,
        _trendingTvList = trendingTvList;

  final List<HotAndNewData> _pastYearMovieList;
  @override
  List<HotAndNewData> get pastYearMovieList {
    if (_pastYearMovieList is EqualUnmodifiableListView)
      return _pastYearMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearMovieList);
  }

  final List<HotAndNewData> _trendingMovieList;
  @override
  List<HotAndNewData> get trendingMovieList {
    if (_trendingMovieList is EqualUnmodifiableListView)
      return _trendingMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingMovieList);
  }

  final List<HotAndNewData> _tenseDaramaMovieList;
  @override
  List<HotAndNewData> get tenseDaramaMovieList {
    if (_tenseDaramaMovieList is EqualUnmodifiableListView)
      return _tenseDaramaMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDaramaMovieList);
  }

  final List<HotAndNewData> _southIndianMovieList;
  @override
  List<HotAndNewData> get southIndianMovieList {
    if (_southIndianMovieList is EqualUnmodifiableListView)
      return _southIndianMovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovieList);
  }

  final List<HotAndNewData> _trendingTvList;
  @override
  List<HotAndNewData> get trendingTvList {
    if (_trendingTvList is EqualUnmodifiableListView) return _trendingTvList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingTvList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(pastYearMovieList: $pastYearMovieList, trendingMovieList: $trendingMovieList, tenseDaramaMovieList: $tenseDaramaMovieList, southIndianMovieList: $southIndianMovieList, trendingTvList: $trendingTvList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._pastYearMovieList, _pastYearMovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingMovieList, _trendingMovieList) &&
            const DeepCollectionEquality()
                .equals(other._tenseDaramaMovieList, _tenseDaramaMovieList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovieList, _southIndianMovieList) &&
            const DeepCollectionEquality()
                .equals(other._trendingTvList, _trendingTvList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pastYearMovieList),
      const DeepCollectionEquality().hash(_trendingMovieList),
      const DeepCollectionEquality().hash(_tenseDaramaMovieList),
      const DeepCollectionEquality().hash(_southIndianMovieList),
      const DeepCollectionEquality().hash(_trendingTvList),
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final List<HotAndNewData> pastYearMovieList,
      required final List<HotAndNewData> trendingMovieList,
      required final List<HotAndNewData> tenseDaramaMovieList,
      required final List<HotAndNewData> southIndianMovieList,
      required final List<HotAndNewData> trendingTvList,
      required final bool isLoading,
      required final bool isError}) = _$InitialImpl;

  @override
  List<HotAndNewData> get pastYearMovieList;
  @override
  List<HotAndNewData> get trendingMovieList;
  @override
  List<HotAndNewData> get tenseDaramaMovieList;
  @override
  List<HotAndNewData> get southIndianMovieList;
  @override
  List<HotAndNewData> get trendingTvList;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
