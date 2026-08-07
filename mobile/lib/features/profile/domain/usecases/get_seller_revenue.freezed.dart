// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_seller_revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetSellerRevenueParams {

 String get sellerId; RevenuePeriod get period;
/// Create a copy of GetSellerRevenueParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSellerRevenueParamsCopyWith<GetSellerRevenueParams> get copyWith => _$GetSellerRevenueParamsCopyWithImpl<GetSellerRevenueParams>(this as GetSellerRevenueParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSellerRevenueParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,period);

@override
String toString() {
  return 'GetSellerRevenueParams(sellerId: $sellerId, period: $period)';
}


}

/// @nodoc
abstract mixin class $GetSellerRevenueParamsCopyWith<$Res>  {
  factory $GetSellerRevenueParamsCopyWith(GetSellerRevenueParams value, $Res Function(GetSellerRevenueParams) _then) = _$GetSellerRevenueParamsCopyWithImpl;
@useResult
$Res call({
 String sellerId, RevenuePeriod period
});




}
/// @nodoc
class _$GetSellerRevenueParamsCopyWithImpl<$Res>
    implements $GetSellerRevenueParamsCopyWith<$Res> {
  _$GetSellerRevenueParamsCopyWithImpl(this._self, this._then);

  final GetSellerRevenueParams _self;
  final $Res Function(GetSellerRevenueParams) _then;

/// Create a copy of GetSellerRevenueParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,Object? period = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}

}


/// Adds pattern-matching-related methods to [GetSellerRevenueParams].
extension GetSellerRevenueParamsPatterns on GetSellerRevenueParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetSellerRevenueParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetSellerRevenueParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetSellerRevenueParams value)  $default,){
final _that = this;
switch (_that) {
case _GetSellerRevenueParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetSellerRevenueParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetSellerRevenueParams() when $default != null:
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
case _GetSellerRevenueParams() when $default != null:
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
case _GetSellerRevenueParams():
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
case _GetSellerRevenueParams() when $default != null:
return $default(_that.sellerId,_that.period);case _:
  return null;

}
}

}

/// @nodoc


class _GetSellerRevenueParams implements GetSellerRevenueParams {
  const _GetSellerRevenueParams({required this.sellerId, required this.period});
  

@override final  String sellerId;
@override final  RevenuePeriod period;

/// Create a copy of GetSellerRevenueParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSellerRevenueParamsCopyWith<_GetSellerRevenueParams> get copyWith => __$GetSellerRevenueParamsCopyWithImpl<_GetSellerRevenueParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSellerRevenueParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,period);

@override
String toString() {
  return 'GetSellerRevenueParams(sellerId: $sellerId, period: $period)';
}


}

/// @nodoc
abstract mixin class _$GetSellerRevenueParamsCopyWith<$Res> implements $GetSellerRevenueParamsCopyWith<$Res> {
  factory _$GetSellerRevenueParamsCopyWith(_GetSellerRevenueParams value, $Res Function(_GetSellerRevenueParams) _then) = __$GetSellerRevenueParamsCopyWithImpl;
@override @useResult
$Res call({
 String sellerId, RevenuePeriod period
});




}
/// @nodoc
class __$GetSellerRevenueParamsCopyWithImpl<$Res>
    implements _$GetSellerRevenueParamsCopyWith<$Res> {
  __$GetSellerRevenueParamsCopyWithImpl(this._self, this._then);

  final _GetSellerRevenueParams _self;
  final $Res Function(_GetSellerRevenueParams) _then;

/// Create a copy of GetSellerRevenueParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? period = null,}) {
  return _then(_GetSellerRevenueParams(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}


}

// dart format on
