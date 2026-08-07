// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_revenue_timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetRevenueTimelineParams {

 String get sellerId; RevenuePeriod get period;
/// Create a copy of GetRevenueTimelineParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRevenueTimelineParamsCopyWith<GetRevenueTimelineParams> get copyWith => _$GetRevenueTimelineParamsCopyWithImpl<GetRevenueTimelineParams>(this as GetRevenueTimelineParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRevenueTimelineParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,period);

@override
String toString() {
  return 'GetRevenueTimelineParams(sellerId: $sellerId, period: $period)';
}


}

/// @nodoc
abstract mixin class $GetRevenueTimelineParamsCopyWith<$Res>  {
  factory $GetRevenueTimelineParamsCopyWith(GetRevenueTimelineParams value, $Res Function(GetRevenueTimelineParams) _then) = _$GetRevenueTimelineParamsCopyWithImpl;
@useResult
$Res call({
 String sellerId, RevenuePeriod period
});




}
/// @nodoc
class _$GetRevenueTimelineParamsCopyWithImpl<$Res>
    implements $GetRevenueTimelineParamsCopyWith<$Res> {
  _$GetRevenueTimelineParamsCopyWithImpl(this._self, this._then);

  final GetRevenueTimelineParams _self;
  final $Res Function(GetRevenueTimelineParams) _then;

/// Create a copy of GetRevenueTimelineParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,Object? period = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}

}


/// Adds pattern-matching-related methods to [GetRevenueTimelineParams].
extension GetRevenueTimelineParamsPatterns on GetRevenueTimelineParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetRevenueTimelineParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRevenueTimelineParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetRevenueTimelineParams value)  $default,){
final _that = this;
switch (_that) {
case _GetRevenueTimelineParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetRevenueTimelineParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetRevenueTimelineParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sellerId,  RevenuePeriod period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRevenueTimelineParams() when $default != null:
return $default(_that.sellerId,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sellerId,  RevenuePeriod period)  $default,) {final _that = this;
switch (_that) {
case _GetRevenueTimelineParams():
return $default(_that.sellerId,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sellerId,  RevenuePeriod period)?  $default,) {final _that = this;
switch (_that) {
case _GetRevenueTimelineParams() when $default != null:
return $default(_that.sellerId,_that.period);case _:
  return null;

}
}

}

/// @nodoc


class _GetRevenueTimelineParams implements GetRevenueTimelineParams {
  const _GetRevenueTimelineParams({required this.sellerId, required this.period});
  

@override final  String sellerId;
@override final  RevenuePeriod period;

/// Create a copy of GetRevenueTimelineParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRevenueTimelineParamsCopyWith<_GetRevenueTimelineParams> get copyWith => __$GetRevenueTimelineParamsCopyWithImpl<_GetRevenueTimelineParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRevenueTimelineParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,period);

@override
String toString() {
  return 'GetRevenueTimelineParams(sellerId: $sellerId, period: $period)';
}


}

/// @nodoc
abstract mixin class _$GetRevenueTimelineParamsCopyWith<$Res> implements $GetRevenueTimelineParamsCopyWith<$Res> {
  factory _$GetRevenueTimelineParamsCopyWith(_GetRevenueTimelineParams value, $Res Function(_GetRevenueTimelineParams) _then) = __$GetRevenueTimelineParamsCopyWithImpl;
@override @useResult
$Res call({
 String sellerId, RevenuePeriod period
});




}
/// @nodoc
class __$GetRevenueTimelineParamsCopyWithImpl<$Res>
    implements _$GetRevenueTimelineParamsCopyWith<$Res> {
  __$GetRevenueTimelineParamsCopyWithImpl(this._self, this._then);

  final _GetRevenueTimelineParams _self;
  final $Res Function(_GetRevenueTimelineParams) _then;

/// Create a copy of GetRevenueTimelineParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? period = null,}) {
  return _then(_GetRevenueTimelineParams(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}


}

// dart format on
