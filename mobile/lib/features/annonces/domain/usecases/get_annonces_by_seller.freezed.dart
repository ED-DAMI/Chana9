// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_annonces_by_seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAnnoncesBySellerParams {

 String get sellerId; int get page; int get size;
/// Create a copy of GetAnnoncesBySellerParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAnnoncesBySellerParamsCopyWith<GetAnnoncesBySellerParams> get copyWith => _$GetAnnoncesBySellerParamsCopyWithImpl<GetAnnoncesBySellerParams>(this as GetAnnoncesBySellerParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAnnoncesBySellerParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,page,size);

@override
String toString() {
  return 'GetAnnoncesBySellerParams(sellerId: $sellerId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $GetAnnoncesBySellerParamsCopyWith<$Res>  {
  factory $GetAnnoncesBySellerParamsCopyWith(GetAnnoncesBySellerParams value, $Res Function(GetAnnoncesBySellerParams) _then) = _$GetAnnoncesBySellerParamsCopyWithImpl;
@useResult
$Res call({
 String sellerId, int page, int size
});




}
/// @nodoc
class _$GetAnnoncesBySellerParamsCopyWithImpl<$Res>
    implements $GetAnnoncesBySellerParamsCopyWith<$Res> {
  _$GetAnnoncesBySellerParamsCopyWithImpl(this._self, this._then);

  final GetAnnoncesBySellerParams _self;
  final $Res Function(GetAnnoncesBySellerParams) _then;

/// Create a copy of GetAnnoncesBySellerParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAnnoncesBySellerParams].
extension GetAnnoncesBySellerParamsPatterns on GetAnnoncesBySellerParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAnnoncesBySellerParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAnnoncesBySellerParams value)  $default,){
final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAnnoncesBySellerParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sellerId,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams() when $default != null:
return $default(_that.sellerId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sellerId,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams():
return $default(_that.sellerId,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sellerId,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _GetAnnoncesBySellerParams() when $default != null:
return $default(_that.sellerId,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc


class _GetAnnoncesBySellerParams implements GetAnnoncesBySellerParams {
  const _GetAnnoncesBySellerParams({required this.sellerId, this.page = 0, this.size = 20});
  

@override final  String sellerId;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of GetAnnoncesBySellerParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAnnoncesBySellerParamsCopyWith<_GetAnnoncesBySellerParams> get copyWith => __$GetAnnoncesBySellerParamsCopyWithImpl<_GetAnnoncesBySellerParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAnnoncesBySellerParams&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,page,size);

@override
String toString() {
  return 'GetAnnoncesBySellerParams(sellerId: $sellerId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$GetAnnoncesBySellerParamsCopyWith<$Res> implements $GetAnnoncesBySellerParamsCopyWith<$Res> {
  factory _$GetAnnoncesBySellerParamsCopyWith(_GetAnnoncesBySellerParams value, $Res Function(_GetAnnoncesBySellerParams) _then) = __$GetAnnoncesBySellerParamsCopyWithImpl;
@override @useResult
$Res call({
 String sellerId, int page, int size
});




}
/// @nodoc
class __$GetAnnoncesBySellerParamsCopyWithImpl<$Res>
    implements _$GetAnnoncesBySellerParamsCopyWith<$Res> {
  __$GetAnnoncesBySellerParamsCopyWithImpl(this._self, this._then);

  final _GetAnnoncesBySellerParams _self;
  final $Res Function(_GetAnnoncesBySellerParams) _then;

/// Create a copy of GetAnnoncesBySellerParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? page = null,Object? size = null,}) {
  return _then(_GetAnnoncesBySellerParams(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
