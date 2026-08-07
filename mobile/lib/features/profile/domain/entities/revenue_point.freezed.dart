// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RevenuePoint {

 DateTime get date; double get revenue; int get soldCount;
/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenuePointCopyWith<RevenuePoint> get copyWith => _$RevenuePointCopyWithImpl<RevenuePoint>(this as RevenuePoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenuePoint&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount));
}


@override
int get hashCode => Object.hash(runtimeType,date,revenue,soldCount);

@override
String toString() {
  return 'RevenuePoint(date: $date, revenue: $revenue, soldCount: $soldCount)';
}


}

/// @nodoc
abstract mixin class $RevenuePointCopyWith<$Res>  {
  factory $RevenuePointCopyWith(RevenuePoint value, $Res Function(RevenuePoint) _then) = _$RevenuePointCopyWithImpl;
@useResult
$Res call({
 DateTime date, double revenue, int soldCount
});




}
/// @nodoc
class _$RevenuePointCopyWithImpl<$Res>
    implements $RevenuePointCopyWith<$Res> {
  _$RevenuePointCopyWithImpl(this._self, this._then);

  final RevenuePoint _self;
  final $Res Function(RevenuePoint) _then;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? revenue = null,Object? soldCount = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenuePoint].
extension RevenuePointPatterns on RevenuePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenuePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenuePoint value)  $default,){
final _that = this;
switch (_that) {
case _RevenuePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenuePoint value)?  $default,){
final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double revenue,  int soldCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double revenue,  int soldCount)  $default,) {final _that = this;
switch (_that) {
case _RevenuePoint():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double revenue,  int soldCount)?  $default,) {final _that = this;
switch (_that) {
case _RevenuePoint() when $default != null:
return $default(_that.date,_that.revenue,_that.soldCount);case _:
  return null;

}
}

}

/// @nodoc


class _RevenuePoint implements RevenuePoint {
  const _RevenuePoint({required this.date, required this.revenue, required this.soldCount});
  

@override final  DateTime date;
@override final  double revenue;
@override final  int soldCount;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenuePointCopyWith<_RevenuePoint> get copyWith => __$RevenuePointCopyWithImpl<_RevenuePoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenuePoint&&(identical(other.date, date) || other.date == date)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount));
}


@override
int get hashCode => Object.hash(runtimeType,date,revenue,soldCount);

@override
String toString() {
  return 'RevenuePoint(date: $date, revenue: $revenue, soldCount: $soldCount)';
}


}

/// @nodoc
abstract mixin class _$RevenuePointCopyWith<$Res> implements $RevenuePointCopyWith<$Res> {
  factory _$RevenuePointCopyWith(_RevenuePoint value, $Res Function(_RevenuePoint) _then) = __$RevenuePointCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double revenue, int soldCount
});




}
/// @nodoc
class __$RevenuePointCopyWithImpl<$Res>
    implements _$RevenuePointCopyWith<$Res> {
  __$RevenuePointCopyWithImpl(this._self, this._then);

  final _RevenuePoint _self;
  final $Res Function(_RevenuePoint) _then;

/// Create a copy of RevenuePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? revenue = null,Object? soldCount = null,}) {
  return _then(_RevenuePoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as double,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
