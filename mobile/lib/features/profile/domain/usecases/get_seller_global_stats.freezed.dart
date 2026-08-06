// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_seller_global_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetSellerGlobalStatsParams {

 String get sellerId;
/// Create a copy of GetSellerGlobalStatsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSellerGlobalStatsParamsCopyWith<GetSellerGlobalStatsParams> get copyWith => _$GetSellerGlobalStatsParamsCopyWithImpl<GetSellerGlobalStatsParams>(this as GetSellerGlobalStatsParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSellerGlobalStatsParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'GetSellerGlobalStatsParams(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class $GetSellerGlobalStatsParamsCopyWith<$Res>  {
  factory $GetSellerGlobalStatsParamsCopyWith(GetSellerGlobalStatsParams value, $Res Function(GetSellerGlobalStatsParams) _then) = _$GetSellerGlobalStatsParamsCopyWithImpl;
@useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class _$GetSellerGlobalStatsParamsCopyWithImpl<$Res>
    implements $GetSellerGlobalStatsParamsCopyWith<$Res> {
  _$GetSellerGlobalStatsParamsCopyWithImpl(this._self, this._then);

  final GetSellerGlobalStatsParams _self;
  final $Res Function(GetSellerGlobalStatsParams) _then;

/// Create a copy of GetSellerGlobalStatsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSellerGlobalStatsParams].
extension GetSellerGlobalStatsParamsPatterns on GetSellerGlobalStatsParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSellerGlobalStatsParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSellerGlobalStatsParams value)  $default,){
final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSellerGlobalStatsParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sellerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams() when $default != null:
return $default(_that.sellerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sellerId)  $default,) {final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams():
return $default(_that.sellerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sellerId)?  $default,) {final _that = this;
switch (_that) {
case _GetSellerGlobalStatsParams() when $default != null:
return $default(_that.sellerId);case _:
  return null;

}
}

}

/// @nodoc


class _GetSellerGlobalStatsParams implements GetSellerGlobalStatsParams {
  const _GetSellerGlobalStatsParams({required this.sellerId});
  

@override final  String sellerId;

/// Create a copy of GetSellerGlobalStatsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSellerGlobalStatsParamsCopyWith<_GetSellerGlobalStatsParams> get copyWith => __$GetSellerGlobalStatsParamsCopyWithImpl<_GetSellerGlobalStatsParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSellerGlobalStatsParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'GetSellerGlobalStatsParams(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$GetSellerGlobalStatsParamsCopyWith<$Res> implements $GetSellerGlobalStatsParamsCopyWith<$Res> {
  factory _$GetSellerGlobalStatsParamsCopyWith(_GetSellerGlobalStatsParams value, $Res Function(_GetSellerGlobalStatsParams) _then) = __$GetSellerGlobalStatsParamsCopyWithImpl;
@override @useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class __$GetSellerGlobalStatsParamsCopyWithImpl<$Res>
    implements _$GetSellerGlobalStatsParamsCopyWith<$Res> {
  __$GetSellerGlobalStatsParamsCopyWithImpl(this._self, this._then);

  final _GetSellerGlobalStatsParams _self;
  final $Res Function(_GetSellerGlobalStatsParams) _then;

/// Create a copy of GetSellerGlobalStatsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,}) {
  return _then(_GetSellerGlobalStatsParams(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
