// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceModel {

 String get id; String get title; String? get description; String get breed; double? get estimatedWeight; double get price; bool get priceNegotiable; String get region; AnnonceStatus get status; AnimalGender? get gender; DateTime? get birthDate; int? get ageMonths; int? get effectiveAgeMonths; bool get eligibleForAid; String? get addressLabel; double? get latitude; double? get longitude; double? get distanceKm; bool get deliveryAvailable; int? get deliveryRadiusKm; double? get deliveryPrice; bool get isTopLot; DateTime? get topLotExpiresAt; DateTime? get expiresAt; String get sellerId; List<AnnonceMediaModel> get medias; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceModelCopyWith<AnnonceModel> get copyWith => _$AnnonceModelCopyWithImpl<AnnonceModel>(this as AnnonceModel, _$identity);

  /// Serializes this AnnonceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryRadiusKm, deliveryRadiusKm) || other.deliveryRadiusKm == deliveryRadiusKm)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other.medias, medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,estimatedWeight,price,priceNegotiable,region,status,gender,birthDate,ageMonths,effectiveAgeMonths,eligibleForAid,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryRadiusKm,deliveryPrice,isTopLot,topLotExpiresAt,expiresAt,sellerId,const DeepCollectionEquality().hash(medias),createdAt,updatedAt]);

@override
String toString() {
  return 'AnnonceModel(id: $id, title: $title, description: $description, breed: $breed, estimatedWeight: $estimatedWeight, price: $price, priceNegotiable: $priceNegotiable, region: $region, status: $status, gender: $gender, birthDate: $birthDate, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, eligibleForAid: $eligibleForAid, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryRadiusKm: $deliveryRadiusKm, deliveryPrice: $deliveryPrice, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnnonceModelCopyWith<$Res>  {
  factory $AnnonceModelCopyWith(AnnonceModel value, $Res Function(AnnonceModel) _then) = _$AnnonceModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String breed, double? estimatedWeight, double price, bool priceNegotiable, String region, AnnonceStatus status, AnimalGender? gender, DateTime? birthDate, int? ageMonths, int? effectiveAgeMonths, bool eligibleForAid, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, int? deliveryRadiusKm, double? deliveryPrice, bool isTopLot, DateTime? topLotExpiresAt, DateTime? expiresAt, String sellerId, List<AnnonceMediaModel> medias, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AnnonceModelCopyWithImpl<$Res>
    implements $AnnonceModelCopyWith<$Res> {
  _$AnnonceModelCopyWithImpl(this._self, this._then);

  final AnnonceModel _self;
  final $Res Function(AnnonceModel) _then;

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? estimatedWeight = freezed,Object? price = null,Object? priceNegotiable = null,Object? region = null,Object? status = null,Object? gender = freezed,Object? birthDate = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? eligibleForAid = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryRadiusKm = freezed,Object? deliveryPrice = freezed,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: freezed == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,eligibleForAid: null == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as int?,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,medias: null == medias ? _self.medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMediaModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceModel].
extension AnnonceModelPatterns on AnnonceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  DateTime? birthDate,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMediaModel> medias,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.birthDate,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  DateTime? birthDate,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMediaModel> medias,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AnnonceModel():
return $default(_that.id,_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.birthDate,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String breed,  double? estimatedWeight,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  DateTime? birthDate,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  int? deliveryRadiusKm,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMediaModel> medias,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.estimatedWeight,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.birthDate,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryRadiusKm,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceModel extends AnnonceModel {
  const _AnnonceModel({required this.id, required this.title, this.description, required this.breed, this.estimatedWeight, required this.price, required this.priceNegotiable, required this.region, required this.status, this.gender, this.birthDate, this.ageMonths, this.effectiveAgeMonths, required this.eligibleForAid, this.addressLabel, this.latitude, this.longitude, this.distanceKm, required this.deliveryAvailable, this.deliveryRadiusKm, this.deliveryPrice, required this.isTopLot, this.topLotExpiresAt, this.expiresAt, required this.sellerId, final  List<AnnonceMediaModel> medias = const [], required this.createdAt, required this.updatedAt}): _medias = medias,super._();
  factory _AnnonceModel.fromJson(Map<String, dynamic> json) => _$AnnonceModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String breed;
@override final  double? estimatedWeight;
@override final  double price;
@override final  bool priceNegotiable;
@override final  String region;
@override final  AnnonceStatus status;
@override final  AnimalGender? gender;
@override final  DateTime? birthDate;
@override final  int? ageMonths;
@override final  int? effectiveAgeMonths;
@override final  bool eligibleForAid;
@override final  String? addressLabel;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
@override final  bool deliveryAvailable;
@override final  int? deliveryRadiusKm;
@override final  double? deliveryPrice;
@override final  bool isTopLot;
@override final  DateTime? topLotExpiresAt;
@override final  DateTime? expiresAt;
@override final  String sellerId;
 final  List<AnnonceMediaModel> _medias;
@override@JsonKey() List<AnnonceMediaModel> get medias {
  if (_medias is EqualUnmodifiableListView) return _medias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medias);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceModelCopyWith<_AnnonceModel> get copyWith => __$AnnonceModelCopyWithImpl<_AnnonceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryRadiusKm, deliveryRadiusKm) || other.deliveryRadiusKm == deliveryRadiusKm)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other._medias, _medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,estimatedWeight,price,priceNegotiable,region,status,gender,birthDate,ageMonths,effectiveAgeMonths,eligibleForAid,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryRadiusKm,deliveryPrice,isTopLot,topLotExpiresAt,expiresAt,sellerId,const DeepCollectionEquality().hash(_medias),createdAt,updatedAt]);

@override
String toString() {
  return 'AnnonceModel(id: $id, title: $title, description: $description, breed: $breed, estimatedWeight: $estimatedWeight, price: $price, priceNegotiable: $priceNegotiable, region: $region, status: $status, gender: $gender, birthDate: $birthDate, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, eligibleForAid: $eligibleForAid, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryRadiusKm: $deliveryRadiusKm, deliveryPrice: $deliveryPrice, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnnonceModelCopyWith<$Res> implements $AnnonceModelCopyWith<$Res> {
  factory _$AnnonceModelCopyWith(_AnnonceModel value, $Res Function(_AnnonceModel) _then) = __$AnnonceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String breed, double? estimatedWeight, double price, bool priceNegotiable, String region, AnnonceStatus status, AnimalGender? gender, DateTime? birthDate, int? ageMonths, int? effectiveAgeMonths, bool eligibleForAid, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, int? deliveryRadiusKm, double? deliveryPrice, bool isTopLot, DateTime? topLotExpiresAt, DateTime? expiresAt, String sellerId, List<AnnonceMediaModel> medias, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AnnonceModelCopyWithImpl<$Res>
    implements _$AnnonceModelCopyWith<$Res> {
  __$AnnonceModelCopyWithImpl(this._self, this._then);

  final _AnnonceModel _self;
  final $Res Function(_AnnonceModel) _then;

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? estimatedWeight = freezed,Object? price = null,Object? priceNegotiable = null,Object? region = null,Object? status = null,Object? gender = freezed,Object? birthDate = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? eligibleForAid = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryRadiusKm = freezed,Object? deliveryPrice = freezed,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AnnonceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: freezed == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,eligibleForAid: null == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryRadiusKm: freezed == deliveryRadiusKm ? _self.deliveryRadiusKm : deliveryRadiusKm // ignore: cast_nullable_to_non_nullable
as int?,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMediaModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
