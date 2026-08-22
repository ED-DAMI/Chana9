// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerSummary {

 String get id; String? get fullName; String? get avatarUrl; String? get region;
/// Create a copy of SellerSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerSummaryCopyWith<SellerSummary> get copyWith => _$SellerSummaryCopyWithImpl<SellerSummary>(this as SellerSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,region);

@override
String toString() {
  return 'SellerSummary(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, region: $region)';
}


}

/// @nodoc
abstract mixin class $SellerSummaryCopyWith<$Res>  {
  factory $SellerSummaryCopyWith(SellerSummary value, $Res Function(SellerSummary) _then) = _$SellerSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String? avatarUrl, String? region
});




}
/// @nodoc
class _$SellerSummaryCopyWithImpl<$Res>
    implements $SellerSummaryCopyWith<$Res> {
  _$SellerSummaryCopyWithImpl(this._self, this._then);

  final SellerSummary _self;
  final $Res Function(SellerSummary) _then;

/// Create a copy of SellerSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = freezed,Object? avatarUrl = freezed,Object? region = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerSummary].
extension SellerSummaryPatterns on SellerSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerSummary value)  $default,){
final _that = this;
switch (_that) {
case _SellerSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SellerSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? avatarUrl,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerSummary() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? avatarUrl,  String? region)  $default,) {final _that = this;
switch (_that) {
case _SellerSummary():
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fullName,  String? avatarUrl,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _SellerSummary() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.region);case _:
  return null;

}
}

}

/// @nodoc


class _SellerSummary implements SellerSummary {
  const _SellerSummary({required this.id, this.fullName, this.avatarUrl, this.region});
  

@override final  String id;
@override final  String? fullName;
@override final  String? avatarUrl;
@override final  String? region;

/// Create a copy of SellerSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerSummaryCopyWith<_SellerSummary> get copyWith => __$SellerSummaryCopyWithImpl<_SellerSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,region);

@override
String toString() {
  return 'SellerSummary(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, region: $region)';
}


}

/// @nodoc
abstract mixin class _$SellerSummaryCopyWith<$Res> implements $SellerSummaryCopyWith<$Res> {
  factory _$SellerSummaryCopyWith(_SellerSummary value, $Res Function(_SellerSummary) _then) = __$SellerSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String? avatarUrl, String? region
});




}
/// @nodoc
class __$SellerSummaryCopyWithImpl<$Res>
    implements _$SellerSummaryCopyWith<$Res> {
  __$SellerSummaryCopyWithImpl(this._self, this._then);

  final _SellerSummary _self;
  final $Res Function(_SellerSummary) _then;

/// Create a copy of SellerSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? avatarUrl = freezed,Object? region = freezed,}) {
  return _then(_SellerSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
