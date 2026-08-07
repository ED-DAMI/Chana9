// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevenuePointModel {

 String get date; double get revenue;@JsonKey(name: 'sold_count') int get soldCount;
/// Create a copy of RevenuePointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenuePointModelCopyWith<RevenuePointModel> get copyWith => _$RevenuePointModelCopyWithImpl<RevenuePointModel>(this as RevenuePointModel, _$identity);

  /// Serializes this RevenuePointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenuePointModel&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,soldCount);

@override
String toString() {
  return 'RevenuePointModel(date: $date, revenue: $revenue, soldCount: $soldCount)';
}


}

/// @nodoc
abstract mixin class $RevenuePointModelCopyWith<$Res>  {
  factory $RevenuePointModelCopyWith(RevenuePointModel value, $Res Function(RevenuePointModel) _then) = _$RevenuePointModelCopyWithImpl;
@useResult
$Res call({
 String date, double revenue,@JsonKey(name: 'sold_count') int soldCount
});




}
/// @nodoc
class _$RevenuePointModelCopyWithImpl<$Res>
    implements $RevenuePointModelCopyWith<$Res> {
  _$RevenuePointModelCopyWithImpl(this._self, this._then);

  final RevenuePointModel _self;
  final $Res Function(RevenuePointModel) _then;

/// Create a copy of RevenuePointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? revenue = null,Object? soldCount = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenuePointModel].
extension RevenuePointModelPatterns on RevenuePointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenuePointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenuePointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenuePointModel value)  $default,){
final _that = this;
switch (_that) {
case _RevenuePointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenuePointModel value)?  $default,){
final _that = this;
switch (_that) {
case _RevenuePointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double revenue, @JsonKey(name: 'sold_count')  int soldCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenuePointModel() when $default != null:
return $default(_that.date,_that.revenue,_that.soldCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double revenue, @JsonKey(name: 'sold_count')  int soldCount)  $default,) {final _that = this;
switch (_that) {
case _RevenuePointModel():
return $default(_that.date,_that.revenue,_that.soldCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double revenue, @JsonKey(name: 'sold_count')  int soldCount)?  $default,) {final _that = this;
switch (_that) {
case _RevenuePointModel() when $default != null:
return $default(_that.date,_that.revenue,_that.soldCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenuePointModel extends RevenuePointModel {
  const _RevenuePointModel({required this.date, required this.revenue, @JsonKey(name: 'sold_count') required this.soldCount}): super._();
  factory _RevenuePointModel.fromJson(Map<String, dynamic> json) => _$RevenuePointModelFromJson(json);

@override final  String date;
@override final  double revenue;
@override@JsonKey(name: 'sold_count') final  int soldCount;

/// Create a copy of RevenuePointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenuePointModelCopyWith<_RevenuePointModel> get copyWith => __$RevenuePointModelCopyWithImpl<_RevenuePointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenuePointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenuePointModel&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,revenue,soldCount);

@override
String toString() {
  return 'RevenuePointModel(date: $date, revenue: $revenue, soldCount: $soldCount)';
}


}

/// @nodoc
abstract mixin class _$RevenuePointModelCopyWith<$Res> implements $RevenuePointModelCopyWith<$Res> {
  factory _$RevenuePointModelCopyWith(_RevenuePointModel value, $Res Function(_RevenuePointModel) _then) = __$RevenuePointModelCopyWithImpl;
@override @useResult
$Res call({
 String date, double revenue,@JsonKey(name: 'sold_count') int soldCount
});




}
/// @nodoc
class __$RevenuePointModelCopyWithImpl<$Res>
    implements _$RevenuePointModelCopyWith<$Res> {
  __$RevenuePointModelCopyWithImpl(this._self, this._then);

  final _RevenuePointModel _self;
  final $Res Function(_RevenuePointModel) _then;

/// Create a copy of RevenuePointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? revenue = null,Object? soldCount = null,}) {
  return _then(_RevenuePointModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
