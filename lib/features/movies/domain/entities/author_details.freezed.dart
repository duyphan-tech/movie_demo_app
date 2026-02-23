// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthorDetails {

 String? get name; String? get username; String? get avatarPath; double? get rating;
/// Create a copy of AuthorDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorDetailsCopyWith<AuthorDetails> get copyWith => _$AuthorDetailsCopyWithImpl<AuthorDetails>(this as AuthorDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,name,username,avatarPath,rating);

@override
String toString() {
  return 'AuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $AuthorDetailsCopyWith<$Res>  {
  factory $AuthorDetailsCopyWith(AuthorDetails value, $Res Function(AuthorDetails) _then) = _$AuthorDetailsCopyWithImpl;
@useResult
$Res call({
 String? name, String? username, String? avatarPath, double? rating
});




}
/// @nodoc
class _$AuthorDetailsCopyWithImpl<$Res>
    implements $AuthorDetailsCopyWith<$Res> {
  _$AuthorDetailsCopyWithImpl(this._self, this._then);

  final AuthorDetails _self;
  final $Res Function(AuthorDetails) _then;

/// Create a copy of AuthorDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? username = freezed,Object? avatarPath = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorDetails].
extension AuthorDetailsPatterns on AuthorDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorDetails value)  $default,){
final _that = this;
switch (_that) {
case _AuthorDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? username,  String? avatarPath,  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorDetails() when $default != null:
return $default(_that.name,_that.username,_that.avatarPath,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? username,  String? avatarPath,  double? rating)  $default,) {final _that = this;
switch (_that) {
case _AuthorDetails():
return $default(_that.name,_that.username,_that.avatarPath,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? username,  String? avatarPath,  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _AuthorDetails() when $default != null:
return $default(_that.name,_that.username,_that.avatarPath,_that.rating);case _:
  return null;

}
}

}

/// @nodoc


class _AuthorDetails implements AuthorDetails {
  const _AuthorDetails({this.name, this.username, this.avatarPath, this.rating});
  

@override final  String? name;
@override final  String? username;
@override final  String? avatarPath;
@override final  double? rating;

/// Create a copy of AuthorDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorDetailsCopyWith<_AuthorDetails> get copyWith => __$AuthorDetailsCopyWithImpl<_AuthorDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,name,username,avatarPath,rating);

@override
String toString() {
  return 'AuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$AuthorDetailsCopyWith<$Res> implements $AuthorDetailsCopyWith<$Res> {
  factory _$AuthorDetailsCopyWith(_AuthorDetails value, $Res Function(_AuthorDetails) _then) = __$AuthorDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? username, String? avatarPath, double? rating
});




}
/// @nodoc
class __$AuthorDetailsCopyWithImpl<$Res>
    implements _$AuthorDetailsCopyWith<$Res> {
  __$AuthorDetailsCopyWithImpl(this._self, this._then);

  final _AuthorDetails _self;
  final $Res Function(_AuthorDetails) _then;

/// Create a copy of AuthorDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? username = freezed,Object? avatarPath = freezed,Object? rating = freezed,}) {
  return _then(_AuthorDetails(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
