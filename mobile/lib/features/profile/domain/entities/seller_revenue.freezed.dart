// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_revenue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerRevenue {

 RevenuePeriod get period; double get totalRevenue; String get currency; int get soldCount; double get averagePrice; DateTime get startDate; DateTime get endDate;
/// Create a copy of SellerRevenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerRevenueCopyWith<SellerRevenue> get copyWith => _$SellerRevenueCopyWithImpl<SellerRevenue>(this as SellerRevenue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerRevenue&&(identical(other.period, period) || other.period == period)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,period,totalRevenue,currency,soldCount,averagePrice,startDate,endDate);

@override
String toString() {
  return 'SellerRevenue(period: $period, totalRevenue: $totalRevenue, currency: $currency, soldCount: $soldCount, averagePrice: $averagePrice, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $SellerRevenueCopyWith<$Res>  {
  factory $SellerRevenueCopyWith(SellerRevenue value, $Res Function(SellerRevenue) _then) = _$SellerRevenueCopyWithImpl;
@useResult
$Res call({
 RevenuePeriod period, double totalRevenue, String currency, int soldCount, double averagePrice, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$SellerRevenueCopyWithImpl<$Res>
    implements $SellerRevenueCopyWith<$Res> {
  _$SellerRevenueCopyWithImpl(this._self, this._then);

  final SellerRevenue _self;
  final $Res Function(SellerRevenue) _then;

/// Create a copy of SellerRevenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? totalRevenue = null,Object? currency = null,Object? soldCount = null,Object? averagePrice = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerRevenue].
extension SellerRevenuePatterns on SellerRevenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerRevenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerRevenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerRevenue value)  $default,){
final _that = this;
switch (_that) {
case _SellerRevenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerRevenue value)?  $default,){
final _that = this;
switch (_that) {
case _SellerRevenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RevenuePeriod period,  double totalRevenue,  String currency,  int soldCount,  double averagePrice,  DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerRevenue() when $default != null:
return $default(_that.period,_that.totalRevenue,_that.currency,_that.soldCount,_that.averagePrice,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RevenuePeriod period,  double totalRevenue,  String currency,  int soldCount,  double averagePrice,  DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _SellerRevenue():
return $default(_that.period,_that.totalRevenue,_that.currency,_that.soldCount,_that.averagePrice,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RevenuePeriod period,  double totalRevenue,  String currency,  int soldCount,  double averagePrice,  DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _SellerRevenue() when $default != null:
return $default(_that.period,_that.totalRevenue,_that.currency,_that.soldCount,_that.averagePrice,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _SellerRevenue implements SellerRevenue {
  const _SellerRevenue({required this.period, required this.totalRevenue, required this.currency, required this.soldCount, required this.averagePrice, required this.startDate, required this.endDate});
  

@override final  RevenuePeriod period;
@override final  double totalRevenue;
@override final  String currency;
@override final  int soldCount;
@override final  double averagePrice;
@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of SellerRevenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerRevenueCopyWith<_SellerRevenue> get copyWith => __$SellerRevenueCopyWithImpl<_SellerRevenue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerRevenue&&(identical(other.period, period) || other.period == period)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,period,totalRevenue,currency,soldCount,averagePrice,startDate,endDate);

@override
String toString() {
  return 'SellerRevenue(period: $period, totalRevenue: $totalRevenue, currency: $currency, soldCount: $soldCount, averagePrice: $averagePrice, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$SellerRevenueCopyWith<$Res> implements $SellerRevenueCopyWith<$Res> {
  factory _$SellerRevenueCopyWith(_SellerRevenue value, $Res Function(_SellerRevenue) _then) = __$SellerRevenueCopyWithImpl;
@override @useResult
$Res call({
 RevenuePeriod period, double totalRevenue, String currency, int soldCount, double averagePrice, DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$SellerRevenueCopyWithImpl<$Res>
    implements _$SellerRevenueCopyWith<$Res> {
  __$SellerRevenueCopyWithImpl(this._self, this._then);

  final _SellerRevenue _self;
  final $Res Function(_SellerRevenue) _then;

/// Create a copy of SellerRevenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? totalRevenue = null,Object? currency = null,Object? soldCount = null,Object? averagePrice = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_SellerRevenue(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
