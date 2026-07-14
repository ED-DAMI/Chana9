// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnonceMedia {

 String get id; String get url; String get mediaType; int get position;
/// Create a copy of AnnonceMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceMediaCopyWith<AnnonceMedia> get copyWith => _$AnnonceMediaCopyWithImpl<AnnonceMedia>(this as AnnonceMedia, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,id,url,mediaType,position);

@override
String toString() {
  return 'AnnonceMedia(id: $id, url: $url, mediaType: $mediaType, position: $position)';
}


}

/// @nodoc
abstract mixin class $AnnonceMediaCopyWith<$Res>  {
  factory $AnnonceMediaCopyWith(AnnonceMedia value, $Res Function(AnnonceMedia) _then) = _$AnnonceMediaCopyWithImpl;
@useResult
$Res call({
 String id, String url, String mediaType, int position
});




}
/// @nodoc
class _$AnnonceMediaCopyWithImpl<$Res>
    implements $AnnonceMediaCopyWith<$Res> {
  _$AnnonceMediaCopyWithImpl(this._self, this._then);

  final AnnonceMedia _self;
  final $Res Function(AnnonceMedia) _then;

/// Create a copy of AnnonceMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? mediaType = null,Object? position = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceMedia].
extension AnnonceMediaPatterns on AnnonceMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceMedia value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceMedia value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String mediaType,  int position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceMedia() when $default != null:
return $default(_that.id,_that.url,_that.mediaType,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String mediaType,  int position)  $default,) {final _that = this;
switch (_that) {
case _AnnonceMedia():
return $default(_that.id,_that.url,_that.mediaType,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String mediaType,  int position)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceMedia() when $default != null:
return $default(_that.id,_that.url,_that.mediaType,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _AnnonceMedia implements AnnonceMedia {
  const _AnnonceMedia({required this.id, required this.url, required this.mediaType, required this.position});
  

@override final  String id;
@override final  String url;
@override final  String mediaType;
@override final  int position;

/// Create a copy of AnnonceMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceMediaCopyWith<_AnnonceMedia> get copyWith => __$AnnonceMediaCopyWithImpl<_AnnonceMedia>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,id,url,mediaType,position);

@override
String toString() {
  return 'AnnonceMedia(id: $id, url: $url, mediaType: $mediaType, position: $position)';
}


}

/// @nodoc
abstract mixin class _$AnnonceMediaCopyWith<$Res> implements $AnnonceMediaCopyWith<$Res> {
  factory _$AnnonceMediaCopyWith(_AnnonceMedia value, $Res Function(_AnnonceMedia) _then) = __$AnnonceMediaCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String mediaType, int position
});




}
/// @nodoc
class __$AnnonceMediaCopyWithImpl<$Res>
    implements _$AnnonceMediaCopyWith<$Res> {
  __$AnnonceMediaCopyWithImpl(this._self, this._then);

  final _AnnonceMedia _self;
  final $Res Function(_AnnonceMedia) _then;

/// Create a copy of AnnonceMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? mediaType = null,Object? position = null,}) {
  return _then(_AnnonceMedia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
