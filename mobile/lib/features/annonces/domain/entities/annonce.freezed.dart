// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Annonce {

 String get id; String get title; String? get description; AnimalBreed get breed; double get price; bool get priceNegotiable; String get region; AnnonceStatus get status; AnimalGender? get gender; int? get ageMonths; int? get effectiveAgeMonths; bool get eligibleForAid; String? get addressLabel; double? get latitude; double? get longitude; double? get distanceKm; bool get deliveryAvailable; double? get deliveryPrice; bool get isTopLot; DateTime? get topLotExpiresAt; DateTime? get expiresAt; String get sellerId; List<AnnonceMedia> get medias; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Annonce
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceCopyWith<Annonce> get copyWith => _$AnnonceCopyWithImpl<Annonce>(this as Annonce, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Annonce&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other.medias, medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,price,priceNegotiable,region,status,gender,ageMonths,effectiveAgeMonths,eligibleForAid,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,isTopLot,topLotExpiresAt,expiresAt,sellerId,const DeepCollectionEquality().hash(medias),createdAt,updatedAt]);

@override
String toString() {
  return 'Annonce(id: $id, title: $title, description: $description, breed: $breed, price: $price, priceNegotiable: $priceNegotiable, region: $region, status: $status, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, eligibleForAid: $eligibleForAid, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnnonceCopyWith<$Res>  {
  factory $AnnonceCopyWith(Annonce value, $Res Function(Annonce) _then) = _$AnnonceCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, AnimalBreed breed, double price, bool priceNegotiable, String region, AnnonceStatus status, AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, bool eligibleForAid, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool isTopLot, DateTime? topLotExpiresAt, DateTime? expiresAt, String sellerId, List<AnnonceMedia> medias, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AnnonceCopyWithImpl<$Res>
    implements $AnnonceCopyWith<$Res> {
  _$AnnonceCopyWithImpl(this._self, this._then);

  final Annonce _self;
  final $Res Function(Annonce) _then;

/// Create a copy of Annonce
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? price = null,Object? priceNegotiable = null,Object? region = null,Object? status = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? eligibleForAid = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as AnimalBreed,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,eligibleForAid: null == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,medias: null == medias ? _self.medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMedia>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Annonce].
extension AnnoncePatterns on Annonce {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Annonce value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Annonce() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Annonce value)  $default,){
final _that = this;
switch (_that) {
case _Annonce():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Annonce value)?  $default,){
final _that = this;
switch (_that) {
case _Annonce() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  AnimalBreed breed,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Annonce() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  AnimalBreed breed,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Annonce():
return $default(_that.id,_that.title,_that.description,_that.breed,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  AnimalBreed breed,  double price,  bool priceNegotiable,  String region,  AnnonceStatus status,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  bool eligibleForAid,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool isTopLot,  DateTime? topLotExpiresAt,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Annonce() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.price,_that.priceNegotiable,_that.region,_that.status,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.eligibleForAid,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.isTopLot,_that.topLotExpiresAt,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Annonce implements Annonce {
  const _Annonce({required this.id, required this.title, this.description, required this.breed, required this.price, required this.priceNegotiable, required this.region, required this.status, this.gender, this.ageMonths, this.effectiveAgeMonths, required this.eligibleForAid, this.addressLabel, this.latitude, this.longitude, this.distanceKm, required this.deliveryAvailable, this.deliveryPrice, required this.isTopLot, this.topLotExpiresAt, this.expiresAt, required this.sellerId, required final  List<AnnonceMedia> medias, this.createdAt, this.updatedAt}): _medias = medias;
  

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  AnimalBreed breed;
@override final  double price;
@override final  bool priceNegotiable;
@override final  String region;
@override final  AnnonceStatus status;
@override final  AnimalGender? gender;
@override final  int? ageMonths;
@override final  int? effectiveAgeMonths;
@override final  bool eligibleForAid;
@override final  String? addressLabel;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
@override final  bool deliveryAvailable;
@override final  double? deliveryPrice;
@override final  bool isTopLot;
@override final  DateTime? topLotExpiresAt;
@override final  DateTime? expiresAt;
@override final  String sellerId;
 final  List<AnnonceMedia> _medias;
@override List<AnnonceMedia> get medias {
  if (_medias is EqualUnmodifiableListView) return _medias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medias);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Annonce
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceCopyWith<_Annonce> get copyWith => __$AnnonceCopyWithImpl<_Annonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Annonce&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.eligibleForAid, eligibleForAid) || other.eligibleForAid == eligibleForAid)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other._medias, _medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,price,priceNegotiable,region,status,gender,ageMonths,effectiveAgeMonths,eligibleForAid,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,isTopLot,topLotExpiresAt,expiresAt,sellerId,const DeepCollectionEquality().hash(_medias),createdAt,updatedAt]);

@override
String toString() {
  return 'Annonce(id: $id, title: $title, description: $description, breed: $breed, price: $price, priceNegotiable: $priceNegotiable, region: $region, status: $status, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, eligibleForAid: $eligibleForAid, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnnonceCopyWith<$Res> implements $AnnonceCopyWith<$Res> {
  factory _$AnnonceCopyWith(_Annonce value, $Res Function(_Annonce) _then) = __$AnnonceCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, AnimalBreed breed, double price, bool priceNegotiable, String region, AnnonceStatus status, AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, bool eligibleForAid, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool isTopLot, DateTime? topLotExpiresAt, DateTime? expiresAt, String sellerId, List<AnnonceMedia> medias, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AnnonceCopyWithImpl<$Res>
    implements _$AnnonceCopyWith<$Res> {
  __$AnnonceCopyWithImpl(this._self, this._then);

  final _Annonce _self;
  final $Res Function(_Annonce) _then;

/// Create a copy of Annonce
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? price = null,Object? priceNegotiable = null,Object? region = null,Object? status = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? eligibleForAid = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Annonce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as AnimalBreed,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,eligibleForAid: null == eligibleForAid ? _self.eligibleForAid : eligibleForAid // ignore: cast_nullable_to_non_nullable
as bool,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMedia>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
