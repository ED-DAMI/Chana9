// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_search_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceSearchRequestModel {

 String? get breed; String? get region; double? get minPrice; double? get maxPrice; double? get minWeight; double? get maxWeight; AnimalGender? get gender; int? get minAgeMonths; int? get maxAgeMonths; bool? get deliveryAvailable; bool? get priceNegotiable; bool? get eligibleForAid; bool? get topLotOnly; double? get latitude; double? get longitude; int? get radiusKm;
/// Create a copy of AnnonceSearchRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceSearchRequestModelCopyWith<AnnonceSearchRequestModel> get copyWith => _$AnnonceSearchRequestModelCopyWithImpl<AnnonceSearchRequestModel>(this as AnnonceSearchRequestModel, _$identity);

  /// Serializes this AnnonceSearchRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceSearchRequestModel&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.region, region) || other.region == region)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minWeight, minWeight) || other.minWeight == minWeight)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.minAgeMonths, minAgeMonths) || other.minAgeMonths == minAgeMonths)&&(identical(other.maxAgeMonths, maxAgeMonths) || other.maxAgeMonths == maxAgeMonths)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.topLotOnly, topLotOnly) || other.topLotOnly == topLotOnly)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breed,region,minPrice,maxPrice,minWeight,maxWeight,gender,minAgeMonths,maxAgeMonths,deliveryAvailable,priceNegotiable,eligibleForAid,topLotOnly,latitude,longitude,radiusKm);

@override
String toString() {
  return 'AnnonceSearchRequestModel(breed: $breed, region: $region, minPrice: $minPrice, maxPrice: $maxPrice, minWeight: $minWeight, maxWeight: $maxWeight, gender: $gender, minAgeMonths: $minAgeMonths, maxAgeMonths: $maxAgeMonths, deliveryAvailable: $deliveryAvailable, priceNegotiable: $priceNegotiable, eligibleForAid: $eligibleForAid, topLotOnly: $topLotOnly, latitude: $latitude, longitude: $longitude, radiusKm: $radiusKm)';
}


}

/// @nodoc
abstract mixin class $AnnonceSearchRequestModelCopyWith<$Res>  {
  factory $AnnonceSearchRequestModelCopyWith(AnnonceSearchRequestModel value, $Res Function(AnnonceSearchRequestModel) _then) = _$AnnonceSearchRequestModelCopyWithImpl;
@useResult
$Res call({
 String? breed, String? region, double? minPrice, double? maxPrice, double? minWeight, double? maxWeight, AnimalGender? gender, int? minAgeMonths, int? maxAgeMonths, bool? deliveryAvailable, bool? priceNegotiable, bool? eligibleForAid, bool? topLotOnly, double? latitude, double? longitude, int? radiusKm
});




}
/// @nodoc
class _$AnnonceSearchRequestModelCopyWithImpl<$Res>
    implements $AnnonceSearchRequestModelCopyWith<$Res> {
  _$AnnonceSearchRequestModelCopyWithImpl(this._self, this._then);

  final AnnonceSearchRequestModel _self;
  final $Res Function(AnnonceSearchRequestModel) _then;

/// Create a copy of AnnonceSearchRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? breed = freezed,Object? region = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? minWeight = freezed,Object? maxWeight = freezed,Object? gender = freezed,Object? minAgeMonths = freezed,Object? maxAgeMonths = freezed,Object? deliveryAvailable = freezed,Object? priceNegotiable = freezed,Object? eligibleForAid = freezed,Object? topLotOnly = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? radiusKm = freezed,}) {
  return _then(_self.copyWith(
breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,minWeight: freezed == minWeight ? _self.minWeight : minWeight // ignore: cast_nullable_to_non_nullable
as double?,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,minAgeMonths: freezed == minAgeMonths ? _self.minAgeMonths : minAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,maxAgeMonths: freezed == maxAgeMonths ? _self.maxAgeMonths : maxAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,deliveryAvailable: freezed == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool?,priceNegotiable: freezed == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool?,eligibleForAid: freezed == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool?,topLotOnly: freezed == topLotOnly ? _self.topLotOnly : topLotOnly // ignore: cast_nullable_to_non_nullable
as bool?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceSearchRequestModel].
extension AnnonceSearchRequestModelPatterns on AnnonceSearchRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceSearchRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceSearchRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceSearchRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? breed,  String? region,  double? minPrice,  double? maxPrice,  double? minWeight,  double? maxWeight,  AnimalGender? gender,  int? minAgeMonths,  int? maxAgeMonths,  bool? deliveryAvailable,  bool? priceNegotiable,  bool? eligibleForAid,  bool? topLotOnly,  double? latitude,  double? longitude,  int? radiusKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel() when $default != null:
return $default(_that.breed,_that.region,_that.minPrice,_that.maxPrice,_that.minWeight,_that.maxWeight,_that.gender,_that.minAgeMonths,_that.maxAgeMonths,_that.deliveryAvailable,_that.priceNegotiable,_that.eligibleForAid,_that.topLotOnly,_that.latitude,_that.longitude,_that.radiusKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? breed,  String? region,  double? minPrice,  double? maxPrice,  double? minWeight,  double? maxWeight,  AnimalGender? gender,  int? minAgeMonths,  int? maxAgeMonths,  bool? deliveryAvailable,  bool? priceNegotiable,  bool? eligibleForAid,  bool? topLotOnly,  double? latitude,  double? longitude,  int? radiusKm)  $default,) {final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel():
return $default(_that.breed,_that.region,_that.minPrice,_that.maxPrice,_that.minWeight,_that.maxWeight,_that.gender,_that.minAgeMonths,_that.maxAgeMonths,_that.deliveryAvailable,_that.priceNegotiable,_that.eligibleForAid,_that.topLotOnly,_that.latitude,_that.longitude,_that.radiusKm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? breed,  String? region,  double? minPrice,  double? maxPrice,  double? minWeight,  double? maxWeight,  AnimalGender? gender,  int? minAgeMonths,  int? maxAgeMonths,  bool? deliveryAvailable,  bool? priceNegotiable,  bool? eligibleForAid,  bool? topLotOnly,  double? latitude,  double? longitude,  int? radiusKm)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceSearchRequestModel() when $default != null:
return $default(_that.breed,_that.region,_that.minPrice,_that.maxPrice,_that.minWeight,_that.maxWeight,_that.gender,_that.minAgeMonths,_that.maxAgeMonths,_that.deliveryAvailable,_that.priceNegotiable,_that.eligibleForAid,_that.topLotOnly,_that.latitude,_that.longitude,_that.radiusKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceSearchRequestModel extends AnnonceSearchRequestModel {
  const _AnnonceSearchRequestModel({this.breed, this.region, this.minPrice, this.maxPrice, this.minWeight, this.maxWeight, this.gender, this.minAgeMonths, this.maxAgeMonths, this.deliveryAvailable, this.priceNegotiable, this.eligibleForAid, this.topLotOnly, this.latitude, this.longitude, this.radiusKm}): super._();
  factory _AnnonceSearchRequestModel.fromJson(Map<String, dynamic> json) => _$AnnonceSearchRequestModelFromJson(json);

@override final  String? breed;
@override final  String? region;
@override final  double? minPrice;
@override final  double? maxPrice;
@override final  double? minWeight;
@override final  double? maxWeight;
@override final  AnimalGender? gender;
@override final  int? minAgeMonths;
@override final  int? maxAgeMonths;
@override final  bool? deliveryAvailable;
@override final  bool? priceNegotiable;
@override final  bool? eligibleForAid;
@override final  bool? topLotOnly;
@override final  double? latitude;
@override final  double? longitude;
@override final  int? radiusKm;

/// Create a copy of AnnonceSearchRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceSearchRequestModelCopyWith<_AnnonceSearchRequestModel> get copyWith => __$AnnonceSearchRequestModelCopyWithImpl<_AnnonceSearchRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceSearchRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceSearchRequestModel&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.region, region) || other.region == region)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minWeight, minWeight) || other.minWeight == minWeight)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.minAgeMonths, minAgeMonths) || other.minAgeMonths == minAgeMonths)&&(identical(other.maxAgeMonths, maxAgeMonths) || other.maxAgeMonths == maxAgeMonths)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.topLotOnly, topLotOnly) || other.topLotOnly == topLotOnly)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusKm, radiusKm) || other.radiusKm == radiusKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,breed,region,minPrice,maxPrice,minWeight,maxWeight,gender,minAgeMonths,maxAgeMonths,deliveryAvailable,priceNegotiable,eligibleForAid,topLotOnly,latitude,longitude,radiusKm);

@override
String toString() {
  return 'AnnonceSearchRequestModel(breed: $breed, region: $region, minPrice: $minPrice, maxPrice: $maxPrice, minWeight: $minWeight, maxWeight: $maxWeight, gender: $gender, minAgeMonths: $minAgeMonths, maxAgeMonths: $maxAgeMonths, deliveryAvailable: $deliveryAvailable, priceNegotiable: $priceNegotiable, eligibleForAid: $eligibleForAid, topLotOnly: $topLotOnly, latitude: $latitude, longitude: $longitude, radiusKm: $radiusKm)';
}


}

/// @nodoc
abstract mixin class _$AnnonceSearchRequestModelCopyWith<$Res> implements $AnnonceSearchRequestModelCopyWith<$Res> {
  factory _$AnnonceSearchRequestModelCopyWith(_AnnonceSearchRequestModel value, $Res Function(_AnnonceSearchRequestModel) _then) = __$AnnonceSearchRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? breed, String? region, double? minPrice, double? maxPrice, double? minWeight, double? maxWeight, AnimalGender? gender, int? minAgeMonths, int? maxAgeMonths, bool? deliveryAvailable, bool? priceNegotiable, bool? eligibleForAid, bool? topLotOnly, double? latitude, double? longitude, int? radiusKm
});




}
/// @nodoc
class __$AnnonceSearchRequestModelCopyWithImpl<$Res>
    implements _$AnnonceSearchRequestModelCopyWith<$Res> {
  __$AnnonceSearchRequestModelCopyWithImpl(this._self, this._then);

  final _AnnonceSearchRequestModel _self;
  final $Res Function(_AnnonceSearchRequestModel) _then;

/// Create a copy of AnnonceSearchRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? breed = freezed,Object? region = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? minWeight = freezed,Object? maxWeight = freezed,Object? gender = freezed,Object? minAgeMonths = freezed,Object? maxAgeMonths = freezed,Object? deliveryAvailable = freezed,Object? priceNegotiable = freezed,Object? eligibleForAid = freezed,Object? topLotOnly = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? radiusKm = freezed,}) {
  return _then(_AnnonceSearchRequestModel(
breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,minWeight: freezed == minWeight ? _self.minWeight : minWeight // ignore: cast_nullable_to_non_nullable
as double?,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,minAgeMonths: freezed == minAgeMonths ? _self.minAgeMonths : minAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,maxAgeMonths: freezed == maxAgeMonths ? _self.maxAgeMonths : maxAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,deliveryAvailable: freezed == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool?,priceNegotiable: freezed == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool?,eligibleForAid: freezed == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool?,topLotOnly: freezed == topLotOnly ? _self.topLotOnly : topLotOnly // ignore: cast_nullable_to_non_nullable
as bool?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,radiusKm: freezed == radiusKm ? _self.radiusKm : radiusKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
