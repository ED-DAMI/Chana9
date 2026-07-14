// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suspend_annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SuspendAnnonceParams {

 String get id;
/// Create a copy of SuspendAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuspendAnnonceParamsCopyWith<SuspendAnnonceParams> get copyWith => _$SuspendAnnonceParamsCopyWithImpl<SuspendAnnonceParams>(this as SuspendAnnonceParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuspendAnnonceParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SuspendAnnonceParams(id: $id)';
}


}

/// @nodoc
abstract mixin class $SuspendAnnonceParamsCopyWith<$Res>  {
  factory $SuspendAnnonceParamsCopyWith(SuspendAnnonceParams value, $Res Function(SuspendAnnonceParams) _then) = _$SuspendAnnonceParamsCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$SuspendAnnonceParamsCopyWithImpl<$Res>
    implements $SuspendAnnonceParamsCopyWith<$Res> {
  _$SuspendAnnonceParamsCopyWithImpl(this._self, this._then);

  final SuspendAnnonceParams _self;
  final $Res Function(SuspendAnnonceParams) _then;

/// Create a copy of SuspendAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuspendAnnonceParams].
extension SuspendAnnonceParamsPatterns on SuspendAnnonceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuspendAnnonceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuspendAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuspendAnnonceParams value)  $default,){
final _that = this;
switch (_that) {
case _SuspendAnnonceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuspendAnnonceParams value)?  $default,){
final _that = this;
switch (_that) {
case _SuspendAnnonceParams() when $default != null:
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
case _SuspendAnnonceParams() when $default != null:
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
case _SuspendAnnonceParams():
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
case _SuspendAnnonceParams() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _SuspendAnnonceParams implements SuspendAnnonceParams {
  const _SuspendAnnonceParams({required this.id});
  

@override final  String id;

/// Create a copy of SuspendAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuspendAnnonceParamsCopyWith<_SuspendAnnonceParams> get copyWith => __$SuspendAnnonceParamsCopyWithImpl<_SuspendAnnonceParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuspendAnnonceParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SuspendAnnonceParams(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SuspendAnnonceParamsCopyWith<$Res> implements $SuspendAnnonceParamsCopyWith<$Res> {
  factory _$SuspendAnnonceParamsCopyWith(_SuspendAnnonceParams value, $Res Function(_SuspendAnnonceParams) _then) = __$SuspendAnnonceParamsCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$SuspendAnnonceParamsCopyWithImpl<$Res>
    implements _$SuspendAnnonceParamsCopyWith<$Res> {
  __$SuspendAnnonceParamsCopyWithImpl(this._self, this._then);

  final _SuspendAnnonceParams _self;
  final $Res Function(_SuspendAnnonceParams) _then;

/// Create a copy of SuspendAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SuspendAnnonceParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
