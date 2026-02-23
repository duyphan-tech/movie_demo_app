// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetail {

 int get id; String get title; String? get originalTitle; String get overview; String? get posterPath; String? get backdropPath; String get releaseDate; double get voteAverage; int get voteCount; String get status; String? get tagline; int get runtime; int get budget; int get revenue; List<Genre> get genres;
/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailCopyWith<MovieDetail> get copyWith => _$MovieDetailCopyWithImpl<MovieDetail>(this as MovieDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other.genres, genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,posterPath,backdropPath,releaseDate,voteAverage,voteCount,status,tagline,runtime,budget,revenue,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, status: $status, tagline: $tagline, runtime: $runtime, budget: $budget, revenue: $revenue, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $MovieDetailCopyWith<$Res>  {
  factory $MovieDetailCopyWith(MovieDetail value, $Res Function(MovieDetail) _then) = _$MovieDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? originalTitle, String overview, String? posterPath, String? backdropPath, String releaseDate, double voteAverage, int voteCount, String status, String? tagline, int runtime, int budget, int revenue, List<Genre> genres
});




}
/// @nodoc
class _$MovieDetailCopyWithImpl<$Res>
    implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._self, this._then);

  final MovieDetail _self;
  final $Res Function(MovieDetail) _then;

/// Create a copy of MovieDetail
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
as List<Genre>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetail].
extension MovieDetailPatterns on MovieDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetail value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetail value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? originalTitle,  String overview,  String? posterPath,  String? backdropPath,  String releaseDate,  double voteAverage,  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<Genre> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? originalTitle,  String overview,  String? posterPath,  String? backdropPath,  String releaseDate,  double voteAverage,  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<Genre> genres)  $default,) {final _that = this;
switch (_that) {
case _MovieDetail():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? originalTitle,  String overview,  String? posterPath,  String? backdropPath,  String releaseDate,  double voteAverage,  int voteCount,  String status,  String? tagline,  int runtime,  int budget,  int revenue,  List<Genre> genres)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetail() when $default != null:
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.posterPath,_that.backdropPath,_that.releaseDate,_that.voteAverage,_that.voteCount,_that.status,_that.tagline,_that.runtime,_that.budget,_that.revenue,_that.genres);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetail implements MovieDetail {
  const _MovieDetail({required this.id, required this.title, this.originalTitle, required this.overview, this.posterPath, this.backdropPath, required this.releaseDate, required this.voteAverage, required this.voteCount, required this.status, this.tagline, required this.runtime, required this.budget, required this.revenue, required final  List<Genre> genres}): _genres = genres;
  

@override final  int id;
@override final  String title;
@override final  String? originalTitle;
@override final  String overview;
@override final  String? posterPath;
@override final  String? backdropPath;
@override final  String releaseDate;
@override final  double voteAverage;
@override final  int voteCount;
@override final  String status;
@override final  String? tagline;
@override final  int runtime;
@override final  int budget;
@override final  int revenue;
 final  List<Genre> _genres;
@override List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailCopyWith<_MovieDetail> get copyWith => __$MovieDetailCopyWithImpl<_MovieDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other._genres, _genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,posterPath,backdropPath,releaseDate,voteAverage,voteCount,status,tagline,runtime,budget,revenue,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, status: $status, tagline: $tagline, runtime: $runtime, budget: $budget, revenue: $revenue, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailCopyWith<$Res> implements $MovieDetailCopyWith<$Res> {
  factory _$MovieDetailCopyWith(_MovieDetail value, $Res Function(_MovieDetail) _then) = __$MovieDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? originalTitle, String overview, String? posterPath, String? backdropPath, String releaseDate, double voteAverage, int voteCount, String status, String? tagline, int runtime, int budget, int revenue, List<Genre> genres
});




}
/// @nodoc
class __$MovieDetailCopyWithImpl<$Res>
    implements _$MovieDetailCopyWith<$Res> {
  __$MovieDetailCopyWithImpl(this._self, this._then);

  final _MovieDetail _self;
  final $Res Function(_MovieDetail) _then;

/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? originalTitle = freezed,Object? overview = null,Object? posterPath = freezed,Object? backdropPath = freezed,Object? releaseDate = null,Object? voteAverage = null,Object? voteCount = null,Object? status = null,Object? tagline = freezed,Object? runtime = null,Object? budget = null,Object? revenue = null,Object? genres = null,}) {
  return _then(_MovieDetail(
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
as List<Genre>,
  ));
}


}

// dart format on
