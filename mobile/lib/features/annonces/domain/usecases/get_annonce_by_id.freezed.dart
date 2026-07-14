// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_annonce_by_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAnnonceByIdParams {

 String get id;
/// Create a copy of GetAnnonceByIdParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAnnonceByIdParamsCopyWith<GetAnnonceByIdParams> get copyWith => _$GetAnnonceByIdParamsCopyWithImpl<GetAnnonceByIdParams>(this as GetAnnonceByIdParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAnnonceByIdParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'GetAnnonceByIdParams(id: $id)';
}


}

/// @nodoc
abstract mixin class $GetAnnonceByIdParamsCopyWith<$Res>  {
  factory $GetAnnonceByIdParamsCopyWith(GetAnnonceByIdParams value, $Res Function(GetAnnonceByIdParams) _then) = _$GetAnnonceByIdParamsCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$GetAnnonceByIdParamsCopyWithImpl<$Res>
    implements $GetAnnonceByIdParamsCopyWith<$Res> {
  _$GetAnnonceByIdParamsCopyWithImpl(this._self, this._then);

  final GetAnnonceByIdParams _self;
  final $Res Function(GetAnnonceByIdParams) _then;

/// Create a copy of GetAnnonceByIdParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAnnonceByIdParams].
extension GetAnnonceByIdParamsPatterns on GetAnnonceByIdParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAnnonceByIdParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAnnonceByIdParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAnnonceByIdParams value)  $default,){
final _that = this;
switch (_that) {
case _GetAnnonceByIdParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAnnonceByIdParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetAnnonceByIdParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAnnonceByIdParams() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _GetAnnonceByIdParams():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _GetAnnonceByIdParams() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _GetAnnonceByIdParams implements GetAnnonceByIdParams {
  const _GetAnnonceByIdParams({required this.id});
  

@override final  String id;

/// Create a copy of GetAnnonceByIdParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAnnonceByIdParamsCopyWith<_GetAnnonceByIdParams> get copyWith => __$GetAnnonceByIdParamsCopyWithImpl<_GetAnnonceByIdParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAnnonceByIdParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'GetAnnonceByIdParams(id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetAnnonceByIdParamsCopyWith<$Res> implements $GetAnnonceByIdParamsCopyWith<$Res> {
  factory _$GetAnnonceByIdParamsCopyWith(_GetAnnonceByIdParams value, $Res Function(_GetAnnonceByIdParams) _then) = __$GetAnnonceByIdParamsCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$GetAnnonceByIdParamsCopyWithImpl<$Res>
    implements _$GetAnnonceByIdParamsCopyWith<$Res> {
  __$GetAnnonceByIdParamsCopyWithImpl(this._self, this._then);

  final _GetAnnonceByIdParams _self;
  final $Res Function(_GetAnnonceByIdParams) _then;

/// Create a copy of GetAnnonceByIdParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_GetAnnonceByIdParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
