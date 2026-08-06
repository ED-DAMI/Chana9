// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_global_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerGlobalStatsModel {

@JsonKey(name: 'total_views') int get totalViews;@JsonKey(name: 'total_favorites') int get totalFavorites;@JsonKey(name: 'total_contacts') int get totalContacts;@JsonKey(name: 'contact_rate') double get contactRate;@JsonKey(name: 'total_annonces') int get totalAnnonces;@JsonKey(name: 'active_annonces') int get activeAnnonces;@JsonKey(name: 'sold_annonces') int get soldAnnonces;
/// Create a copy of SellerGlobalStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerGlobalStatsModelCopyWith<SellerGlobalStatsModel> get copyWith => _$SellerGlobalStatsModelCopyWithImpl<SellerGlobalStatsModel>(this as SellerGlobalStatsModel, _$identity);

  /// Serializes this SellerGlobalStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerGlobalStatsModel&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalContacts, totalContacts) || other.totalContacts == totalContacts)&&(identical(other.contactRate, contactRate) || other.contactRate == contactRate)&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,totalFavorites,totalContacts,contactRate,totalAnnonces,activeAnnonces,soldAnnonces);

@override
String toString() {
  return 'SellerGlobalStatsModel(totalViews: $totalViews, totalFavorites: $totalFavorites, totalContacts: $totalContacts, contactRate: $contactRate, totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces)';
}


}

/// @nodoc
abstract mixin class $SellerGlobalStatsModelCopyWith<$Res>  {
  factory $SellerGlobalStatsModelCopyWith(SellerGlobalStatsModel value, $Res Function(SellerGlobalStatsModel) _then) = _$SellerGlobalStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_views') int totalViews,@JsonKey(name: 'total_favorites') int totalFavorites,@JsonKey(name: 'total_contacts') int totalContacts,@JsonKey(name: 'contact_rate') double contactRate,@JsonKey(name: 'total_annonces') int totalAnnonces,@JsonKey(name: 'active_annonces') int activeAnnonces,@JsonKey(name: 'sold_annonces') int soldAnnonces
});




}
/// @nodoc
class _$SellerGlobalStatsModelCopyWithImpl<$Res>
    implements $SellerGlobalStatsModelCopyWith<$Res> {
  _$SellerGlobalStatsModelCopyWithImpl(this._self, this._then);

  final SellerGlobalStatsModel _self;
  final $Res Function(SellerGlobalStatsModel) _then;

/// Create a copy of SellerGlobalStatsModel
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


/// Adds pattern-matching-related methods to [SellerGlobalStatsModel].
extension SellerGlobalStatsModelPatterns on SellerGlobalStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerGlobalStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerGlobalStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerGlobalStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerGlobalStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerGlobalStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerGlobalStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_favorites')  int totalFavorites, @JsonKey(name: 'total_contacts')  int totalContacts, @JsonKey(name: 'contact_rate')  double contactRate, @JsonKey(name: 'total_annonces')  int totalAnnonces, @JsonKey(name: 'active_annonces')  int activeAnnonces, @JsonKey(name: 'sold_annonces')  int soldAnnonces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerGlobalStatsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_favorites')  int totalFavorites, @JsonKey(name: 'total_contacts')  int totalContacts, @JsonKey(name: 'contact_rate')  double contactRate, @JsonKey(name: 'total_annonces')  int totalAnnonces, @JsonKey(name: 'active_annonces')  int activeAnnonces, @JsonKey(name: 'sold_annonces')  int soldAnnonces)  $default,) {final _that = this;
switch (_that) {
case _SellerGlobalStatsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_views')  int totalViews, @JsonKey(name: 'total_favorites')  int totalFavorites, @JsonKey(name: 'total_contacts')  int totalContacts, @JsonKey(name: 'contact_rate')  double contactRate, @JsonKey(name: 'total_annonces')  int totalAnnonces, @JsonKey(name: 'active_annonces')  int activeAnnonces, @JsonKey(name: 'sold_annonces')  int soldAnnonces)?  $default,) {final _that = this;
switch (_that) {
case _SellerGlobalStatsModel() when $default != null:
return $default(_that.totalViews,_that.totalFavorites,_that.totalContacts,_that.contactRate,_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerGlobalStatsModel extends SellerGlobalStatsModel {
  const _SellerGlobalStatsModel({@JsonKey(name: 'total_views') required this.totalViews, @JsonKey(name: 'total_favorites') required this.totalFavorites, @JsonKey(name: 'total_contacts') required this.totalContacts, @JsonKey(name: 'contact_rate') required this.contactRate, @JsonKey(name: 'total_annonces') required this.totalAnnonces, @JsonKey(name: 'active_annonces') required this.activeAnnonces, @JsonKey(name: 'sold_annonces') required this.soldAnnonces}): super._();
  factory _SellerGlobalStatsModel.fromJson(Map<String, dynamic> json) => _$SellerGlobalStatsModelFromJson(json);

@override@JsonKey(name: 'total_views') final  int totalViews;
@override@JsonKey(name: 'total_favorites') final  int totalFavorites;
@override@JsonKey(name: 'total_contacts') final  int totalContacts;
@override@JsonKey(name: 'contact_rate') final  double contactRate;
@override@JsonKey(name: 'total_annonces') final  int totalAnnonces;
@override@JsonKey(name: 'active_annonces') final  int activeAnnonces;
@override@JsonKey(name: 'sold_annonces') final  int soldAnnonces;

/// Create a copy of SellerGlobalStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerGlobalStatsModelCopyWith<_SellerGlobalStatsModel> get copyWith => __$SellerGlobalStatsModelCopyWithImpl<_SellerGlobalStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerGlobalStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerGlobalStatsModel&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalContacts, totalContacts) || other.totalContacts == totalContacts)&&(identical(other.contactRate, contactRate) || other.contactRate == contactRate)&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,totalFavorites,totalContacts,contactRate,totalAnnonces,activeAnnonces,soldAnnonces);

@override
String toString() {
  return 'SellerGlobalStatsModel(totalViews: $totalViews, totalFavorites: $totalFavorites, totalContacts: $totalContacts, contactRate: $contactRate, totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces)';
}


}

/// @nodoc
abstract mixin class _$SellerGlobalStatsModelCopyWith<$Res> implements $SellerGlobalStatsModelCopyWith<$Res> {
  factory _$SellerGlobalStatsModelCopyWith(_SellerGlobalStatsModel value, $Res Function(_SellerGlobalStatsModel) _then) = __$SellerGlobalStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_views') int totalViews,@JsonKey(name: 'total_favorites') int totalFavorites,@JsonKey(name: 'total_contacts') int totalContacts,@JsonKey(name: 'contact_rate') double contactRate,@JsonKey(name: 'total_annonces') int totalAnnonces,@JsonKey(name: 'active_annonces') int activeAnnonces,@JsonKey(name: 'sold_annonces') int soldAnnonces
});




}
/// @nodoc
class __$SellerGlobalStatsModelCopyWithImpl<$Res>
    implements _$SellerGlobalStatsModelCopyWith<$Res> {
  __$SellerGlobalStatsModelCopyWithImpl(this._self, this._then);

  final _SellerGlobalStatsModel _self;
  final $Res Function(_SellerGlobalStatsModel) _then;

/// Create a copy of SellerGlobalStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalViews = null,Object? totalFavorites = null,Object? totalContacts = null,Object? contactRate = null,Object? totalAnnonces = null,Object? activeAnnonces = null,Object? soldAnnonces = null,}) {
  return _then(_SellerGlobalStatsModel(
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
