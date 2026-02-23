// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailModel {

 int get id; String get title;@JsonKey(name: 'original_title') String? get originalTitle; String get overview;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'backdrop_path') String? get backdropPath;@JsonKey(name: 'release_date') String get releaseDate;@JsonKey(name: 'vote_average') double get voteAverage;@JsonKey(name: 'vote_count') int get voteCount; String get status; String? get tagline; int get runtime; int get budget; int get revenue; List<GenreModel> get genres;
/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailModelCopyWith<MovieDetailModel> get copyWith => _$MovieDetailModelCopyWithImpl<MovieDetailModel>(this as MovieDetailModel, _$identity);

  /// Serializes this MovieDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,posterPath,backdropPath,releaseDate,voteAverage,voteCount,status,tagline,runtime,budget,revenue,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'MovieDetailModel(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, status: $status, tagline: $tagline, runtime: $runtime, budget: $budget, revenue: $revenue, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $MovieDetailModelCopyWith<$Res>  {
  factory $MovieDetailModelCopyWith(MovieDetailModel value, $Res Function(MovieDetailModel) _then) = _$MovieDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'original_title') String? originalTitle, String overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount, String status, String? tagline, int runtime, int budget, int revenue, List<GenreModel> genres
});




}
/// @nodoc
class _$MovieDetailModelCopyWithImpl<$Res>
    implements $MovieDetailModelCopyWith<$Res> {
  _$MovieDetailModelCopyWithImpl(this._self, this._then);

  final MovieDetailModel _self;
  final $Res Function(MovieDetailModel) _then;

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? originalTitle = freezed,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = null,Object? voteAverage = null,Object? voteCount = null,Object? status = null,Object? tagline = freezed,Object? runtime = null,Object? budget = null,Object? revenue = null,Object? genres = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailModel].
extension MovieDetailModelPatterns on MovieDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'original_title')  String? originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<GenreModel> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.voteAverage,_that.voteCount,_that.status,_that.tagline,_that.runtime,_that.budget,_that.revenue,_that.genres);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'original_title')  String? originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<GenreModel> genres)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailModel():
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.voteAverage,_that.voteCount,_that.status,_that.tagline,_that.runtime,_that.budget,_that.revenue,_that.genres);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'original_title')  String? originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'release_date')  String releaseDate, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<GenreModel> genres)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.voteAverage,_that.voteCount,_that.status,_that.tagline,_that.runtime,_that.budget,_that.revenue,_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieDetailModel implements MovieDetailModel {
  const _MovieDetailModel({required this.id, required this.title, @JsonKey(name: 'original_title') this.originalTitle, required this.overview, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'backdrop_path') this.backdropPath, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'vote_average') required this.voteAverage, @JsonKey(name: 'vote_count') required this.voteCount, required this.status, this.tagline, required this.runtime, required this.budget, required this.revenue, required final  List<GenreModel> genres}): _genres = genres;
  factory _MovieDetailModel.fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'original_title') final  String? originalTitle;
@override final  String overview;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override@JsonKey(name: 'release_date') final  String releaseDate;
@override@JsonKey(name: 'vote_average') final  double voteAverage;
@override@JsonKey(name: 'vote_count') final  int voteCount;
@override final  String status;
@override final  String? tagline;
@override final  int runtime;
@override final  int budget;
@override final  int revenue;
 final  List<GenreModel> _genres;
@override List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailModelCopyWith<_MovieDetailModel> get copyWith => __$MovieDetailModelCopyWithImpl<_MovieDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,posterPath,backdropPath,releaseDate,voteAverage,voteCount,status,tagline,runtime,budget,revenue,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'MovieDetailModel(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, status: $status, tagline: $tagline, runtime: $runtime, budget: $budget, revenue: $revenue, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailModelCopyWith<$Res> implements $MovieDetailModelCopyWith<$Res> {
  factory _$MovieDetailModelCopyWith(_MovieDetailModel value, $Res Function(_MovieDetailModel) _then) = __$MovieDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'original_title') String? originalTitle, String overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'release_date') String releaseDate,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount, String status, String? tagline, int runtime, int budget, int revenue, List<GenreModel> genres
});




}
/// @nodoc
class __$MovieDetailModelCopyWithImpl<$Res>
    implements _$MovieDetailModelCopyWith<$Res> {
  __$MovieDetailModelCopyWithImpl(this._self, this._then);

  final _MovieDetailModel _self;
  final $Res Function(_MovieDetailModel) _then;

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? originalTitle = freezed,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = null,Object? voteAverage = null,Object? voteCount = null,Object? status = null,Object? tagline = freezed,Object? runtime = null,Object? budget = null,Object? revenue = null,Object? genres = null,}) {
  return _then(_MovieDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalTitle: freezed == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,
  ));
}


}

// dart format on
