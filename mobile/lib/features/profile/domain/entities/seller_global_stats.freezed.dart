// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_global_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerGlobalStats {

 int get totalViews; int get totalFavorites; int get totalContacts; double get contactRate; int get totalAnnonces; int get activeAnnonces; int get soldAnnonces;
/// Create a copy of SellerGlobalStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerGlobalStatsCopyWith<SellerGlobalStats> get copyWith => _$SellerGlobalStatsCopyWithImpl<SellerGlobalStats>(this as SellerGlobalStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerGlobalStats&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalContacts, totalContacts) || other.totalContacts == totalContacts)&&(identical(other.contactRate, contactRate) || other.contactRate == contactRate)&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces));
}


@override
int get hashCode => Object.hash(runtimeType,totalViews,totalFavorites,totalContacts,contactRate,totalAnnonces,activeAnnonces,soldAnnonces);

@override
String toString() {
  return 'SellerGlobalStats(totalViews: $totalViews, totalFavorites: $totalFavorites, totalContacts: $totalContacts, contactRate: $contactRate, totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces)';
}


}

/// @nodoc
abstract mixin class $SellerGlobalStatsCopyWith<$Res>  {
  factory $SellerGlobalStatsCopyWith(SellerGlobalStats value, $Res Function(SellerGlobalStats) _then) = _$SellerGlobalStatsCopyWithImpl;
@useResult
$Res call({
 int totalViews, int totalFavorites, int totalContacts, double contactRate, int totalAnnonces, int activeAnnonces, int soldAnnonces
});




}
/// @nodoc
class _$SellerGlobalStatsCopyWithImpl<$Res>
    implements $SellerGlobalStatsCopyWith<$Res> {
  _$SellerGlobalStatsCopyWithImpl(this._self, this._then);

  final SellerGlobalStats _self;
  final $Res Function(SellerGlobalStats) _then;

/// Create a copy of SellerGlobalStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalViews = null,Object? totalFavorites = null,Object? totalContacts = null,Object? contactRate = null,Object? totalAnnonces = null,Object? activeAnnonces = null,Object? soldAnnonces = null,}) {
  return _then(_self.copyWith(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,totalContacts: null == totalContacts ? _self.totalContacts : totalContacts // ignore: cast_nullable_to_non_nullable
as int,contactRate: null == contactRate ? _self.contactRate : contactRate // ignore: cast_nullable_to_non_nullable
as double,totalAnnonces: null == totalAnnonces ? _self.totalAnnonces : totalAnnonces // ignore: cast_nullable_to_non_nullable
as int,activeAnnonces: null == activeAnnonces ? _self.activeAnnonces : activeAnnonces // ignore: cast_nullable_to_non_nullable
as int,soldAnnonces: null == soldAnnonces ? _self.soldAnnonces : soldAnnonces // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerGlobalStats].
extension SellerGlobalStatsPatterns on SellerGlobalStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerGlobalStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerGlobalStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerGlobalStats value)  $default,){
final _that = this;
switch (_that) {
case _SellerGlobalStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerGlobalStats value)?  $default,){
final _that = this;
switch (_that) {
case _SellerGlobalStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalViews,  int totalFavorites,  int totalContacts,  double contactRate,  int totalAnnonces,  int activeAnnonces,  int soldAnnonces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerGlobalStats() when $default != null:
return $default(_that.totalViews,_that.totalFavorites,_that.totalContacts,_that.contactRate,_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalViews,  int totalFavorites,  int totalContacts,  double contactRate,  int totalAnnonces,  int activeAnnonces,  int soldAnnonces)  $default,) {final _that = this;
switch (_that) {
case _SellerGlobalStats():
return $default(_that.totalViews,_that.totalFavorites,_that.totalContacts,_that.contactRate,_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalViews,  int totalFavorites,  int totalContacts,  double contactRate,  int totalAnnonces,  int activeAnnonces,  int soldAnnonces)?  $default,) {final _that = this;
switch (_that) {
case _SellerGlobalStats() when $default != null:
return $default(_that.totalViews,_that.totalFavorites,_that.totalContacts,_that.contactRate,_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces);case _:
  return null;

}
}

}

/// @nodoc


class _SellerGlobalStats implements SellerGlobalStats {
  const _SellerGlobalStats({required this.totalViews, required this.totalFavorites, required this.totalContacts, required this.contactRate, required this.totalAnnonces, required this.activeAnnonces, required this.soldAnnonces});
  

@override final  int totalViews;
@override final  int totalFavorites;
@override final  int totalContacts;
@override final  double contactRate;
@override final  int totalAnnonces;
@override final  int activeAnnonces;
@override final  int soldAnnonces;

/// Create a copy of SellerGlobalStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerGlobalStatsCopyWith<_SellerGlobalStats> get copyWith => __$SellerGlobalStatsCopyWithImpl<_SellerGlobalStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerGlobalStats&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalContacts, totalContacts) || other.totalContacts == totalContacts)&&(identical(other.contactRate, contactRate) || other.contactRate == contactRate)&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces));
}


@override
int get hashCode => Object.hash(runtimeType,totalViews,totalFavorites,totalContacts,contactRate,totalAnnonces,activeAnnonces,soldAnnonces);

@override
String toString() {
  return 'SellerGlobalStats(totalViews: $totalViews, totalFavorites: $totalFavorites, totalContacts: $totalContacts, contactRate: $contactRate, totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces)';
}


}

/// @nodoc
abstract mixin class _$SellerGlobalStatsCopyWith<$Res> implements $SellerGlobalStatsCopyWith<$Res> {
  factory _$SellerGlobalStatsCopyWith(_SellerGlobalStats value, $Res Function(_SellerGlobalStats) _then) = __$SellerGlobalStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalViews, int totalFavorites, int totalContacts, double contactRate, int totalAnnonces, int activeAnnonces, int soldAnnonces
});




}
/// @nodoc
class __$SellerGlobalStatsCopyWithImpl<$Res>
    implements _$SellerGlobalStatsCopyWith<$Res> {
  __$SellerGlobalStatsCopyWithImpl(this._self, this._then);

  final _SellerGlobalStats _self;
  final $Res Function(_SellerGlobalStats) _then;

/// Create a copy of SellerGlobalStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalViews = null,Object? totalFavorites = null,Object? totalContacts = null,Object? contactRate = null,Object? totalAnnonces = null,Object? activeAnnonces = null,Object? soldAnnonces = null,}) {
  return _then(_SellerGlobalStats(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,totalContacts: null == totalContacts ? _self.totalContacts : totalContacts // ignore: cast_nullable_to_non_nullable
as int,contactRate: null == contactRate ? _self.contactRate : contactRate // ignore: cast_nullable_to_non_nullable
as double,totalAnnonces: null == totalAnnonces ? _self.totalAnnonces : totalAnnonces // ignore: cast_nullable_to_non_nullable
as int,activeAnnonces: null == activeAnnonces ? _self.activeAnnonces : activeAnnonces // ignore: cast_nullable_to_non_nullable
as int,soldAnnonces: null == soldAnnonces ? _self.soldAnnonces : soldAnnonces // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
