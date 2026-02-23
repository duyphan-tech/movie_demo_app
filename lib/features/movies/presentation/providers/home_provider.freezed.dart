// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<Movie> get nowPlaying; List<Movie> get topRated; List<Movie> get upcoming; List<Movie> get popular;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.nowPlaying, nowPlaying)&&const DeepCollectionEquality().equals(other.topRated, topRated)&&const DeepCollectionEquality().equals(other.upcoming, upcoming)&&const DeepCollectionEquality().equals(other.popular, popular));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nowPlaying),const DeepCollectionEquality().hash(topRated),const DeepCollectionEquality().hash(upcoming),const DeepCollectionEquality().hash(popular));

@override
String toString() {
  return 'HomeState(nowPlaying: $nowPlaying, topRated: $topRated, upcoming: $upcoming, popular: $popular)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<Movie> nowPlaying, List<Movie> topRated, List<Movie> upcoming, List<Movie> popular
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nowPlaying = null,Object? topRated = null,Object? upcoming = null,Object? popular = null,}) {
  return _then(_self.copyWith(
nowPlaying: null == nowPlaying ? _self.nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as List<Movie>,topRated: null == topRated ? _self.topRated : topRated // ignore: cast_nullable_to_non_nullable
as List<Movie>,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<Movie>,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Movie> nowPlaying,  List<Movie> topRated,  List<Movie> upcoming,  List<Movie> popular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nowPlaying,_that.topRated,_that.upcoming,_that.popular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Movie> nowPlaying,  List<Movie> topRated,  List<Movie> upcoming,  List<Movie> popular)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.nowPlaying,_that.topRated,_that.upcoming,_that.popular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Movie> nowPlaying,  List<Movie> topRated,  List<Movie> upcoming,  List<Movie> popular)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nowPlaying,_that.topRated,_that.upcoming,_that.popular);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required final  List<Movie> nowPlaying, required final  List<Movie> topRated, required final  List<Movie> upcoming, required final  List<Movie> popular}): _nowPlaying = nowPlaying,_topRated = topRated,_upcoming = upcoming,_popular = popular;
  

 final  List<Movie> _nowPlaying;
@override List<Movie> get nowPlaying {
  if (_nowPlaying is EqualUnmodifiableListView) return _nowPlaying;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nowPlaying);
}

 final  List<Movie> _topRated;
@override List<Movie> get topRated {
  if (_topRated is EqualUnmodifiableListView) return _topRated;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topRated);
}

 final  List<Movie> _upcoming;
@override List<Movie> get upcoming {
  if (_upcoming is EqualUnmodifiableListView) return _upcoming;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcoming);
}

 final  List<Movie> _popular;
@override List<Movie> get popular {
  if (_popular is EqualUnmodifiableListView) return _popular;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popular);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._nowPlaying, _nowPlaying)&&const DeepCollectionEquality().equals(other._topRated, _topRated)&&const DeepCollectionEquality().equals(other._upcoming, _upcoming)&&const DeepCollectionEquality().equals(other._popular, _popular));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nowPlaying),const DeepCollectionEquality().hash(_topRated),const DeepCollectionEquality().hash(_upcoming),const DeepCollectionEquality().hash(_popular));

@override
String toString() {
  return 'HomeState(nowPlaying: $nowPlaying, topRated: $topRated, upcoming: $upcoming, popular: $popular)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<Movie> nowPlaying, List<Movie> topRated, List<Movie> upcoming, List<Movie> popular
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nowPlaying = null,Object? topRated = null,Object? upcoming = null,Object? popular = null,}) {
  return _then(_HomeState(
nowPlaying: null == nowPlaying ? _self._nowPlaying : nowPlaying // ignore: cast_nullable_to_non_nullable
as List<Movie>,topRated: null == topRated ? _self._topRated : topRated // ignore: cast_nullable_to_non_nullable
as List<Movie>,upcoming: null == upcoming ? _self._upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<Movie>,popular: null == popular ? _self._popular : popular // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

// dart format on
