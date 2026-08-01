// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileRequestModel {

 String? get fullName; String? get region;
/// Create a copy of UpdateProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileRequestModelCopyWith<UpdateProfileRequestModel> get copyWith => _$UpdateProfileRequestModelCopyWithImpl<UpdateProfileRequestModel>(this as UpdateProfileRequestModel, _$identity);

  /// Serializes this UpdateProfileRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileRequestModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,region);

@override
String toString() {
  return 'UpdateProfileRequestModel(fullName: $fullName, region: $region)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileRequestModelCopyWith<$Res>  {
  factory $UpdateProfileRequestModelCopyWith(UpdateProfileRequestModel value, $Res Function(UpdateProfileRequestModel) _then) = _$UpdateProfileRequestModelCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? region
});




}
/// @nodoc
class _$UpdateProfileRequestModelCopyWithImpl<$Res>
    implements $UpdateProfileRequestModelCopyWith<$Res> {
  _$UpdateProfileRequestModelCopyWithImpl(this._self, this._then);

  final UpdateProfileRequestModel _self;
  final $Res Function(UpdateProfileRequestModel) _then;

/// Create a copy of UpdateProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? region = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileRequestModel].
extension UpdateProfileRequestModelPatterns on UpdateProfileRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileRequestModel() when $default != null:
return $default(_that.fullName,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? region)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequestModel():
return $default(_that.fullName,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequestModel() when $default != null:
return $default(_that.fullName,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileRequestModel implements UpdateProfileRequestModel {
  const _UpdateProfileRequestModel({this.fullName, this.region});
  factory _UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestModelFromJson(json);

@override final  String? fullName;
@override final  String? region;

/// Create a copy of UpdateProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileRequestModelCopyWith<_UpdateProfileRequestModel> get copyWith => __$UpdateProfileRequestModelCopyWithImpl<_UpdateProfileRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileRequestModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,region);

@override
String toString() {
  return 'UpdateProfileRequestModel(fullName: $fullName, region: $region)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileRequestModelCopyWith<$Res> implements $UpdateProfileRequestModelCopyWith<$Res> {
  factory _$UpdateProfileRequestModelCopyWith(_UpdateProfileRequestModel value, $Res Function(_UpdateProfileRequestModel) _then) = __$UpdateProfileRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? region
});




}
/// @nodoc
class __$UpdateProfileRequestModelCopyWithImpl<$Res>
    implements _$UpdateProfileRequestModelCopyWith<$Res> {
  __$UpdateProfileRequestModelCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequestModel _self;
  final $Res Function(_UpdateProfileRequestModel) _then;

/// Create a copy of UpdateProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? region = freezed,}) {
  return _then(_UpdateProfileRequestModel(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
