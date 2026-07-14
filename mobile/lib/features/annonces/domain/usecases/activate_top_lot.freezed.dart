// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_top_lot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivateTopLotParams {

 String get id; int get durationDays;
/// Create a copy of ActivateTopLotParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivateTopLotParamsCopyWith<ActivateTopLotParams> get copyWith => _$ActivateTopLotParamsCopyWithImpl<ActivateTopLotParams>(this as ActivateTopLotParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivateTopLotParams&&(identical(other.id, id) || other.id == id)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays));
}


@override
int get hashCode => Object.hash(runtimeType,id,durationDays);

@override
String toString() {
  return 'ActivateTopLotParams(id: $id, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class $ActivateTopLotParamsCopyWith<$Res>  {
  factory $ActivateTopLotParamsCopyWith(ActivateTopLotParams value, $Res Function(ActivateTopLotParams) _then) = _$ActivateTopLotParamsCopyWithImpl;
@useResult
$Res call({
 String id, int durationDays
});




}
/// @nodoc
class _$ActivateTopLotParamsCopyWithImpl<$Res>
    implements $ActivateTopLotParamsCopyWith<$Res> {
  _$ActivateTopLotParamsCopyWithImpl(this._self, this._then);

  final ActivateTopLotParams _self;
  final $Res Function(ActivateTopLotParams) _then;

/// Create a copy of ActivateTopLotParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? durationDays = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivateTopLotParams].
extension ActivateTopLotParamsPatterns on ActivateTopLotParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivateTopLotParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivateTopLotParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivateTopLotParams value)  $default,){
final _that = this;
switch (_that) {
case _ActivateTopLotParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivateTopLotParams value)?  $default,){
final _that = this;
switch (_that) {
case _ActivateTopLotParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int durationDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivateTopLotParams() when $default != null:
return $default(_that.id,_that.durationDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int durationDays)  $default,) {final _that = this;
switch (_that) {
case _ActivateTopLotParams():
return $default(_that.id,_that.durationDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int durationDays)?  $default,) {final _that = this;
switch (_that) {
case _ActivateTopLotParams() when $default != null:
return $default(_that.id,_that.durationDays);case _:
  return null;

}
}

}

/// @nodoc


class _ActivateTopLotParams implements ActivateTopLotParams {
  const _ActivateTopLotParams({required this.id, required this.durationDays});
  

@override final  String id;
@override final  int durationDays;

/// Create a copy of ActivateTopLotParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivateTopLotParamsCopyWith<_ActivateTopLotParams> get copyWith => __$ActivateTopLotParamsCopyWithImpl<_ActivateTopLotParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivateTopLotParams&&(identical(other.id, id) || other.id == id)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays));
}


@override
int get hashCode => Object.hash(runtimeType,id,durationDays);

@override
String toString() {
  return 'ActivateTopLotParams(id: $id, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class _$ActivateTopLotParamsCopyWith<$Res> implements $ActivateTopLotParamsCopyWith<$Res> {
  factory _$ActivateTopLotParamsCopyWith(_ActivateTopLotParams value, $Res Function(_ActivateTopLotParams) _then) = __$ActivateTopLotParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, int durationDays
});




}
/// @nodoc
class __$ActivateTopLotParamsCopyWithImpl<$Res>
    implements _$ActivateTopLotParamsCopyWith<$Res> {
  __$ActivateTopLotParamsCopyWithImpl(this._self, this._then);

  final _ActivateTopLotParams _self;
  final $Res Function(_ActivateTopLotParams) _then;

/// Create a copy of ActivateTopLotParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? durationDays = null,}) {
  return _then(_ActivateTopLotParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
