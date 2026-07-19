// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadMediaParams {

 String get annonceId; String get filePath;
/// Create a copy of UploadMediaParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadMediaParamsCopyWith<UploadMediaParams> get copyWith => _$UploadMediaParamsCopyWithImpl<UploadMediaParams>(this as UploadMediaParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadMediaParams&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,annonceId,filePath);

@override
String toString() {
  return 'UploadMediaParams(annonceId: $annonceId, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $UploadMediaParamsCopyWith<$Res>  {
  factory $UploadMediaParamsCopyWith(UploadMediaParams value, $Res Function(UploadMediaParams) _then) = _$UploadMediaParamsCopyWithImpl;
@useResult
$Res call({
 String annonceId, String filePath
});




}
/// @nodoc
class _$UploadMediaParamsCopyWithImpl<$Res>
    implements $UploadMediaParamsCopyWith<$Res> {
  _$UploadMediaParamsCopyWithImpl(this._self, this._then);

  final UploadMediaParams _self;
  final $Res Function(UploadMediaParams) _then;

/// Create a copy of UploadMediaParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annonceId = null,Object? filePath = null,}) {
  return _then(_self.copyWith(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadMediaParams].
extension UploadMediaParamsPatterns on UploadMediaParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadMediaParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadMediaParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadMediaParams value)  $default,){
final _that = this;
switch (_that) {
case _UploadMediaParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadMediaParams value)?  $default,){
final _that = this;
switch (_that) {
case _UploadMediaParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String annonceId,  String filePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadMediaParams() when $default != null:
return $default(_that.annonceId,_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String annonceId,  String filePath)  $default,) {final _that = this;
switch (_that) {
case _UploadMediaParams():
return $default(_that.annonceId,_that.filePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String annonceId,  String filePath)?  $default,) {final _that = this;
switch (_that) {
case _UploadMediaParams() when $default != null:
return $default(_that.annonceId,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc


class _UploadMediaParams implements UploadMediaParams {
  const _UploadMediaParams({required this.annonceId, required this.filePath});
  

@override final  String annonceId;
@override final  String filePath;

/// Create a copy of UploadMediaParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadMediaParamsCopyWith<_UploadMediaParams> get copyWith => __$UploadMediaParamsCopyWithImpl<_UploadMediaParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadMediaParams&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}


@override
int get hashCode => Object.hash(runtimeType,annonceId,filePath);

@override
String toString() {
  return 'UploadMediaParams(annonceId: $annonceId, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$UploadMediaParamsCopyWith<$Res> implements $UploadMediaParamsCopyWith<$Res> {
  factory _$UploadMediaParamsCopyWith(_UploadMediaParams value, $Res Function(_UploadMediaParams) _then) = __$UploadMediaParamsCopyWithImpl;
@override @useResult
$Res call({
 String annonceId, String filePath
});




}
/// @nodoc
class __$UploadMediaParamsCopyWithImpl<$Res>
    implements _$UploadMediaParamsCopyWith<$Res> {
  __$UploadMediaParamsCopyWithImpl(this._self, this._then);

  final _UploadMediaParams _self;
  final $Res Function(_UploadMediaParams) _then;

/// Create a copy of UploadMediaParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annonceId = null,Object? filePath = null,}) {
  return _then(_UploadMediaParams(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
