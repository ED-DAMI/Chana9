// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsDashboardEvent {

 String get sellerId;
/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsDashboardEventCopyWith<StatsDashboardEvent> get copyWith => _$StatsDashboardEventCopyWithImpl<StatsDashboardEvent>(this as StatsDashboardEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsDashboardEvent&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'StatsDashboardEvent(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class $StatsDashboardEventCopyWith<$Res>  {
  factory $StatsDashboardEventCopyWith(StatsDashboardEvent value, $Res Function(StatsDashboardEvent) _then) = _$StatsDashboardEventCopyWithImpl;
@useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class _$StatsDashboardEventCopyWithImpl<$Res>
    implements $StatsDashboardEventCopyWith<$Res> {
  _$StatsDashboardEventCopyWithImpl(this._self, this._then);

  final StatsDashboardEvent _self;
  final $Res Function(StatsDashboardEvent) _then;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsDashboardEvent].
extension StatsDashboardEventPatterns on StatsDashboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDashboard value)?  loadDashboard,TResult Function( _ChangePeriod value)?  changePeriod,TResult Function( _RefreshDashboard value)?  refreshDashboard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDashboard() when loadDashboard != null:
return loadDashboard(_that);case _ChangePeriod() when changePeriod != null:
return changePeriod(_that);case _RefreshDashboard() when refreshDashboard != null:
return refreshDashboard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDashboard value)  loadDashboard,required TResult Function( _ChangePeriod value)  changePeriod,required TResult Function( _RefreshDashboard value)  refreshDashboard,}){
final _that = this;
switch (_that) {
case _LoadDashboard():
return loadDashboard(_that);case _ChangePeriod():
return changePeriod(_that);case _RefreshDashboard():
return refreshDashboard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDashboard value)?  loadDashboard,TResult? Function( _ChangePeriod value)?  changePeriod,TResult? Function( _RefreshDashboard value)?  refreshDashboard,}){
final _that = this;
switch (_that) {
case _LoadDashboard() when loadDashboard != null:
return loadDashboard(_that);case _ChangePeriod() when changePeriod != null:
return changePeriod(_that);case _RefreshDashboard() when refreshDashboard != null:
return refreshDashboard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String sellerId)?  loadDashboard,TResult Function( String sellerId,  RevenuePeriod period)?  changePeriod,TResult Function( String sellerId)?  refreshDashboard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDashboard() when loadDashboard != null:
return loadDashboard(_that.sellerId);case _ChangePeriod() when changePeriod != null:
return changePeriod(_that.sellerId,_that.period);case _RefreshDashboard() when refreshDashboard != null:
return refreshDashboard(_that.sellerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String sellerId)  loadDashboard,required TResult Function( String sellerId,  RevenuePeriod period)  changePeriod,required TResult Function( String sellerId)  refreshDashboard,}) {final _that = this;
switch (_that) {
case _LoadDashboard():
return loadDashboard(_that.sellerId);case _ChangePeriod():
return changePeriod(_that.sellerId,_that.period);case _RefreshDashboard():
return refreshDashboard(_that.sellerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String sellerId)?  loadDashboard,TResult? Function( String sellerId,  RevenuePeriod period)?  changePeriod,TResult? Function( String sellerId)?  refreshDashboard,}) {final _that = this;
switch (_that) {
case _LoadDashboard() when loadDashboard != null:
return loadDashboard(_that.sellerId);case _ChangePeriod() when changePeriod != null:
return changePeriod(_that.sellerId,_that.period);case _RefreshDashboard() when refreshDashboard != null:
return refreshDashboard(_that.sellerId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadDashboard implements StatsDashboardEvent {
  const _LoadDashboard({required this.sellerId});
  

@override final  String sellerId;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadDashboardCopyWith<_LoadDashboard> get copyWith => __$LoadDashboardCopyWithImpl<_LoadDashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDashboard&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'StatsDashboardEvent.loadDashboard(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$LoadDashboardCopyWith<$Res> implements $StatsDashboardEventCopyWith<$Res> {
  factory _$LoadDashboardCopyWith(_LoadDashboard value, $Res Function(_LoadDashboard) _then) = __$LoadDashboardCopyWithImpl;
@override @useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class __$LoadDashboardCopyWithImpl<$Res>
    implements _$LoadDashboardCopyWith<$Res> {
  __$LoadDashboardCopyWithImpl(this._self, this._then);

  final _LoadDashboard _self;
  final $Res Function(_LoadDashboard) _then;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,}) {
  return _then(_LoadDashboard(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangePeriod implements StatsDashboardEvent {
  const _ChangePeriod({required this.sellerId, required this.period});
  

@override final  String sellerId;
 final  RevenuePeriod period;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePeriodCopyWith<_ChangePeriod> get copyWith => __$ChangePeriodCopyWithImpl<_ChangePeriod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePeriod&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,period);

@override
String toString() {
  return 'StatsDashboardEvent.changePeriod(sellerId: $sellerId, period: $period)';
}


}

/// @nodoc
abstract mixin class _$ChangePeriodCopyWith<$Res> implements $StatsDashboardEventCopyWith<$Res> {
  factory _$ChangePeriodCopyWith(_ChangePeriod value, $Res Function(_ChangePeriod) _then) = __$ChangePeriodCopyWithImpl;
@override @useResult
$Res call({
 String sellerId, RevenuePeriod period
});




}
/// @nodoc
class __$ChangePeriodCopyWithImpl<$Res>
    implements _$ChangePeriodCopyWith<$Res> {
  __$ChangePeriodCopyWithImpl(this._self, this._then);

  final _ChangePeriod _self;
  final $Res Function(_ChangePeriod) _then;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? period = null,}) {
  return _then(_ChangePeriod(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}


}

/// @nodoc


class _RefreshDashboard implements StatsDashboardEvent {
  const _RefreshDashboard({required this.sellerId});
  

@override final  String sellerId;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshDashboardCopyWith<_RefreshDashboard> get copyWith => __$RefreshDashboardCopyWithImpl<_RefreshDashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshDashboard&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId);

@override
String toString() {
  return 'StatsDashboardEvent.refreshDashboard(sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$RefreshDashboardCopyWith<$Res> implements $StatsDashboardEventCopyWith<$Res> {
  factory _$RefreshDashboardCopyWith(_RefreshDashboard value, $Res Function(_RefreshDashboard) _then) = __$RefreshDashboardCopyWithImpl;
@override @useResult
$Res call({
 String sellerId
});




}
/// @nodoc
class __$RefreshDashboardCopyWithImpl<$Res>
    implements _$RefreshDashboardCopyWith<$Res> {
  __$RefreshDashboardCopyWithImpl(this._self, this._then);

  final _RefreshDashboard _self;
  final $Res Function(_RefreshDashboard) _then;

/// Create a copy of StatsDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,}) {
  return _then(_RefreshDashboard(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
