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
mixin _$SellerSummaryModel {

 String get id; String? get fullName; String? get avatarUrl; String? get region;
/// Create a copy of SellerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerSummaryModelCopyWith<SellerSummaryModel> get copyWith => _$SellerSummaryModelCopyWithImpl<SellerSummaryModel>(this as SellerSummaryModel, _$identity);

  /// Serializes this SellerSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,region);

@override
String toString() {
  return 'SellerSummaryModel(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, region: $region)';
}


}

/// @nodoc
abstract mixin class $SellerSummaryModelCopyWith<$Res>  {
  factory $SellerSummaryModelCopyWith(SellerSummaryModel value, $Res Function(SellerSummaryModel) _then) = _$SellerSummaryModelCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String? avatarUrl, String? region
});




}
/// @nodoc
class _$SellerSummaryModelCopyWithImpl<$Res>
    implements $SellerSummaryModelCopyWith<$Res> {
  _$SellerSummaryModelCopyWithImpl(this._self, this._then);

  final SellerSummaryModel _self;
  final $Res Function(SellerSummaryModel) _then;

/// Create a copy of SellerSummaryModel
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


/// Adds pattern-matching-related methods to [SellerSummaryModel].
extension SellerSummaryModelPatterns on SellerSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerSummaryModel() when $default != null:
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
case _SellerSummaryModel() when $default != null:
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
case _SellerSummaryModel():
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
case _SellerSummaryModel() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerSummaryModel extends SellerSummaryModel {
  const _SellerSummaryModel({required this.id, this.fullName, this.avatarUrl, this.region}): super._();
  factory _SellerSummaryModel.fromJson(Map<String, dynamic> json) => _$SellerSummaryModelFromJson(json);

@override final  String id;
@override final  String? fullName;
@override final  String? avatarUrl;
@override final  String? region;

/// Create a copy of SellerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerSummaryModelCopyWith<_SellerSummaryModel> get copyWith => __$SellerSummaryModelCopyWithImpl<_SellerSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,region);

@override
String toString() {
  return 'SellerSummaryModel(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, region: $region)';
}


}

/// @nodoc
abstract mixin class _$SellerSummaryModelCopyWith<$Res> implements $SellerSummaryModelCopyWith<$Res> {
  factory _$SellerSummaryModelCopyWith(_SellerSummaryModel value, $Res Function(_SellerSummaryModel) _then) = __$SellerSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String? avatarUrl, String? region
});




}
/// @nodoc
class __$SellerSummaryModelCopyWithImpl<$Res>
    implements _$SellerSummaryModelCopyWith<$Res> {
  __$SellerSummaryModelCopyWithImpl(this._self, this._then);

  final _SellerSummaryModel _self;
  final $Res Function(_SellerSummaryModel) _then;

/// Create a copy of SellerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? avatarUrl = freezed,Object? region = freezed,}) {
  return _then(_SellerSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnnonceModel {

 String get id; String get title; String? get description;@JsonKey(fromJson: AnimalBreed.fromJson) AnimalBreed get breed;@JsonKey(fromJson: AnimalGender.fromJson) AnimalGender? get gender; int? get ageMonths; int? get effectiveAgeMonths; double? get weightKg;@JsonKey(fromJson: AnimalDentition.fromJson) AnimalDentition? get dentition; String? get onssaTagNumber; double get price;@JsonKey(fromJson: PriceType.fromJson) PriceType? get priceType; bool get priceNegotiable; int? get headCount; String get region; String? get addressLabel; double? get latitude; double? get longitude; double? get distanceKm; bool get deliveryAvailable; double? get deliveryPrice; bool get boardingAvailable; double? get boardingDailyPrice; AnnonceStatus get status; bool get isTopLot; DateTime? get topLotExpiresAt; int? get viewsCount; int? get favoritesCount; DateTime? get expiresAt; SellerSummaryModel get seller; List<AnnonceMediaModel> get medias; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceModelCopyWith<AnnonceModel> get copyWith => _$AnnonceModelCopyWithImpl<AnnonceModel>(this as AnnonceModel, _$identity);

  /// Serializes this AnnonceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dentition, dentition) || other.dentition == dentition)&&(identical(other.onssaTagNumber, onssaTagNumber) || other.onssaTagNumber == onssaTagNumber)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.headCount, headCount) || other.headCount == headCount)&&(identical(other.region, region) || other.region == region)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.boardingAvailable, boardingAvailable) || other.boardingAvailable == boardingAvailable)&&(identical(other.boardingDailyPrice, boardingDailyPrice) || other.boardingDailyPrice == boardingDailyPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other.medias, medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,gender,ageMonths,effectiveAgeMonths,weightKg,dentition,onssaTagNumber,price,priceType,priceNegotiable,headCount,region,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,boardingAvailable,boardingDailyPrice,status,isTopLot,topLotExpiresAt,viewsCount,favoritesCount,expiresAt,seller,const DeepCollectionEquality().hash(medias),createdAt,updatedAt]);

@override
String toString() {
  return 'AnnonceModel(id: $id, title: $title, description: $description, breed: $breed, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, weightKg: $weightKg, dentition: $dentition, onssaTagNumber: $onssaTagNumber, price: $price, priceType: $priceType, priceNegotiable: $priceNegotiable, headCount: $headCount, region: $region, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, boardingAvailable: $boardingAvailable, boardingDailyPrice: $boardingDailyPrice, status: $status, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, viewsCount: $viewsCount, favoritesCount: $favoritesCount, expiresAt: $expiresAt, seller: $seller, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnnonceModelCopyWith<$Res>  {
  factory $AnnonceModelCopyWith(AnnonceModel value, $Res Function(AnnonceModel) _then) = _$AnnonceModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@JsonKey(fromJson: AnimalBreed.fromJson) AnimalBreed breed,@JsonKey(fromJson: AnimalGender.fromJson) AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, double? weightKg,@JsonKey(fromJson: AnimalDentition.fromJson) AnimalDentition? dentition, String? onssaTagNumber, double price,@JsonKey(fromJson: PriceType.fromJson) PriceType? priceType, bool priceNegotiable, int? headCount, String region, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool boardingAvailable, double? boardingDailyPrice, AnnonceStatus status, bool isTopLot, DateTime? topLotExpiresAt, int? viewsCount, int? favoritesCount, DateTime? expiresAt, SellerSummaryModel seller, List<AnnonceMediaModel> medias, DateTime? createdAt, DateTime? updatedAt
});


$SellerSummaryModelCopyWith<$Res> get seller;

}
/// @nodoc
class _$AnnonceModelCopyWithImpl<$Res>
    implements $AnnonceModelCopyWith<$Res> {
  _$AnnonceModelCopyWithImpl(this._self, this._then);

  final AnnonceModel _self;
  final $Res Function(AnnonceModel) _then;

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? weightKg = freezed,Object? dentition = freezed,Object? onssaTagNumber = freezed,Object? price = null,Object? priceType = freezed,Object? priceNegotiable = null,Object? headCount = freezed,Object? region = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? boardingAvailable = null,Object? boardingDailyPrice = freezed,Object? status = null,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? viewsCount = freezed,Object? favoritesCount = freezed,Object? expiresAt = freezed,Object? seller = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
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
as double?,boardingAvailable: null == boardingAvailable ? _self.boardingAvailable : boardingAvailable // ignore: cast_nullable_to_non_nullable
as bool,boardingDailyPrice: freezed == boardingDailyPrice ? _self.boardingDailyPrice : boardingDailyPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,favoritesCount: freezed == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerSummaryModel,medias: null == medias ? _self.medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMediaModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerSummaryModelCopyWith<$Res> get seller {
  
  return $SellerSummaryModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(fromJson: AnimalBreed.fromJson)  AnimalBreed breed, @JsonKey(fromJson: AnimalGender.fromJson)  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg, @JsonKey(fromJson: AnimalDentition.fromJson)  AnimalDentition? dentition,  String? onssaTagNumber,  double price, @JsonKey(fromJson: PriceType.fromJson)  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  SellerSummaryModel seller,  List<AnnonceMediaModel> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.seller,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(fromJson: AnimalBreed.fromJson)  AnimalBreed breed, @JsonKey(fromJson: AnimalGender.fromJson)  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg, @JsonKey(fromJson: AnimalDentition.fromJson)  AnimalDentition? dentition,  String? onssaTagNumber,  double price, @JsonKey(fromJson: PriceType.fromJson)  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  SellerSummaryModel seller,  List<AnnonceMediaModel> medias,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AnnonceModel():
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.seller,_that.medias,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description, @JsonKey(fromJson: AnimalBreed.fromJson)  AnimalBreed breed, @JsonKey(fromJson: AnimalGender.fromJson)  AnimalGender? gender,  int? ageMonths,  int? effectiveAgeMonths,  double? weightKg, @JsonKey(fromJson: AnimalDentition.fromJson)  AnimalDentition? dentition,  String? onssaTagNumber,  double price, @JsonKey(fromJson: PriceType.fromJson)  PriceType? priceType,  bool priceNegotiable,  int? headCount,  String region,  String? addressLabel,  double? latitude,  double? longitude,  double? distanceKm,  bool deliveryAvailable,  double? deliveryPrice,  bool boardingAvailable,  double? boardingDailyPrice,  AnnonceStatus status,  bool isTopLot,  DateTime? topLotExpiresAt,  int? viewsCount,  int? favoritesCount,  DateTime? expiresAt,  SellerSummaryModel seller,  List<AnnonceMediaModel> medias,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.breed,_that.gender,_that.ageMonths,_that.effectiveAgeMonths,_that.weightKg,_that.dentition,_that.onssaTagNumber,_that.price,_that.priceType,_that.priceNegotiable,_that.headCount,_that.region,_that.addressLabel,_that.latitude,_that.longitude,_that.distanceKm,_that.deliveryAvailable,_that.deliveryPrice,_that.boardingAvailable,_that.boardingDailyPrice,_that.status,_that.isTopLot,_that.topLotExpiresAt,_that.viewsCount,_that.favoritesCount,_that.expiresAt,_that.seller,_that.medias,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceModel extends AnnonceModel {
  const _AnnonceModel({required this.id, required this.title, this.description, @JsonKey(fromJson: AnimalBreed.fromJson) required this.breed, @JsonKey(fromJson: AnimalGender.fromJson) this.gender, this.ageMonths, this.effectiveAgeMonths, this.weightKg, @JsonKey(fromJson: AnimalDentition.fromJson) this.dentition, this.onssaTagNumber, required this.price, @JsonKey(fromJson: PriceType.fromJson) this.priceType, this.priceNegotiable = false, this.headCount, required this.region, this.addressLabel, this.latitude, this.longitude, this.distanceKm, this.deliveryAvailable = false, this.deliveryPrice, this.boardingAvailable = false, this.boardingDailyPrice, required this.status, this.isTopLot = false, this.topLotExpiresAt, this.viewsCount, this.favoritesCount, this.expiresAt, required this.seller, final  List<AnnonceMediaModel> medias = const [], this.createdAt, this.updatedAt}): _medias = medias,super._();
  factory _AnnonceModel.fromJson(Map<String, dynamic> json) => _$AnnonceModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey(fromJson: AnimalBreed.fromJson) final  AnimalBreed breed;
@override@JsonKey(fromJson: AnimalGender.fromJson) final  AnimalGender? gender;
@override final  int? ageMonths;
@override final  int? effectiveAgeMonths;
@override final  double? weightKg;
@override@JsonKey(fromJson: AnimalDentition.fromJson) final  AnimalDentition? dentition;
@override final  String? onssaTagNumber;
@override final  double price;
@override@JsonKey(fromJson: PriceType.fromJson) final  PriceType? priceType;
@override@JsonKey() final  bool priceNegotiable;
@override final  int? headCount;
@override final  String region;
@override final  String? addressLabel;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? distanceKm;
@override@JsonKey() final  bool deliveryAvailable;
@override final  double? deliveryPrice;
@override@JsonKey() final  bool boardingAvailable;
@override final  double? boardingDailyPrice;
@override final  AnnonceStatus status;
@override@JsonKey() final  bool isTopLot;
@override final  DateTime? topLotExpiresAt;
@override final  int? viewsCount;
@override final  int? favoritesCount;
@override final  DateTime? expiresAt;
@override final  SellerSummaryModel seller;
 final  List<AnnonceMediaModel> _medias;
@override@JsonKey() List<AnnonceMediaModel> get medias {
  if (_medias is EqualUnmodifiableListView) return _medias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medias);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageMonths, ageMonths) || other.ageMonths == ageMonths)&&(identical(other.effectiveAgeMonths, effectiveAgeMonths) || other.effectiveAgeMonths == effectiveAgeMonths)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.dentition, dentition) || other.dentition == dentition)&&(identical(other.onssaTagNumber, onssaTagNumber) || other.onssaTagNumber == onssaTagNumber)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.priceNegotiable, priceNegotiable) || other.priceNegotiable == priceNegotiable)&&(identical(other.headCount, headCount) || other.headCount == headCount)&&(identical(other.region, region) || other.region == region)&&(identical(other.addressLabel, addressLabel) || other.addressLabel == addressLabel)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.deliveryAvailable, deliveryAvailable) || other.deliveryAvailable == deliveryAvailable)&&(identical(other.deliveryPrice, deliveryPrice) || other.deliveryPrice == deliveryPrice)&&(identical(other.boardingAvailable, boardingAvailable) || other.boardingAvailable == boardingAvailable)&&(identical(other.boardingDailyPrice, boardingDailyPrice) || other.boardingDailyPrice == boardingDailyPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.isTopLot, isTopLot) || other.isTopLot == isTopLot)&&(identical(other.topLotExpiresAt, topLotExpiresAt) || other.topLotExpiresAt == topLotExpiresAt)&&(identical(other.viewsCount, viewsCount) || other.viewsCount == viewsCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other._medias, _medias)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,breed,gender,ageMonths,effectiveAgeMonths,weightKg,dentition,onssaTagNumber,price,priceType,priceNegotiable,headCount,region,addressLabel,latitude,longitude,distanceKm,deliveryAvailable,deliveryPrice,boardingAvailable,boardingDailyPrice,status,isTopLot,topLotExpiresAt,viewsCount,favoritesCount,expiresAt,seller,const DeepCollectionEquality().hash(_medias),createdAt,updatedAt]);

@override
String toString() {
  return 'AnnonceModel(id: $id, title: $title, description: $description, breed: $breed, gender: $gender, ageMonths: $ageMonths, effectiveAgeMonths: $effectiveAgeMonths, weightKg: $weightKg, dentition: $dentition, onssaTagNumber: $onssaTagNumber, price: $price, priceType: $priceType, priceNegotiable: $priceNegotiable, headCount: $headCount, region: $region, addressLabel: $addressLabel, latitude: $latitude, longitude: $longitude, distanceKm: $distanceKm, deliveryAvailable: $deliveryAvailable, deliveryPrice: $deliveryPrice, boardingAvailable: $boardingAvailable, boardingDailyPrice: $boardingDailyPrice, status: $status, isTopLot: $isTopLot, topLotExpiresAt: $topLotExpiresAt, viewsCount: $viewsCount, favoritesCount: $favoritesCount, expiresAt: $expiresAt, seller: $seller, medias: $medias, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnnonceModelCopyWith<$Res> implements $AnnonceModelCopyWith<$Res> {
  factory _$AnnonceModelCopyWith(_AnnonceModel value, $Res Function(_AnnonceModel) _then) = __$AnnonceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@JsonKey(fromJson: AnimalBreed.fromJson) AnimalBreed breed,@JsonKey(fromJson: AnimalGender.fromJson) AnimalGender? gender, int? ageMonths, int? effectiveAgeMonths, double? weightKg,@JsonKey(fromJson: AnimalDentition.fromJson) AnimalDentition? dentition, String? onssaTagNumber, double price,@JsonKey(fromJson: PriceType.fromJson) PriceType? priceType, bool priceNegotiable, int? headCount, String region, String? addressLabel, double? latitude, double? longitude, double? distanceKm, bool deliveryAvailable, double? deliveryPrice, bool boardingAvailable, double? boardingDailyPrice, AnnonceStatus status, bool isTopLot, DateTime? topLotExpiresAt, int? viewsCount, int? favoritesCount, DateTime? expiresAt, SellerSummaryModel seller, List<AnnonceMediaModel> medias, DateTime? createdAt, DateTime? updatedAt
});


@override $SellerSummaryModelCopyWith<$Res> get seller;

}
/// @nodoc
class __$AnnonceModelCopyWithImpl<$Res>
    implements _$AnnonceModelCopyWith<$Res> {
  __$AnnonceModelCopyWithImpl(this._self, this._then);

  final _AnnonceModel _self;
  final $Res Function(_AnnonceModel) _then;

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? breed = null,Object? gender = freezed,Object? ageMonths = freezed,Object? effectiveAgeMonths = freezed,Object? weightKg = freezed,Object? dentition = freezed,Object? onssaTagNumber = freezed,Object? price = null,Object? priceType = freezed,Object? priceNegotiable = null,Object? headCount = freezed,Object? region = null,Object? addressLabel = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? distanceKm = freezed,Object? deliveryAvailable = null,Object? deliveryPrice = freezed,Object? boardingAvailable = null,Object? boardingDailyPrice = freezed,Object? status = null,Object? isTopLot = null,Object? topLotExpiresAt = freezed,Object? viewsCount = freezed,Object? favoritesCount = freezed,Object? expiresAt = freezed,Object? seller = null,Object? medias = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AnnonceModel(
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
as double?,boardingAvailable: null == boardingAvailable ? _self.boardingAvailable : boardingAvailable // ignore: cast_nullable_to_non_nullable
as bool,boardingDailyPrice: freezed == boardingDailyPrice ? _self.boardingDailyPrice : boardingDailyPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,isTopLot: null == isTopLot ? _self.isTopLot : isTopLot // ignore: cast_nullable_to_non_nullable
as bool,topLotExpiresAt: freezed == topLotExpiresAt ? _self.topLotExpiresAt : topLotExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,viewsCount: freezed == viewsCount ? _self.viewsCount : viewsCount // ignore: cast_nullable_to_non_nullable
as int?,favoritesCount: freezed == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as SellerSummaryModel,medias: null == medias ? _self._medias : medias // ignore: cast_nullable_to_non_nullable
as List<AnnonceMediaModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AnnonceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerSummaryModelCopyWith<$Res> get seller {
  
  return $SellerSummaryModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on
