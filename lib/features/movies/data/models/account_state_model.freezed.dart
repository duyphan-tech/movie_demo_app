// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountStateModel {

 int get id; bool get favorite; double? get rating;
/// Create a copy of AccountStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountStateModelCopyWith<AccountStateModel> get copyWith => _$AccountStateModelCopyWithImpl<AccountStateModel>(this as AccountStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountStateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,id,favorite,rating);

@override
String toString() {
  return 'AccountStateModel(id: $id, favorite: $favorite, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $AccountStateModelCopyWith<$Res>  {
  factory $AccountStateModelCopyWith(AccountStateModel value, $Res Function(AccountStateModel) _then) = _$AccountStateModelCopyWithImpl;
@useResult
$Res call({
 int id, bool favorite, double? rating
});




}
/// @nodoc
class _$AccountStateModelCopyWithImpl<$Res>
    implements $AccountStateModelCopyWith<$Res> {
  _$AccountStateModelCopyWithImpl(this._self, this._then);

  final AccountStateModel _self;
  final $Res Function(AccountStateModel) _then;

/// Create a copy of AccountStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? favorite = null,Object? rating = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountStateModel].
extension AccountStateModelPatterns on AccountStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountStateModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  bool favorite,  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountStateModel() when $default != null:
return $default(_that.id,_that.favorite,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  bool favorite,  double? rating)  $default,) {final _that = this;
switch (_that) {
case _AccountStateModel():
return $default(_that.id,_that.favorite,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  bool favorite,  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _AccountStateModel() when $default != null:
return $default(_that.id,_that.favorite,_that.rating);case _:
  return null;

}
}

}

/// @nodoc


class _AccountStateModel extends AccountStateModel {
  const _AccountStateModel({required this.id, required this.favorite, this.rating}): super._();
  

@override final  int id;
@override final  bool favorite;
@override final  double? rating;

/// Create a copy of AccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountStateModelCopyWith<_AccountStateModel> get copyWith => __$AccountStateModelCopyWithImpl<_AccountStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountStateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.rating, rating) || other.rating == rating));
}


@override
int get hashCode => Object.hash(runtimeType,id,favorite,rating);

@override
String toString() {
  return 'AccountStateModel(id: $id, favorite: $favorite, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$AccountStateModelCopyWith<$Res> implements $AccountStateModelCopyWith<$Res> {
  factory _$AccountStateModelCopyWith(_AccountStateModel value, $Res Function(_AccountStateModel) _then) = __$AccountStateModelCopyWithImpl;
@override @useResult
$Res call({
 int id, bool favorite, double? rating
});




}
/// @nodoc
class __$AccountStateModelCopyWithImpl<$Res>
    implements _$AccountStateModelCopyWith<$Res> {
  __$AccountStateModelCopyWithImpl(this._self, this._then);

  final _AccountStateModel _self;
  final $Res Function(_AccountStateModel) _then;

/// Create a copy of AccountStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? favorite = null,Object? rating = freezed,}) {
  return _then(_AccountStateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
