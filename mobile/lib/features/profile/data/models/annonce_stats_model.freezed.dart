// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceStatsModel {

@JsonKey(name: 'annonce_id') String get annonceId; String get title; String get status; double get price;@JsonKey(name: 'view_count') int get viewCount;@JsonKey(name: 'favorites_count') int get favoritesCount;@JsonKey(name: 'contacts_count') int get contactsCount;@JsonKey(name: 'sold_at') DateTime? get soldAt;@JsonKey(name: 'main_photo_url') String? get mainPhotoUrl;
/// Create a copy of AnnonceStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceStatsModelCopyWith<AnnonceStatsModel> get copyWith => _$AnnonceStatsModelCopyWithImpl<AnnonceStatsModel>(this as AnnonceStatsModel, _$identity);

  /// Serializes this AnnonceStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceStatsModel&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.contactsCount, contactsCount) || other.contactsCount == contactsCount)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.mainPhotoUrl, mainPhotoUrl) || other.mainPhotoUrl == mainPhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,annonceId,title,status,price,viewCount,favoritesCount,contactsCount,soldAt,mainPhotoUrl);

@override
String toString() {
  return 'AnnonceStatsModel(annonceId: $annonceId, title: $title, status: $status, price: $price, viewCount: $viewCount, favoritesCount: $favoritesCount, contactsCount: $contactsCount, soldAt: $soldAt, mainPhotoUrl: $mainPhotoUrl)';
}


}

/// @nodoc
abstract mixin class $AnnonceStatsModelCopyWith<$Res>  {
  factory $AnnonceStatsModelCopyWith(AnnonceStatsModel value, $Res Function(AnnonceStatsModel) _then) = _$AnnonceStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'annonce_id') String annonceId, String title, String status, double price,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'favorites_count') int favoritesCount,@JsonKey(name: 'contacts_count') int contactsCount,@JsonKey(name: 'sold_at') DateTime? soldAt,@JsonKey(name: 'main_photo_url') String? mainPhotoUrl
});




}
/// @nodoc
class _$AnnonceStatsModelCopyWithImpl<$Res>
    implements $AnnonceStatsModelCopyWith<$Res> {
  _$AnnonceStatsModelCopyWithImpl(this._self, this._then);

  final AnnonceStatsModel _self;
  final $Res Function(AnnonceStatsModel) _then;

/// Create a copy of AnnonceStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annonceId = null,Object? title = null,Object? status = null,Object? price = null,Object? viewCount = null,Object? favoritesCount = null,Object? contactsCount = null,Object? soldAt = freezed,Object? mainPhotoUrl = freezed,}) {
  return _then(_self.copyWith(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,favoritesCount: null == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int,contactsCount: null == contactsCount ? _self.contactsCount : contactsCount // ignore: cast_nullable_to_non_nullable
as int,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mainPhotoUrl: freezed == mainPhotoUrl ? _self.mainPhotoUrl : mainPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceStatsModel].
extension AnnonceStatsModelPatterns on AnnonceStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'annonce_id')  String annonceId,  String title,  String status,  double price, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'favorites_count')  int favoritesCount, @JsonKey(name: 'contacts_count')  int contactsCount, @JsonKey(name: 'sold_at')  DateTime? soldAt, @JsonKey(name: 'main_photo_url')  String? mainPhotoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceStatsModel() when $default != null:
return $default(_that.annonceId,_that.title,_that.status,_that.price,_that.viewCount,_that.favoritesCount,_that.contactsCount,_that.soldAt,_that.mainPhotoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'annonce_id')  String annonceId,  String title,  String status,  double price, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'favorites_count')  int favoritesCount, @JsonKey(name: 'contacts_count')  int contactsCount, @JsonKey(name: 'sold_at')  DateTime? soldAt, @JsonKey(name: 'main_photo_url')  String? mainPhotoUrl)  $default,) {final _that = this;
switch (_that) {
case _AnnonceStatsModel():
return $default(_that.annonceId,_that.title,_that.status,_that.price,_that.viewCount,_that.favoritesCount,_that.contactsCount,_that.soldAt,_that.mainPhotoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'annonce_id')  String annonceId,  String title,  String status,  double price, @JsonKey(name: 'view_count')  int viewCount, @JsonKey(name: 'favorites_count')  int favoritesCount, @JsonKey(name: 'contacts_count')  int contactsCount, @JsonKey(name: 'sold_at')  DateTime? soldAt, @JsonKey(name: 'main_photo_url')  String? mainPhotoUrl)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceStatsModel() when $default != null:
return $default(_that.annonceId,_that.title,_that.status,_that.price,_that.viewCount,_that.favoritesCount,_that.contactsCount,_that.soldAt,_that.mainPhotoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceStatsModel extends AnnonceStatsModel {
  const _AnnonceStatsModel({@JsonKey(name: 'annonce_id') required this.annonceId, required this.title, required this.status, required this.price, @JsonKey(name: 'view_count') required this.viewCount, @JsonKey(name: 'favorites_count') required this.favoritesCount, @JsonKey(name: 'contacts_count') required this.contactsCount, @JsonKey(name: 'sold_at') this.soldAt, @JsonKey(name: 'main_photo_url') this.mainPhotoUrl}): super._();
  factory _AnnonceStatsModel.fromJson(Map<String, dynamic> json) => _$AnnonceStatsModelFromJson(json);

@override@JsonKey(name: 'annonce_id') final  String annonceId;
@override final  String title;
@override final  String status;
@override final  double price;
@override@JsonKey(name: 'view_count') final  int viewCount;
@override@JsonKey(name: 'favorites_count') final  int favoritesCount;
@override@JsonKey(name: 'contacts_count') final  int contactsCount;
@override@JsonKey(name: 'sold_at') final  DateTime? soldAt;
@override@JsonKey(name: 'main_photo_url') final  String? mainPhotoUrl;

/// Create a copy of AnnonceStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceStatsModelCopyWith<_AnnonceStatsModel> get copyWith => __$AnnonceStatsModelCopyWithImpl<_AnnonceStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceStatsModel&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.contactsCount, contactsCount) || other.contactsCount == contactsCount)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.mainPhotoUrl, mainPhotoUrl) || other.mainPhotoUrl == mainPhotoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,annonceId,title,status,price,viewCount,favoritesCount,contactsCount,soldAt,mainPhotoUrl);

@override
String toString() {
  return 'AnnonceStatsModel(annonceId: $annonceId, title: $title, status: $status, price: $price, viewCount: $viewCount, favoritesCount: $favoritesCount, contactsCount: $contactsCount, soldAt: $soldAt, mainPhotoUrl: $mainPhotoUrl)';
}


}

/// @nodoc
abstract mixin class _$AnnonceStatsModelCopyWith<$Res> implements $AnnonceStatsModelCopyWith<$Res> {
  factory _$AnnonceStatsModelCopyWith(_AnnonceStatsModel value, $Res Function(_AnnonceStatsModel) _then) = __$AnnonceStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'annonce_id') String annonceId, String title, String status, double price,@JsonKey(name: 'view_count') int viewCount,@JsonKey(name: 'favorites_count') int favoritesCount,@JsonKey(name: 'contacts_count') int contactsCount,@JsonKey(name: 'sold_at') DateTime? soldAt,@JsonKey(name: 'main_photo_url') String? mainPhotoUrl
});




}
/// @nodoc
class __$AnnonceStatsModelCopyWithImpl<$Res>
    implements _$AnnonceStatsModelCopyWith<$Res> {
  __$AnnonceStatsModelCopyWithImpl(this._self, this._then);

  final _AnnonceStatsModel _self;
  final $Res Function(_AnnonceStatsModel) _then;

/// Create a copy of AnnonceStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annonceId = null,Object? title = null,Object? status = null,Object? price = null,Object? viewCount = null,Object? favoritesCount = null,Object? contactsCount = null,Object? soldAt = freezed,Object? mainPhotoUrl = freezed,}) {
  return _then(_AnnonceStatsModel(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,favoritesCount: null == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int,contactsCount: null == contactsCount ? _self.contactsCount : contactsCount // ignore: cast_nullable_to_non_nullable
as int,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mainPhotoUrl: freezed == mainPhotoUrl ? _self.mainPhotoUrl : mainPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
