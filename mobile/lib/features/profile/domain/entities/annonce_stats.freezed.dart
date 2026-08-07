// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnonceStats {

 String get annonceId; String get title; AnnonceStatus get status; double get price; int get viewCount; int get favoritesCount; int get contactsCount; DateTime? get soldAt; String? get mainPhotoUrl;
/// Create a copy of AnnonceStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceStatsCopyWith<AnnonceStats> get copyWith => _$AnnonceStatsCopyWithImpl<AnnonceStats>(this as AnnonceStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceStats&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.contactsCount, contactsCount) || other.contactsCount == contactsCount)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.mainPhotoUrl, mainPhotoUrl) || other.mainPhotoUrl == mainPhotoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,annonceId,title,status,price,viewCount,favoritesCount,contactsCount,soldAt,mainPhotoUrl);

@override
String toString() {
  return 'AnnonceStats(annonceId: $annonceId, title: $title, status: $status, price: $price, viewCount: $viewCount, favoritesCount: $favoritesCount, contactsCount: $contactsCount, soldAt: $soldAt, mainPhotoUrl: $mainPhotoUrl)';
}


}

/// @nodoc
abstract mixin class $AnnonceStatsCopyWith<$Res>  {
  factory $AnnonceStatsCopyWith(AnnonceStats value, $Res Function(AnnonceStats) _then) = _$AnnonceStatsCopyWithImpl;
@useResult
$Res call({
 String annonceId, String title, AnnonceStatus status, double price, int viewCount, int favoritesCount, int contactsCount, DateTime? soldAt, String? mainPhotoUrl
});




}
/// @nodoc
class _$AnnonceStatsCopyWithImpl<$Res>
    implements $AnnonceStatsCopyWith<$Res> {
  _$AnnonceStatsCopyWithImpl(this._self, this._then);

  final AnnonceStats _self;
  final $Res Function(AnnonceStats) _then;

/// Create a copy of AnnonceStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annonceId = null,Object? title = null,Object? status = null,Object? price = null,Object? viewCount = null,Object? favoritesCount = null,Object? contactsCount = null,Object? soldAt = freezed,Object? mainPhotoUrl = freezed,}) {
  return _then(_self.copyWith(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,favoritesCount: null == favoritesCount ? _self.favoritesCount : favoritesCount // ignore: cast_nullable_to_non_nullable
as int,contactsCount: null == contactsCount ? _self.contactsCount : contactsCount // ignore: cast_nullable_to_non_nullable
as int,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mainPhotoUrl: freezed == mainPhotoUrl ? _self.mainPhotoUrl : mainPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceStats].
extension AnnonceStatsPatterns on AnnonceStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceStats value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceStats value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String annonceId,  String title,  AnnonceStatus status,  double price,  int viewCount,  int favoritesCount,  int contactsCount,  DateTime? soldAt,  String? mainPhotoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceStats() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String annonceId,  String title,  AnnonceStatus status,  double price,  int viewCount,  int favoritesCount,  int contactsCount,  DateTime? soldAt,  String? mainPhotoUrl)  $default,) {final _that = this;
switch (_that) {
case _AnnonceStats():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String annonceId,  String title,  AnnonceStatus status,  double price,  int viewCount,  int favoritesCount,  int contactsCount,  DateTime? soldAt,  String? mainPhotoUrl)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceStats() when $default != null:
return $default(_that.annonceId,_that.title,_that.status,_that.price,_that.viewCount,_that.favoritesCount,_that.contactsCount,_that.soldAt,_that.mainPhotoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AnnonceStats implements AnnonceStats {
  const _AnnonceStats({required this.annonceId, required this.title, required this.status, required this.price, required this.viewCount, required this.favoritesCount, required this.contactsCount, this.soldAt, this.mainPhotoUrl});
  

@override final  String annonceId;
@override final  String title;
@override final  AnnonceStatus status;
@override final  double price;
@override final  int viewCount;
@override final  int favoritesCount;
@override final  int contactsCount;
@override final  DateTime? soldAt;
@override final  String? mainPhotoUrl;

/// Create a copy of AnnonceStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceStatsCopyWith<_AnnonceStats> get copyWith => __$AnnonceStatsCopyWithImpl<_AnnonceStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceStats&&(identical(other.annonceId, annonceId) || other.annonceId == annonceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.favoritesCount, favoritesCount) || other.favoritesCount == favoritesCount)&&(identical(other.contactsCount, contactsCount) || other.contactsCount == contactsCount)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&(identical(other.mainPhotoUrl, mainPhotoUrl) || other.mainPhotoUrl == mainPhotoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,annonceId,title,status,price,viewCount,favoritesCount,contactsCount,soldAt,mainPhotoUrl);

@override
String toString() {
  return 'AnnonceStats(annonceId: $annonceId, title: $title, status: $status, price: $price, viewCount: $viewCount, favoritesCount: $favoritesCount, contactsCount: $contactsCount, soldAt: $soldAt, mainPhotoUrl: $mainPhotoUrl)';
}


}

/// @nodoc
abstract mixin class _$AnnonceStatsCopyWith<$Res> implements $AnnonceStatsCopyWith<$Res> {
  factory _$AnnonceStatsCopyWith(_AnnonceStats value, $Res Function(_AnnonceStats) _then) = __$AnnonceStatsCopyWithImpl;
@override @useResult
$Res call({
 String annonceId, String title, AnnonceStatus status, double price, int viewCount, int favoritesCount, int contactsCount, DateTime? soldAt, String? mainPhotoUrl
});




}
/// @nodoc
class __$AnnonceStatsCopyWithImpl<$Res>
    implements _$AnnonceStatsCopyWith<$Res> {
  __$AnnonceStatsCopyWithImpl(this._self, this._then);

  final _AnnonceStats _self;
  final $Res Function(_AnnonceStats) _then;

/// Create a copy of AnnonceStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annonceId = null,Object? title = null,Object? status = null,Object? price = null,Object? viewCount = null,Object? favoritesCount = null,Object? contactsCount = null,Object? soldAt = freezed,Object? mainPhotoUrl = freezed,}) {
  return _then(_AnnonceStats(
annonceId: null == annonceId ? _self.annonceId : annonceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnnonceStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
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
