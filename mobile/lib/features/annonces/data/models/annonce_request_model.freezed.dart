// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceRequestModel {

 String get title; String? get description; String get breed; double? get estimatedWeight; double get price; bool? get priceNegotiable; String get region; AnimalGender? get gender; String? get birthDate; int? get ageMonths; double? get latitude; double? get longitude; String? get addressLabel; bool? get deliveryAvailable; int? get deliveryRadiusKm; double? get deliveryPrice;
/// Create a copy of AnnonceRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceRequestModelCopyWith<AnnonceRequestModel> get copyWith => _$AnnonceRequestModelCopyWithImpl<AnnonceRequestModel>(this as AnnonceRequestModel, _$identity);

  /// Serializes this AnnonceRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryRadiusKm, deliveryRadiusKm) || other.deliveryRadiusKm == deliveryRadiusKm)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,breed,estimatedWeight,price,priceNegotiable,region,gender,birthDate,ageMonths,latitude,longitude,addressLabel,deliveryAvailable,deliveryRadiusKm,deliveryPrice);

@override
String toString() {
  return 'AnnonceRequestModel(title: $title, description: $description, breed: $breed, estimatedWeight: $estimatedWeight, price: $price, priceNegotiable: $priceNegotiable, region: $region, gender: $gender, birthDate: $birthDate, ageMonths: $ageMonths, latitude: $latitude, longitude: $longitude, addressLabel: $addressLabel, deliveryAvailable: $deliveryAvailable, deliveryRadiusKm: $deliveryRadiusKm, deliveryPrice: $deliveryPrice)';
}


}

/// @nodoc
abstract mixin class $AnnonceRequestModelCopyWith<$Res>  {
  factory $AnnonceRequestModelCopyWith(AnnonceRequestModel value, $Res Function(AnnonceRequestModel) _then) = _$AnnonceRequestModelCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String breed, double? estimatedWeight, double price, bool? priceNegotiable, String region, AnimalGender? gender, String? birthDate, int? ageMonths, double? latitude, double? longitude, String? addressLabel, bool? deliveryAvailable, int? deliveryRadiusKm, double? deliveryPrice
});




}
/// @nodoc
class _$AnnonceRequestModelCopyWithImpl<$Res>
    implements $AnnonceRequestModelCopyWith<$Res> {
  _$AnnonceRequestModelCopyWithImpl(this._self, this._then);

  final AnnonceRequestModel _self;
  final $Res Function(AnnonceRequestModel) _then;

/// Create a copy of AnnonceRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? breed = null,Object? estimatedWeight = freezed,Object? price = null,Object? priceNegotiable = freezed,Object? region = null,Object? gender = freezed,Object? birthDate = freezed,Object? ageMonths = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? addressLabel = freezed,Object? deliveryAvailable = freezed,Object? deliveryRadiusKm = freezed,Object? deliveryPrice = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: freezed == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: freezed == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,deliveryAvailable: freezed == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool?,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as int?,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceRequestModel].
extension AnnonceRequestModelPatterns on AnnonceRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool? priceNegotiable,  String region,  AnimalGender? gender,  String? birthDate,  int? ageMonths,  double? latitude,  double? longitude,  String? addressLabel,  bool? deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceRequestModel() when $default != null:
return $default(_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.gender,_that.birthDate,_that.ageMonths,_that.latitude,_that.longitude,_that.addressLabel,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool? priceNegotiable,  String region,  AnimalGender? gender,  String? birthDate,  int? ageMonths,  double? latitude,  double? longitude,  String? addressLabel,  bool? deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice)  $default,) {final _that = this;
switch (_that) {
case _AnnonceRequestModel():
return $default(_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.gender,_that.birthDate,_that.ageMonths,_that.latitude,_that.longitude,_that.addressLabel,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool? priceNegotiable,  String region,  AnimalGender? gender,  String? birthDate,  int? ageMonths,  double? latitude,  double? longitude,  String? addressLabel,  bool? deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceRequestModel() when $default != null:
return $default(_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.gender,_that.birthDate,_that.ageMonths,_that.latitude,_that.longitude,_that.addressLabel,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceRequestModel extends AnnonceRequestModel {
  const _AnnonceRequestModel({required this.title, this.description, required this.breed, this.estimatedWeight, required this.price, this.priceNegotiable, required this.region, this.gender, this.birthDate, this.ageMonths, this.latitude, this.longitude, this.addressLabel, this.deliveryAvailable, this.deliveryRadiusKm, this.deliveryPrice}): super._();
  factory _AnnonceRequestModel.fromJson(Map<String, dynamic> json) => _$AnnonceRequestModelFromJson(json);

@override final  String title;
@override final  String? description;
@override final  String breed;
@override final  double? estimatedWeight;
@override final  double price;
@override final  bool? priceNegotiable;
@override final  String region;
@override final  AnimalGender? gender;
@override final  String? birthDate;
@override final  int? ageMonths;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? addressLabel;
@override final  bool? deliveryAvailable;
@override final  int? deliveryRadiusKm;
@override final  double? deliveryPrice;

/// Create a copy of AnnonceRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceRequestModelCopyWith<_AnnonceRequestModel> get copyWith => __$AnnonceRequestModelCopyWithImpl<_AnnonceRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryRadiusKm, deliveryRadiusKm) || other.deliveryRadiusKm == deliveryRadiusKm)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,breed,estimatedWeight,price,priceNegotiable,region,gender,birthDate,ageMonths,latitude,longitude,addressLabel,deliveryAvailable,deliveryRadiusKm,deliveryPrice);

@override
String toString() {
  return 'AnnonceRequestModel(title: $title, description: $description, breed: $breed, estimatedWeight: $estimatedWeight, price: $price, priceNegotiable: $priceNegotiable, region: $region, gender: $gender, birthDate: $birthDate, ageMonths: $ageMonths, latitude: $latitude, longitude: $longitude, addressLabel: $addressLabel, deliveryAvailable: $deliveryAvailable, deliveryRadiusKm: $deliveryRadiusKm, deliveryPrice: $deliveryPrice)';
}


}

/// @nodoc
abstract mixin class _$AnnonceRequestModelCopyWith<$Res> implements $AnnonceRequestModelCopyWith<$Res> {
  factory _$AnnonceRequestModelCopyWith(_AnnonceRequestModel value, $Res Function(_AnnonceRequestModel) _then) = __$AnnonceRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String breed, double? estimatedWeight, double price, bool? priceNegotiable, String region, AnimalGender? gender, String? birthDate, int? ageMonths, double? latitude, double? longitude, String? addressLabel, bool? deliveryAvailable, int? deliveryRadiusKm, double? deliveryPrice
});




}
/// @nodoc
class __$AnnonceRequestModelCopyWithImpl<$Res>
    implements _$AnnonceRequestModelCopyWith<$Res> {
  __$AnnonceRequestModelCopyWithImpl(this._self, this._then);

  final _AnnonceRequestModel _self;
  final $Res Function(_AnnonceRequestModel) _then;

/// Create a copy of AnnonceRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? breed = null,Object? estimatedWeight = freezed,Object? price = null,Object? priceNegotiable = freezed,Object? region = null,Object? gender = freezed,Object? birthDate = freezed,Object? ageMonths = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? addressLabel = freezed,Object? deliveryAvailable = freezed,Object? deliveryRadiusKm = freezed,Object? deliveryPrice = freezed,}) {
  return _then(_AnnonceRequestModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: freezed == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: freezed == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,deliveryAvailable: freezed == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool?,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as int?,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
