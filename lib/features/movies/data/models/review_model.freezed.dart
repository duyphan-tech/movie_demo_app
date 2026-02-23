// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {

 String? get author;@JsonKey(name: 'author_details') AuthorDetailsModel? get authorDetails; String? get content;@JsonKey(name: 'created_at') String? get createdAt; String? get id;@JsonKey(name: 'updated_at') String? get updatedAt; String? get url;
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewModelCopyWith<ReviewModel> get copyWith => _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewModel&&(identical(other.author, author) || other.author == author)&&(identical(other.authorDetails, authorDetails) || other.authorDetails == authorDetails)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,authorDetails,content,createdAt,id,updatedAt,url);

@override
String toString() {
  return 'ReviewModel(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
}


}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res>  {
  factory $ReviewModelCopyWith(ReviewModel value, $Res Function(ReviewModel) _then) = _$ReviewModelCopyWithImpl;
@useResult
$Res call({
 String? author,@JsonKey(name: 'author_details') AuthorDetailsModel? authorDetails, String? content,@JsonKey(name: 'created_at') String? createdAt, String? id,@JsonKey(name: 'updated_at') String? updatedAt, String? url
});


$AuthorDetailsModelCopyWith<$Res>? get authorDetails;

}
/// @nodoc
class _$ReviewModelCopyWithImpl<$Res>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? author = freezed,Object? authorDetails = freezed,Object? content = freezed,Object? createdAt = freezed,Object? id = freezed,Object? updatedAt = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,authorDetails: freezed == authorDetails ? _self.authorDetails : authorDetails // ignore: cast_nullable_to_non_nullable
as AuthorDetailsModel?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorDetailsModelCopyWith<$Res>? get authorDetails {
    if (_self.authorDetails == null) {
    return null;
  }

  return $AuthorDetailsModelCopyWith<$Res>(_self.authorDetails!, (value) {
    return _then(_self.copyWith(authorDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewModel].
extension ReviewModelPatterns on ReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? author, @JsonKey(name: 'author_details')  AuthorDetailsModel? authorDetails,  String? content, @JsonKey(name: 'created_at')  String? createdAt,  String? id, @JsonKey(name: 'updated_at')  String? updatedAt,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.author,_that.authorDetails,_that.content,_that.createdAt,_that.id,_that.updatedAt,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? author, @JsonKey(name: 'author_details')  AuthorDetailsModel? authorDetails,  String? content, @JsonKey(name: 'created_at')  String? createdAt,  String? id, @JsonKey(name: 'updated_at')  String? updatedAt,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ReviewModel():
return $default(_that.author,_that.authorDetails,_that.content,_that.createdAt,_that.id,_that.updatedAt,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? author, @JsonKey(name: 'author_details')  AuthorDetailsModel? authorDetails,  String? content, @JsonKey(name: 'created_at')  String? createdAt,  String? id, @JsonKey(name: 'updated_at')  String? updatedAt,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ReviewModel() when $default != null:
return $default(_that.author,_that.authorDetails,_that.content,_that.createdAt,_that.id,_that.updatedAt,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewModel implements ReviewModel {
  const _ReviewModel({this.author, @JsonKey(name: 'author_details') this.authorDetails, this.content, @JsonKey(name: 'created_at') this.createdAt, this.id, @JsonKey(name: 'updated_at') this.updatedAt, this.url});
  factory _ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

@override final  String? author;
@override@JsonKey(name: 'author_details') final  AuthorDetailsModel? authorDetails;
@override final  String? content;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  String? id;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  String? url;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewModelCopyWith<_ReviewModel> get copyWith => __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewModel&&(identical(other.author, author) || other.author == author)&&(identical(other.authorDetails, authorDetails) || other.authorDetails == authorDetails)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,author,authorDetails,content,createdAt,id,updatedAt,url);

@override
String toString() {
  return 'ReviewModel(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res> implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(_ReviewModel value, $Res Function(_ReviewModel) _then) = __$ReviewModelCopyWithImpl;
@override @useResult
$Res call({
 String? author,@JsonKey(name: 'author_details') AuthorDetailsModel? authorDetails, String? content,@JsonKey(name: 'created_at') String? createdAt, String? id,@JsonKey(name: 'updated_at') String? updatedAt, String? url
});


@override $AuthorDetailsModelCopyWith<$Res>? get authorDetails;

}
/// @nodoc
class __$ReviewModelCopyWithImpl<$Res>
    implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? author = freezed,Object? authorDetails = freezed,Object? content = freezed,Object? createdAt = freezed,Object? id = freezed,Object? updatedAt = freezed,Object? url = freezed,}) {
  return _then(_ReviewModel(
author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,authorDetails: freezed == authorDetails ? _self.authorDetails : authorDetails // ignore: cast_nullable_to_non_nullable
as AuthorDetailsModel?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorDetailsModelCopyWith<$Res>? get authorDetails {
    if (_self.authorDetails == null) {
    return null;
  }

  return $AuthorDetailsModelCopyWith<$Res>(_self.authorDetails!, (value) {
    return _then(_self.copyWith(authorDetails: value));
  });
}
}

// dart format on
