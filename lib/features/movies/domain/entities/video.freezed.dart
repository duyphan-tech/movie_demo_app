// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Video {

 String get id; String get name; String get key; String get site; String get type; bool get official; String get publishedAt; String get iso6391; String get iso31661; int get size;
/// Create a copy of Video
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoCopyWith<Video> get copyWith => _$VideoCopyWithImpl<Video>(this as Video, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Video&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.site, site) || other.site == site)&&(identical(other.type, type) || other.type == type)&&(identical(other.official, official) || other.official == official)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,key,site,type,official,publishedAt,iso6391,iso31661,size);

@override
String toString() {
  return 'Video(id: $id, name: $name, key: $key, site: $site, type: $type, official: $official, publishedAt: $publishedAt, iso6391: $iso6391, iso31661: $iso31661, size: $size)';
}


}

/// @nodoc
abstract mixin class $VideoCopyWith<$Res>  {
  factory $VideoCopyWith(Video value, $Res Function(Video) _then) = _$VideoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String key, String site, String type, bool official, String publishedAt, String iso6391, String iso31661, int size
});




}
/// @nodoc
class _$VideoCopyWithImpl<$Res>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._self, this._then);

  final Video _self;
  final $Res Function(Video) _then;

/// Create a copy of Video
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? key = null,Object? site = null,Object? type = null,Object? official = null,Object? publishedAt = null,Object? iso6391 = null,Object? iso31661 = null,Object? size = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Video].
extension VideoPatterns on Video {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Video value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Video() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Video value)  $default,){
final _that = this;
switch (_that) {
case _Video():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Video value)?  $default,){
final _that = this;
switch (_that) {
case _Video() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String key,  String site,  String type,  bool official,  String publishedAt,  String iso6391,  String iso31661,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Video() when $default != null:
return $default(_that.id,_that.name,_that.key,_that.site,_that.type,_that.official,_that.publishedAt,_that.iso6391,_that.iso31661,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String key,  String site,  String type,  bool official,  String publishedAt,  String iso6391,  String iso31661,  int size)  $default,) {final _that = this;
switch (_that) {
case _Video():
return $default(_that.id,_that.name,_that.key,_that.site,_that.type,_that.official,_that.publishedAt,_that.iso6391,_that.iso31661,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String key,  String site,  String type,  bool official,  String publishedAt,  String iso6391,  String iso31661,  int size)?  $default,) {final _that = this;
switch (_that) {
case _Video() when $default != null:
return $default(_that.id,_that.name,_that.key,_that.site,_that.type,_that.official,_that.publishedAt,_that.iso6391,_that.iso31661,_that.size);case _:
  return null;

}
}

}

/// @nodoc


class _Video implements Video {
  const _Video({required this.id, required this.name, required this.key, required this.site, required this.type, required this.official, required this.publishedAt, required this.iso6391, required this.iso31661, required this.size});
  

@override final  String id;
@override final  String name;
@override final  String key;
@override final  String site;
@override final  String type;
@override final  bool official;
@override final  String publishedAt;
@override final  String iso6391;
@override final  String iso31661;
@override final  int size;

/// Create a copy of Video
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoCopyWith<_Video> get copyWith => __$VideoCopyWithImpl<_Video>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Video&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.site, site) || other.site == site)&&(identical(other.type, type) || other.type == type)&&(identical(other.official, official) || other.official == official)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.iso6391, iso6391) || other.iso6391 == iso6391)&&(identical(other.iso31661, iso31661) || other.iso31661 == iso31661)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,key,site,type,official,publishedAt,iso6391,iso31661,size);

@override
String toString() {
  return 'Video(id: $id, name: $name, key: $key, site: $site, type: $type, official: $official, publishedAt: $publishedAt, iso6391: $iso6391, iso31661: $iso31661, size: $size)';
}


}

/// @nodoc
abstract mixin class _$VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) _then) = __$VideoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String key, String site, String type, bool official, String publishedAt, String iso6391, String iso31661, int size
});




}
/// @nodoc
class __$VideoCopyWithImpl<$Res>
    implements _$VideoCopyWith<$Res> {
  __$VideoCopyWithImpl(this._self, this._then);

  final _Video _self;
  final $Res Function(_Video) _then;

/// Create a copy of Video
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? key = null,Object? site = null,Object? type = null,Object? official = null,Object? publishedAt = null,Object? iso6391 = null,Object? iso31661 = null,Object? size = null,}) {
  return _then(_Video(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,iso6391: null == iso6391 ? _self.iso6391 : iso6391 // ignore: cast_nullable_to_non_nullable
as String,iso31661: null == iso31661 ? _self.iso31661 : iso31661 // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$VideoResponse {

 int get id; List<Video> get results;
/// Create a copy of VideoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoResponseCopyWith<VideoResponse> get copyWith => _$VideoResponseCopyWithImpl<VideoResponse>(this as VideoResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.results, results));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'VideoResponse(id: $id, results: $results)';
}


}

/// @nodoc
abstract mixin class $VideoResponseCopyWith<$Res>  {
  factory $VideoResponseCopyWith(VideoResponse value, $Res Function(VideoResponse) _then) = _$VideoResponseCopyWithImpl;
@useResult
$Res call({
 int id, List<Video> results
});




}
/// @nodoc
class _$VideoResponseCopyWithImpl<$Res>
    implements $VideoResponseCopyWith<$Res> {
  _$VideoResponseCopyWithImpl(this._self, this._then);

  final VideoResponse _self;
  final $Res Function(VideoResponse) _then;

/// Create a copy of VideoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? results = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Video>,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoResponse].
extension VideoResponsePatterns on VideoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoResponse value)  $default,){
final _that = this;
switch (_that) {
case _VideoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VideoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<Video> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoResponse() when $default != null:
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<Video> results)  $default,) {final _that = this;
switch (_that) {
case _VideoResponse():
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<Video> results)?  $default,) {final _that = this;
switch (_that) {
case _VideoResponse() when $default != null:
return $default(_that.id,_that.results);case _:
  return null;

}
}

}

/// @nodoc


class _VideoResponse implements VideoResponse {
  const _VideoResponse({required this.id, required final  List<Video> results}): _results = results;
  

@override final  int id;
 final  List<Video> _results;
@override List<Video> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of VideoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoResponseCopyWith<_VideoResponse> get copyWith => __$VideoResponseCopyWithImpl<_VideoResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'VideoResponse(id: $id, results: $results)';
}


}

/// @nodoc
abstract mixin class _$VideoResponseCopyWith<$Res> implements $VideoResponseCopyWith<$Res> {
  factory _$VideoResponseCopyWith(_VideoResponse value, $Res Function(_VideoResponse) _then) = __$VideoResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, List<Video> results
});




}
/// @nodoc
class __$VideoResponseCopyWithImpl<$Res>
    implements _$VideoResponseCopyWith<$Res> {
  __$VideoResponseCopyWithImpl(this._self, this._then);

  final _VideoResponse _self;
  final $Res Function(_VideoResponse) _then;

/// Create a copy of VideoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? results = null,}) {
  return _then(_VideoResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Video>,
  ));
}


}

/// @nodoc
mixin _$VideoList {

 Video? get mainVideo; List<Video> get displayVideos; List<Video> get allVideos; bool get hasMoreVideos;
/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoListCopyWith<VideoList> get copyWith => _$VideoListCopyWithImpl<VideoList>(this as VideoList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoList&&(identical(other.mainVideo, mainVideo) || other.mainVideo == mainVideo)&&const DeepCollectionEquality().equals(other.displayVideos, displayVideos)&&const DeepCollectionEquality().equals(other.allVideos, allVideos)&&(identical(other.hasMoreVideos, hasMoreVideos) || other.hasMoreVideos == hasMoreVideos));
}


@override
int get hashCode => Object.hash(runtimeType,mainVideo,const DeepCollectionEquality().hash(displayVideos),const DeepCollectionEquality().hash(allVideos),hasMoreVideos);

@override
String toString() {
  return 'VideoList(mainVideo: $mainVideo, displayVideos: $displayVideos, allVideos: $allVideos, hasMoreVideos: $hasMoreVideos)';
}


}

/// @nodoc
abstract mixin class $VideoListCopyWith<$Res>  {
  factory $VideoListCopyWith(VideoList value, $Res Function(VideoList) _then) = _$VideoListCopyWithImpl;
@useResult
$Res call({
 Video? mainVideo, List<Video> displayVideos, List<Video> allVideos, bool hasMoreVideos
});


$VideoCopyWith<$Res>? get mainVideo;

}
/// @nodoc
class _$VideoListCopyWithImpl<$Res>
    implements $VideoListCopyWith<$Res> {
  _$VideoListCopyWithImpl(this._self, this._then);

  final VideoList _self;
  final $Res Function(VideoList) _then;

/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainVideo = freezed,Object? displayVideos = null,Object? allVideos = null,Object? hasMoreVideos = null,}) {
  return _then(_self.copyWith(
mainVideo: freezed == mainVideo ? _self.mainVideo : mainVideo // ignore: cast_nullable_to_non_nullable
as Video?,displayVideos: null == displayVideos ? _self.displayVideos : displayVideos // ignore: cast_nullable_to_non_nullable
as List<Video>,allVideos: null == allVideos ? _self.allVideos : allVideos // ignore: cast_nullable_to_non_nullable
as List<Video>,hasMoreVideos: null == hasMoreVideos ? _self.hasMoreVideos : hasMoreVideos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoCopyWith<$Res>? get mainVideo {
    if (_self.mainVideo == null) {
    return null;
  }

  return $VideoCopyWith<$Res>(_self.mainVideo!, (value) {
    return _then(_self.copyWith(mainVideo: value));
  });
}
}


/// Adds pattern-matching-related methods to [VideoList].
extension VideoListPatterns on VideoList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoList value)  $default,){
final _that = this;
switch (_that) {
case _VideoList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoList value)?  $default,){
final _that = this;
switch (_that) {
case _VideoList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Video? mainVideo,  List<Video> displayVideos,  List<Video> allVideos,  bool hasMoreVideos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoList() when $default != null:
return $default(_that.mainVideo,_that.displayVideos,_that.allVideos,_that.hasMoreVideos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Video? mainVideo,  List<Video> displayVideos,  List<Video> allVideos,  bool hasMoreVideos)  $default,) {final _that = this;
switch (_that) {
case _VideoList():
return $default(_that.mainVideo,_that.displayVideos,_that.allVideos,_that.hasMoreVideos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Video? mainVideo,  List<Video> displayVideos,  List<Video> allVideos,  bool hasMoreVideos)?  $default,) {final _that = this;
switch (_that) {
case _VideoList() when $default != null:
return $default(_that.mainVideo,_that.displayVideos,_that.allVideos,_that.hasMoreVideos);case _:
  return null;

}
}

}

/// @nodoc


class _VideoList implements VideoList {
  const _VideoList({this.mainVideo, final  List<Video> displayVideos = const [], final  List<Video> allVideos = const [], this.hasMoreVideos = false}): _displayVideos = displayVideos,_allVideos = allVideos;
  

@override final  Video? mainVideo;
 final  List<Video> _displayVideos;
@override@JsonKey() List<Video> get displayVideos {
  if (_displayVideos is EqualUnmodifiableListView) return _displayVideos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_displayVideos);
}

 final  List<Video> _allVideos;
@override@JsonKey() List<Video> get allVideos {
  if (_allVideos is EqualUnmodifiableListView) return _allVideos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allVideos);
}

@override@JsonKey() final  bool hasMoreVideos;

/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoListCopyWith<_VideoList> get copyWith => __$VideoListCopyWithImpl<_VideoList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoList&&(identical(other.mainVideo, mainVideo) || other.mainVideo == mainVideo)&&const DeepCollectionEquality().equals(other._displayVideos, _displayVideos)&&const DeepCollectionEquality().equals(other._allVideos, _allVideos)&&(identical(other.hasMoreVideos, hasMoreVideos) || other.hasMoreVideos == hasMoreVideos));
}


@override
int get hashCode => Object.hash(runtimeType,mainVideo,const DeepCollectionEquality().hash(_displayVideos),const DeepCollectionEquality().hash(_allVideos),hasMoreVideos);

@override
String toString() {
  return 'VideoList(mainVideo: $mainVideo, displayVideos: $displayVideos, allVideos: $allVideos, hasMoreVideos: $hasMoreVideos)';
}


}

/// @nodoc
abstract mixin class _$VideoListCopyWith<$Res> implements $VideoListCopyWith<$Res> {
  factory _$VideoListCopyWith(_VideoList value, $Res Function(_VideoList) _then) = __$VideoListCopyWithImpl;
@override @useResult
$Res call({
 Video? mainVideo, List<Video> displayVideos, List<Video> allVideos, bool hasMoreVideos
});


@override $VideoCopyWith<$Res>? get mainVideo;

}
/// @nodoc
class __$VideoListCopyWithImpl<$Res>
    implements _$VideoListCopyWith<$Res> {
  __$VideoListCopyWithImpl(this._self, this._then);

  final _VideoList _self;
  final $Res Function(_VideoList) _then;

/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainVideo = freezed,Object? displayVideos = null,Object? allVideos = null,Object? hasMoreVideos = null,}) {
  return _then(_VideoList(
mainVideo: freezed == mainVideo ? _self.mainVideo : mainVideo // ignore: cast_nullable_to_non_nullable
as Video?,displayVideos: null == displayVideos ? _self._displayVideos : displayVideos // ignore: cast_nullable_to_non_nullable
as List<Video>,allVideos: null == allVideos ? _self._allVideos : allVideos // ignore: cast_nullable_to_non_nullable
as List<Video>,hasMoreVideos: null == hasMoreVideos ? _self.hasMoreVideos : hasMoreVideos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VideoList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoCopyWith<$Res>? get mainVideo {
    if (_self.mainVideo == null) {
    return null;
  }

  return $VideoCopyWith<$Res>(_self.mainVideo!, (value) {
    return _then(_self.copyWith(mainVideo: value));
  });
}
}

// dart format on
