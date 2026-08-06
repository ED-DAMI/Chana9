// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_revenue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SellerRevenueModel {

 String get period;@JsonKey(name: 'total_revenue') double get totalRevenue; String get currency;@JsonKey(name: 'sold_count') int get soldCount;@JsonKey(name: 'average_price') double get averagePrice;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;
/// Create a copy of SellerRevenueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerRevenueModelCopyWith<SellerRevenueModel> get copyWith => _$SellerRevenueModelCopyWithImpl<SellerRevenueModel>(this as SellerRevenueModel, _$identity);

  /// Serializes this SellerRevenueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerRevenueModel&&(identical(other.period, period) || other.period == period)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,totalRevenue,currency,soldCount,averagePrice,startDate,endDate);

@override
String toString() {
  return 'SellerRevenueModel(period: $period, totalRevenue: $totalRevenue, currency: $currency, soldCount: $soldCount, averagePrice: $averagePrice, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $SellerRevenueModelCopyWith<$Res>  {
  factory $SellerRevenueModelCopyWith(SellerRevenueModel value, $Res Function(SellerRevenueModel) _then) = _$SellerRevenueModelCopyWithImpl;
@useResult
$Res call({
 String period,@JsonKey(name: 'total_revenue') double totalRevenue, String currency,@JsonKey(name: 'sold_count') int soldCount,@JsonKey(name: 'average_price') double averagePrice,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate
});




}
/// @nodoc
class _$SellerRevenueModelCopyWithImpl<$Res>
    implements $SellerRevenueModelCopyWith<$Res> {
  _$SellerRevenueModelCopyWithImpl(this._self, this._then);

  final SellerRevenueModel _self;
  final $Res Function(SellerRevenueModel) _then;

/// Create a copy of SellerRevenueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? totalRevenue = null,Object? currency = null,Object? soldCount = null,Object? averagePrice = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerRevenueModel].
extension SellerRevenueModelPatterns on SellerRevenueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerRevenueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerRevenueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerRevenueModel value)  $default,){
final _that = this;
switch (_that) {
case _SellerRevenueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerRevenueModel value)?  $default,){
final _that = this;
switch (_that) {
case _SellerRevenueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String period, @JsonKey(name: 'total_revenue')  double totalRevenue,  String currency, @JsonKey(name: 'sold_count')  int soldCount, @JsonKey(name: 'average_price')  double averagePrice, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerRevenueModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String period, @JsonKey(name: 'total_revenue')  double totalRevenue,  String currency, @JsonKey(name: 'sold_count')  int soldCount, @JsonKey(name: 'average_price')  double averagePrice, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate)  $default,) {final _that = this;
switch (_that) {
case _SellerRevenueModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String period, @JsonKey(name: 'total_revenue')  double totalRevenue,  String currency, @JsonKey(name: 'sold_count')  int soldCount, @JsonKey(name: 'average_price')  double averagePrice, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _SellerRevenueModel() when $default != null:
return $default(_that.period,_that.totalRevenue,_that.currency,_that.soldCount,_that.averagePrice,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerRevenueModel extends SellerRevenueModel {
  const _SellerRevenueModel({required this.period, @JsonKey(name: 'total_revenue') required this.totalRevenue, required this.currency, @JsonKey(name: 'sold_count') required this.soldCount, @JsonKey(name: 'average_price') required this.averagePrice, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate}): super._();
  factory _SellerRevenueModel.fromJson(Map<String, dynamic> json) => _$SellerRevenueModelFromJson(json);

@override final  String period;
@override@JsonKey(name: 'total_revenue') final  double totalRevenue;
@override final  String currency;
@override@JsonKey(name: 'sold_count') final  int soldCount;
@override@JsonKey(name: 'average_price') final  double averagePrice;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;

/// Create a copy of SellerRevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerRevenueModelCopyWith<_SellerRevenueModel> get copyWith => __$SellerRevenueModelCopyWithImpl<_SellerRevenueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerRevenueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerRevenueModel&&(identical(other.period, period) || other.period == period)&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,totalRevenue,currency,soldCount,averagePrice,startDate,endDate);

@override
String toString() {
  return 'SellerRevenueModel(period: $period, totalRevenue: $totalRevenue, currency: $currency, soldCount: $soldCount, averagePrice: $averagePrice, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$SellerRevenueModelCopyWith<$Res> implements $SellerRevenueModelCopyWith<$Res> {
  factory _$SellerRevenueModelCopyWith(_SellerRevenueModel value, $Res Function(_SellerRevenueModel) _then) = __$SellerRevenueModelCopyWithImpl;
@override @useResult
$Res call({
 String period,@JsonKey(name: 'total_revenue') double totalRevenue, String currency,@JsonKey(name: 'sold_count') int soldCount,@JsonKey(name: 'average_price') double averagePrice,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate
});




}
/// @nodoc
class __$SellerRevenueModelCopyWithImpl<$Res>
    implements _$SellerRevenueModelCopyWith<$Res> {
  __$SellerRevenueModelCopyWithImpl(this._self, this._then);

  final _SellerRevenueModel _self;
  final $Res Function(_SellerRevenueModel) _then;

/// Create a copy of SellerRevenueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? totalRevenue = null,Object? currency = null,Object? soldCount = null,Object? averagePrice = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_SellerRevenueModel(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,soldCount: null == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
