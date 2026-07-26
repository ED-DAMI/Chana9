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

 String get id; String get title; String? get description; AnimalBreed get breed; AnimalGender? get gender; int? get ageMonths; int? get effectiveAgeMonths; double? get weightKg; AnimalDentition? get dentition; String? get onssaTagNumber; double get price; PriceType? get priceType; bool get priceNegotiable; int? get headCount; String get region; String? get addressLabel; double? get latitude; double? get longitude; double? get distanceKm; bool get deliveryAvailable; double? get deliveryPrice; bool? get boardingAvailable; double? get boardingDailyPrice; AnnonceStatus get status; bool get isTopLot; DateTime? get topLotExpiresAt; int? get viewsCount; int? get favoritesCount; DateTime? get expiresAt; String get sellerId; List<AnnonceMedia> get medias; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Annonce
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceCopyWith<Annonce> get copyWith => _$AnnonceCopyWithImpl<Annonce>(this as Annonce, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Annonce&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dentition, dentition) || other.dentition == dentition)&&(identical(other.onssaTagNumber, onssaTagNumber) || other.onssaTagNumber == onssaTagNumber)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.headCount, headCount) || other.headCount == headCount)&&(identical(other.region, region) || other.region == region)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.boardingAvailable, boardingAvailable) || other.boardingAvailable == boardingAvailable)&&(identical(other.boardingDailyPrice, boardingDailyPrice) || other.boardingDailyPrice == boardingDailyPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other.medias, medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,gender,ageMonths,effectiveAgeMonths,weightKg,dentition,onssaTagNumber,price,priceType,priceNegotiable,headCount,region,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,boardingAvailable,boardingDailyPrice,status,isTopLot,topLotExpiresAt,viewsCount,favoritesCount,expiresAt,sellerId,const DeepCollectionEquality().hash(medias),createdAt,updatedAt]);

@override
String toString() {
  return 'Annonce(id: $id, title: $title, description: $description, breed: $breed, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, weightKg: $weightKg, dentition: $dentition, onssaTagNumber: $onssaTagNumber, price: $price, priceType: $priceType, priceNegotiable: $priceNegotiable, headCount: $headCount, region: $region, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, boardingAvailable: $boardingAvailable, boardingDailyPrice: $boardingDailyPrice, status: $status, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, viewsCount: $viewsCount, favoritesCount: $favoritesCount, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnnonceCopyWith<$Res>  {
  factory $AnnonceCopyWith(Annonce value, $Res Function(Annonce) _then) = _$AnnonceCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, AnimalBreed breed, AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, double? weightKg, AnimalDentition? dentition, String? onssaTagNumber, double price, PriceType? priceType, bool priceNegotiable, int? headCount, String region, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool? boardingAvailable, double? boardingDailyPrice, AnnonceStatus status, bool isTopLot, DateTime? topLotExpiresAt, int? viewsCount, int? favoritesCount, DateTime? expiresAt, String sellerId, List<AnnonceMedia> medias, DateTime? createdAt, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? weightKg = freezed,Object? dentition = freezed,Object? onssaTagNumber = freezed,Object? price = null,Object? priceType = freezed,Object? priceNegotiable = null,Object? headCount = freezed,Object? region = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? boardingAvailable = freezed,Object? boardingDailyPrice = freezed,Object? status = null,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? viewsCount = freezed,Object? favoritesCount = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as AnimalBreed,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,dentition: freezed == dentition ? _self.dentition : dentition // ignore: cast_nullable_to_non_nullable
as AnimalDentition?,onssaTagNumber: freezed == onssaTagNumber ? _self.onssaTagNumber : onssaTagNumber // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as PriceType?,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,headCount: freezed == headCount ? _self.headCount : headCount // ignore: cast_nullable_to_non_nullable
as int?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,boardingAvailable: freezed == boardingAvailable ? _self.boardingAvailable : boardingAvailable // ignore: cast_nullable_to_non_nullable
as bool?,boardingDailyPrice: freezed == boardingDailyPrice ? _self.boardingDailyPrice : boardingDailyPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,favoritesCount: freezed == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  AnimalBreed breed,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg,  AnimalDentition? dentition,  String? onssaTagNumber,  double price,  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool? boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Annonce() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  AnimalBreed breed,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg,  AnimalDentition? dentition,  String? onssaTagNumber,  double price,  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool? boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Annonce():
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  AnimalBreed breed,  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg,  AnimalDentition? dentition,  String? onssaTagNumber,  double price,  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool? boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  String sellerId,  List<AnnonceMedia> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Annonce() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.sellerId,_that.medias,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Annonce implements Annonce {
  const _Annonce({required this.id, required this.title, this.description, required this.breed, this.gender, this.ageMonths, this.effectiveAgeMonths, this.weightKg, this.dentition, this.onssaTagNumber, required this.price, this.priceType, required this.priceNegotiable, this.headCount, required this.region, this.addressLabel, this.latitude, this.longitude, this.distanceKm, required this.deliveryAvailable, this.deliveryPrice, this.boardingAvailable, this.boardingDailyPrice, required this.status, required this.isTopLot, this.topLotExpiresAt, this.viewsCount, this.favoritesCount, this.expiresAt, required this.sellerId, required final  List<AnnonceMedia> medias, this.createdAt, this.updatedAt}): _medias = medias;
  

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  AnimalBreed breed;
@override final  AnimalGender? gender;
@override final  int? ageMonths;
@override final  int? effectiveAgeMonths;
@override final  double? weightKg;
@override final  AnimalDentition? dentition;
@override final  String? onssaTagNumber;
@override final  double price;
@override final  PriceType? priceType;
@override final  bool priceNegotiable;
@override final  int? headCount;
@override final  String region;
@override final  String? addressLabel;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
@override final  bool deliveryAvailable;
@override final  double? deliveryPrice;
@override final  bool? boardingAvailable;
@override final  double? boardingDailyPrice;
@override final  AnnonceStatus status;
@override final  bool isTopLot;
@override final  DateTime? topLotExpiresAt;
@override final  int? viewsCount;
@override final  int? favoritesCount;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Annonce&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dentition, dentition) || other.dentition == dentition)&&(identical(other.onssaTagNumber, onssaTagNumber) || other.onssaTagNumber == onssaTagNumber)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.headCount, headCount) || other.headCount == headCount)&&(identical(other.region, region) || other.region == region)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.boardingAvailable, boardingAvailable) || other.boardingAvailable == boardingAvailable)&&(identical(other.boardingDailyPrice, boardingDailyPrice) || other.boardingDailyPrice == boardingDailyPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&const DeepCollectionEquality().equals(other._medias, _medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,gender,ageMonths,effectiveAgeMonths,weightKg,dentition,onssaTagNumber,price,priceType,priceNegotiable,headCount,region,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,boardingAvailable,boardingDailyPrice,status,isTopLot,topLotExpiresAt,viewsCount,favoritesCount,expiresAt,sellerId,const DeepCollectionEquality().hash(_medias),createdAt,updatedAt]);

@override
String toString() {
  return 'Annonce(id: $id, title: $title, description: $description, breed: $breed, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, weightKg: $weightKg, dentition: $dentition, onssaTagNumber: $onssaTagNumber, price: $price, priceType: $priceType, priceNegotiable: $priceNegotiable, headCount: $headCount, region: $region, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, boardingAvailable: $boardingAvailable, boardingDailyPrice: $boardingDailyPrice, status: $status, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, viewsCount: $viewsCount, favoritesCount: $favoritesCount, expiresAt: $expiresAt, sellerId: $sellerId, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnnonceCopyWith<$Res> implements $AnnonceCopyWith<$Res> {
  factory _$AnnonceCopyWith(_Annonce value, $Res Function(_Annonce) _then) = __$AnnonceCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, AnimalBreed breed, AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, double? weightKg, AnimalDentition? dentition, String? onssaTagNumber, double price, PriceType? priceType, bool priceNegotiable, int? headCount, String region, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool? boardingAvailable, double? boardingDailyPrice, AnnonceStatus status, bool isTopLot, DateTime? topLotExpiresAt, int? viewsCount, int? favoritesCount, DateTime? expiresAt, String sellerId, List<AnnonceMedia> medias, DateTime? createdAt, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? weightKg = freezed,Object? dentition = freezed,Object? onssaTagNumber = freezed,Object? price = null,Object? priceType = freezed,Object? priceNegotiable = null,Object? headCount = freezed,Object? region = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? boardingAvailable = freezed,Object? boardingDailyPrice = freezed,Object? status = null,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? viewsCount = freezed,Object? favoritesCount = freezed,Object? expiresAt = freezed,Object? sellerId = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Annonce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,breed: null == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as AnimalBreed,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as AnimalGender?,ageMonths: freezed == ageMonths ? _self.ageMonths : ageMonths // ignore: cast_nullable_to_non_nullable
as int?,effectiveAgeMonths: freezed == effectiveAgeMonths ? _self.effectiveAgeMonths : effectiveAgeMonths // ignore: cast_nullable_to_non_nullable
as int?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,dentition: freezed == dentition ? _self.dentition : dentition // ignore: cast_nullable_to_non_nullable
as AnimalDentition?,onssaTagNumber: freezed == onssaTagNumber ? _self.onssaTagNumber : onssaTagNumber // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as PriceType?,priceNegotiable: null == priceNegotiable ? _self.priceNegotiable : priceNegotiable // ignore: cast_nullable_to_non_nullable
as bool,headCount: freezed == headCount ? _self.headCount : headCount // ignore: cast_nullable_to_non_nullable
as int?,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,addressLabel: freezed == addressLabel ? _self.addressLabel : addressLabel // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,deliveryAvailable: null == deliveryAvailable ? _self.deliveryAvailable : deliveryAvailable // ignore: cast_nullable_to_non_nullable
as bool,deliveryPrice: freezed == deliveryPrice ? _self.deliveryPrice : deliveryPrice // ignore: cast_nullable_to_non_nullable
as double?,boardingAvailable: freezed == boardingAvailable ? _self.boardingAvailable : boardingAvailable // ignore: cast_nullable_to_non_nullable
as bool?,boardingDailyPrice: freezed == boardingDailyPrice ? _self.boardingDailyPrice : boardingDailyPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,favoritesCount: freezed == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMedia>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
