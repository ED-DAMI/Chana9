// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_annonce_stats_by_seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAnnonceStatsBySellerParams {

 String get sellerId;
/// Create a copy of GetAnnonceStatsBySellerParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAnnonceStatsBySellerParamsCopyWith<GetAnnonceStatsBySellerParams> get copyWith => _$GetAnnonceStatsBySellerParamsCopyWithImpl<GetAnnonceStatsBySellerParams>(this as GetAnnonceStatsBySellerParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAnnonceStatsBySellerParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'GetAnnonceStatsBySellerParams(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class $GetAnnonceStatsBySellerParamsCopyWith<$Res>  {
  factory $GetAnnonceStatsBySellerParamsCopyWith(GetAnnonceStatsBySellerParams value, $Res Function(GetAnnonceStatsBySellerParams) _then) = _$GetAnnonceStatsBySellerParamsCopyWithImpl;
@useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class _$GetAnnonceStatsBySellerParamsCopyWithImpl<$Res>
    implements $GetAnnonceStatsBySellerParamsCopyWith<$Res> {
  _$GetAnnonceStatsBySellerParamsCopyWithImpl(this._self, this._then);

  final GetAnnonceStatsBySellerParams _self;
  final $Res Function(GetAnnonceStatsBySellerParams) _then;

/// Create a copy of GetAnnonceStatsBySellerParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAnnonceStatsBySellerParams].
extension GetAnnonceStatsBySellerParamsPatterns on GetAnnonceStatsBySellerParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAnnonceStatsBySellerParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAnnonceStatsBySellerParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAnnonceStatsBySellerParams value)  $default,){
final _that = this;
switch (_that) {
case _GetAnnonceStatsBySellerParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAnnonceStatsBySellerParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetAnnonceStatsBySellerParams() when $default != null:
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
case _GetAnnonceStatsBySellerParams() when $default != null:
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
case _GetAnnonceStatsBySellerParams():
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
case _GetAnnonceStatsBySellerParams() when $default != null:
return $default(_that.sellerId);case _:
  return null;

}
}

}

/// @nodoc


class _GetAnnonceStatsBySellerParams implements GetAnnonceStatsBySellerParams {
  const _GetAnnonceStatsBySellerParams({required this.sellerId});
  

@override final  String sellerId;

/// Create a copy of GetAnnonceStatsBySellerParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAnnonceStatsBySellerParamsCopyWith<_GetAnnonceStatsBySellerParams> get copyWith => __$GetAnnonceStatsBySellerParamsCopyWithImpl<_GetAnnonceStatsBySellerParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAnnonceStatsBySellerParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'GetAnnonceStatsBySellerParams(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$GetAnnonceStatsBySellerParamsCopyWith<$Res> implements $GetAnnonceStatsBySellerParamsCopyWith<$Res> {
  factory _$GetAnnonceStatsBySellerParamsCopyWith(_GetAnnonceStatsBySellerParams value, $Res Function(_GetAnnonceStatsBySellerParams) _then) = __$GetAnnonceStatsBySellerParamsCopyWithImpl;
@override @useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class __$GetAnnonceStatsBySellerParamsCopyWithImpl<$Res>
    implements _$GetAnnonceStatsBySellerParamsCopyWith<$Res> {
  __$GetAnnonceStatsBySellerParamsCopyWithImpl(this._self, this._then);

  final _GetAnnonceStatsBySellerParams _self;
  final $Res Function(_GetAnnonceStatsBySellerParams) _then;

/// Create a copy of GetAnnonceStatsBySellerParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,}) {
  return _then(_GetAnnonceStatsBySellerParams(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
