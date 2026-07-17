// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_alert_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceAlertRequestModel {

 String? get breed; String? get region; int? get radiusKm; double? get maxPrice; int? get minAgeMonths;
/// Create a copy of AnnonceAlertRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceAlertRequestModelCopyWith<AnnonceAlertRequestModel> get copyWith => _$AnnonceAlertRequestModelCopyWithImpl<AnnonceAlertRequestModel>(this as AnnonceAlertRequestModel, _$identity);

  /// Serializes this AnnonceAlertRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceAlertRequestModel&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.region, region) || other.region == region)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minAgeMonths, minAgeMonths) || other.minAgeMonths == minAgeMonths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breed,region,radiusKm,maxPrice,minAgeMonths);

@override
String toString() {
  return 'AnnonceAlertRequestModel(breed: $breed, region: $region, radiusKm: $radiusKm, maxPrice: $maxPrice, minAgeMonths: $minAgeMonths)';
}


}

/// @nodoc
abstract mixin class $AnnonceAlertRequestModelCopyWith<$Res>  {
  factory $AnnonceAlertRequestModelCopyWith(AnnonceAlertRequestModel value, $Res Function(AnnonceAlertRequestModel) _then) = _$AnnonceAlertRequestModelCopyWithImpl;
@useResult
$Res call({
 String? breed, String? region, int? radiusKm, double? maxPrice, int? minAgeMonths
});




}
/// @nodoc
class _$AnnonceAlertRequestModelCopyWithImpl<$Res>
    implements $AnnonceAlertRequestModelCopyWith<$Res> {
  _$AnnonceAlertRequestModelCopyWithImpl(this._self, this._then);

  final AnnonceAlertRequestModel _self;
  final $Res Function(AnnonceAlertRequestModel) _then;

/// Create a copy of AnnonceAlertRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? breed = freezed,Object? region = freezed,Object? radiusKm = freezed,Object? maxPrice = freezed,Object? minAgeMonths = freezed,}) {
  return _then(_self.copyWith(
breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,minAgeMonths: freezed == minAgeMonths ? _self.minAgeMonths : minAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceAlertRequestModel].
extension AnnonceAlertRequestModelPatterns on AnnonceAlertRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceAlertRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceAlertRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceAlertRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? breed,  String? region,  int? radiusKm,  double? maxPrice,  int? minAgeMonths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel() when $default != null:
return $default(_that.breed,_that.region,_that.radiusKm,_that.maxPrice,_that.minAgeMonths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? breed,  String? region,  int? radiusKm,  double? maxPrice,  int? minAgeMonths)  $default,) {final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel():
return $default(_that.breed,_that.region,_that.radiusKm,_that.maxPrice,_that.minAgeMonths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? breed,  String? region,  int? radiusKm,  double? maxPrice,  int? minAgeMonths)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceAlertRequestModel() when $default != null:
return $default(_that.breed,_that.region,_that.radiusKm,_that.maxPrice,_that.minAgeMonths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceAlertRequestModel extends AnnonceAlertRequestModel {
  const _AnnonceAlertRequestModel({this.breed, this.region, this.radiusKm, this.maxPrice, this.minAgeMonths}): super._();
  factory _AnnonceAlertRequestModel.fromJson(Map<String, dynamic> json) => _$AnnonceAlertRequestModelFromJson(json);

@override final  String? breed;
@override final  String? region;
@override final  int? radiusKm;
@override final  double? maxPrice;
@override final  int? minAgeMonths;

/// Create a copy of AnnonceAlertRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceAlertRequestModelCopyWith<_AnnonceAlertRequestModel> get copyWith => __$AnnonceAlertRequestModelCopyWithImpl<_AnnonceAlertRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceAlertRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceAlertRequestModel&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.region, region) || other.region == region)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minAgeMonths, minAgeMonths) || other.minAgeMonths == minAgeMonths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breed,region,radiusKm,maxPrice,minAgeMonths);

@override
String toString() {
  return 'AnnonceAlertRequestModel(breed: $breed, region: $region, radiusKm: $radiusKm, maxPrice: $maxPrice, minAgeMonths: $minAgeMonths)';
}


}

/// @nodoc
abstract mixin class _$AnnonceAlertRequestModelCopyWith<$Res> implements $AnnonceAlertRequestModelCopyWith<$Res> {
  factory _$AnnonceAlertRequestModelCopyWith(_AnnonceAlertRequestModel value, $Res Function(_AnnonceAlertRequestModel) _then) = __$AnnonceAlertRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? breed, String? region, int? radiusKm, double? maxPrice, int? minAgeMonths
});




}
/// @nodoc
class __$AnnonceAlertRequestModelCopyWithImpl<$Res>
    implements _$AnnonceAlertRequestModelCopyWith<$Res> {
  __$AnnonceAlertRequestModelCopyWithImpl(this._self, this._then);

  final _AnnonceAlertRequestModel _self;
  final $Res Function(_AnnonceAlertRequestModel) _then;

/// Create a copy of AnnonceAlertRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? breed = freezed,Object? region = freezed,Object? radiusKm = freezed,Object? maxPrice = freezed,Object? minAgeMonths = freezed,}) {
  return _then(_AnnonceAlertRequestModel(
breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,minAgeMonths: freezed == minAgeMonths ? _self.minAgeMonths : minAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
