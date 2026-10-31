// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SharePayload {

 String get text; String get deepLink; String get fallbackUrl;
/// Create a copy of SharePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharePayloadCopyWith<SharePayload> get copyWith => _$SharePayloadCopyWithImpl<SharePayload>(this as SharePayload, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharePayload&&(identical(other.text, text) || other.text == text)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.fallbackUrl, fallbackUrl) || other.fallbackUrl == fallbackUrl));
}


@override
int get hashCode => Object.hash(runtimeType,text,deepLink,fallbackUrl);

@override
String toString() {
  return 'SharePayload(text: $text, deepLink: $deepLink, fallbackUrl: $fallbackUrl)';
}


}

/// @nodoc
abstract mixin class $SharePayloadCopyWith<$Res>  {
  factory $SharePayloadCopyWith(SharePayload value, $Res Function(SharePayload) _then) = _$SharePayloadCopyWithImpl;
@useResult
$Res call({
 String text, String deepLink, String fallbackUrl
});




}
/// @nodoc
class _$SharePayloadCopyWithImpl<$Res>
    implements $SharePayloadCopyWith<$Res> {
  _$SharePayloadCopyWithImpl(this._self, this._then);

  final SharePayload _self;
  final $Res Function(SharePayload) _then;

/// Create a copy of SharePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? deepLink = null,Object? fallbackUrl = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,deepLink: null == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String,fallbackUrl: null == fallbackUrl ? _self.fallbackUrl : fallbackUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SharePayload].
extension SharePayloadPatterns on SharePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharePayload value)  $default,){
final _that = this;
switch (_that) {
case _SharePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharePayload value)?  $default,){
final _that = this;
switch (_that) {
case _SharePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String deepLink,  String fallbackUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharePayload() when $default != null:
return $default(_that.text,_that.deepLink,_that.fallbackUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String deepLink,  String fallbackUrl)  $default,) {final _that = this;
switch (_that) {
case _SharePayload():
return $default(_that.text,_that.deepLink,_that.fallbackUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String deepLink,  String fallbackUrl)?  $default,) {final _that = this;
switch (_that) {
case _SharePayload() when $default != null:
return $default(_that.text,_that.deepLink,_that.fallbackUrl);case _:
  return null;

}
}

}

/// @nodoc


class _SharePayload implements SharePayload {
  const _SharePayload({required this.text, required this.deepLink, required this.fallbackUrl});
  

@override final  String text;
@override final  String deepLink;
@override final  String fallbackUrl;

/// Create a copy of SharePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharePayloadCopyWith<_SharePayload> get copyWith => __$SharePayloadCopyWithImpl<_SharePayload>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharePayload&&(identical(other.text, text) || other.text == text)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.fallbackUrl, fallbackUrl) || other.fallbackUrl == fallbackUrl));
}


@override
int get hashCode => Object.hash(runtimeType,text,deepLink,fallbackUrl);

@override
String toString() {
  return 'SharePayload(text: $text, deepLink: $deepLink, fallbackUrl: $fallbackUrl)';
}


}

/// @nodoc
abstract mixin class _$SharePayloadCopyWith<$Res> implements $SharePayloadCopyWith<$Res> {
  factory _$SharePayloadCopyWith(_SharePayload value, $Res Function(_SharePayload) _then) = __$SharePayloadCopyWithImpl;
@override @useResult
$Res call({
 String text, String deepLink, String fallbackUrl
});




}
/// @nodoc
class __$SharePayloadCopyWithImpl<$Res>
    implements _$SharePayloadCopyWith<$Res> {
  __$SharePayloadCopyWithImpl(this._self, this._then);

  final _SharePayload _self;
  final $Res Function(_SharePayload) _then;

/// Create a copy of SharePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? deepLink = null,Object? fallbackUrl = null,}) {
  return _then(_SharePayload(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,deepLink: null == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String,fallbackUrl: null == fallbackUrl ? _self.fallbackUrl : fallbackUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
