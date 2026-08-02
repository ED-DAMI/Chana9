// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatsModel {

 int get totalAnnonces; int get activeAnnonces; int get soldAnnonces; int get totalFavorites; double? get averageRating;
/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsModelCopyWith<UserStatsModel> get copyWith => _$UserStatsModelCopyWithImpl<UserStatsModel>(this as UserStatsModel, _$identity);

  /// Serializes this UserStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsModel&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAnnonces,activeAnnonces,soldAnnonces,totalFavorites,averageRating);

@override
String toString() {
  return 'UserStatsModel(totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces, totalFavorites: $totalFavorites, averageRating: $averageRating)';
}


}

/// @nodoc
abstract mixin class $UserStatsModelCopyWith<$Res>  {
  factory $UserStatsModelCopyWith(UserStatsModel value, $Res Function(UserStatsModel) _then) = _$UserStatsModelCopyWithImpl;
@useResult
$Res call({
 int totalAnnonces, int activeAnnonces, int soldAnnonces, int totalFavorites, double? averageRating
});




}
/// @nodoc
class _$UserStatsModelCopyWithImpl<$Res>
    implements $UserStatsModelCopyWith<$Res> {
  _$UserStatsModelCopyWithImpl(this._self, this._then);

  final UserStatsModel _self;
  final $Res Function(UserStatsModel) _then;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAnnonces = null,Object? activeAnnonces = null,Object? soldAnnonces = null,Object? totalFavorites = null,Object? averageRating = freezed,}) {
  return _then(_self.copyWith(
totalAnnonces: null == totalAnnonces ? _self.totalAnnonces : totalAnnonces // ignore: cast_nullable_to_non_nullable
as int,activeAnnonces: null == activeAnnonces ? _self.activeAnnonces : activeAnnonces // ignore: cast_nullable_to_non_nullable
as int,soldAnnonces: null == soldAnnonces ? _self.soldAnnonces : soldAnnonces // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStatsModel].
extension UserStatsModelPatterns on UserStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAnnonces,  int activeAnnonces,  int soldAnnonces,  int totalFavorites,  double? averageRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
return $default(_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces,_that.totalFavorites,_that.averageRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAnnonces,  int activeAnnonces,  int soldAnnonces,  int totalFavorites,  double? averageRating)  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel():
return $default(_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces,_that.totalFavorites,_that.averageRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAnnonces,  int activeAnnonces,  int soldAnnonces,  int totalFavorites,  double? averageRating)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
return $default(_that.totalAnnonces,_that.activeAnnonces,_that.soldAnnonces,_that.totalFavorites,_that.averageRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStatsModel extends UserStatsModel {
  const _UserStatsModel({this.totalAnnonces = 0, this.activeAnnonces = 0, this.soldAnnonces = 0, this.totalFavorites = 0, this.averageRating}): super._();
  factory _UserStatsModel.fromJson(Map<String, dynamic> json) => _$UserStatsModelFromJson(json);

@override@JsonKey() final  int totalAnnonces;
@override@JsonKey() final  int activeAnnonces;
@override@JsonKey() final  int soldAnnonces;
@override@JsonKey() final  int totalFavorites;
@override final  double? averageRating;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsModelCopyWith<_UserStatsModel> get copyWith => __$UserStatsModelCopyWithImpl<_UserStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsModel&&(identical(other.totalAnnonces, totalAnnonces) || other.totalAnnonces == totalAnnonces)&&(identical(other.activeAnnonces, activeAnnonces) || other.activeAnnonces == activeAnnonces)&&(identical(other.soldAnnonces, soldAnnonces) || other.soldAnnonces == soldAnnonces)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAnnonces,activeAnnonces,soldAnnonces,totalFavorites,averageRating);

@override
String toString() {
  return 'UserStatsModel(totalAnnonces: $totalAnnonces, activeAnnonces: $activeAnnonces, soldAnnonces: $soldAnnonces, totalFavorites: $totalFavorites, averageRating: $averageRating)';
}


}

/// @nodoc
abstract mixin class _$UserStatsModelCopyWith<$Res> implements $UserStatsModelCopyWith<$Res> {
  factory _$UserStatsModelCopyWith(_UserStatsModel value, $Res Function(_UserStatsModel) _then) = __$UserStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int totalAnnonces, int activeAnnonces, int soldAnnonces, int totalFavorites, double? averageRating
});




}
/// @nodoc
class __$UserStatsModelCopyWithImpl<$Res>
    implements _$UserStatsModelCopyWith<$Res> {
  __$UserStatsModelCopyWithImpl(this._self, this._then);

  final _UserStatsModel _self;
  final $Res Function(_UserStatsModel) _then;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAnnonces = null,Object? activeAnnonces = null,Object? soldAnnonces = null,Object? totalFavorites = null,Object? averageRating = freezed,}) {
  return _then(_UserStatsModel(
totalAnnonces: null == totalAnnonces ? _self.totalAnnonces : totalAnnonces // ignore: cast_nullable_to_non_nullable
as int,activeAnnonces: null == activeAnnonces ? _self.activeAnnonces : activeAnnonces // ignore: cast_nullable_to_non_nullable
as int,soldAnnonces: null == soldAnnonces ? _self.soldAnnonces : soldAnnonces // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
