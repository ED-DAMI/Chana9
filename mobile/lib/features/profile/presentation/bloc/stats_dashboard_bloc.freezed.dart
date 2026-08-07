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

/// @nodoc
mixin _$StatsDashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsDashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsDashboardState()';
}


}

/// @nodoc
class $StatsDashboardStateCopyWith<$Res>  {
$StatsDashboardStateCopyWith(StatsDashboardState _, $Res Function(StatsDashboardState) __);
}


/// Adds pattern-matching-related methods to [StatsDashboardState].
extension StatsDashboardStatePatterns on StatsDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SellerGlobalStats globalStats,  SellerRevenue revenue,  List<RevenuePoint> timeline,  List<AnnonceStats> annonceStats,  RevenuePeriod selectedPeriod)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.globalStats,_that.revenue,_that.timeline,_that.annonceStats,_that.selectedPeriod);case _Error() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SellerGlobalStats globalStats,  SellerRevenue revenue,  List<RevenuePoint> timeline,  List<AnnonceStats> annonceStats,  RevenuePeriod selectedPeriod)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.globalStats,_that.revenue,_that.timeline,_that.annonceStats,_that.selectedPeriod);case _Error():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SellerGlobalStats globalStats,  SellerRevenue revenue,  List<RevenuePoint> timeline,  List<AnnonceStats> annonceStats,  RevenuePeriod selectedPeriod)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.globalStats,_that.revenue,_that.timeline,_that.annonceStats,_that.selectedPeriod);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements StatsDashboardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsDashboardState.initial()';
}


}




/// @nodoc


class _Loading implements StatsDashboardState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsDashboardState.loading()';
}


}




/// @nodoc


class _Loaded implements StatsDashboardState {
  const _Loaded({required this.globalStats, required this.revenue, required final  List<RevenuePoint> timeline, required final  List<AnnonceStats> annonceStats, required this.selectedPeriod}): _timeline = timeline,_annonceStats = annonceStats;
  

 final  SellerGlobalStats globalStats;
 final  SellerRevenue revenue;
 final  List<RevenuePoint> _timeline;
 List<RevenuePoint> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<AnnonceStats> _annonceStats;
 List<AnnonceStats> get annonceStats {
  if (_annonceStats is EqualUnmodifiableListView) return _annonceStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_annonceStats);
}

 final  RevenuePeriod selectedPeriod;

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.globalStats, globalStats) || other.globalStats == globalStats)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._annonceStats, _annonceStats)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod));
}


@override
int get hashCode => Object.hash(runtimeType,globalStats,revenue,const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_annonceStats),selectedPeriod);

@override
String toString() {
  return 'StatsDashboardState.loaded(globalStats: $globalStats, revenue: $revenue, timeline: $timeline, annonceStats: $annonceStats, selectedPeriod: $selectedPeriod)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $StatsDashboardStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 SellerGlobalStats globalStats, SellerRevenue revenue, List<RevenuePoint> timeline, List<AnnonceStats> annonceStats, RevenuePeriod selectedPeriod
});


$SellerGlobalStatsCopyWith<$Res> get globalStats;$SellerRevenueCopyWith<$Res> get revenue;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? globalStats = null,Object? revenue = null,Object? timeline = null,Object? annonceStats = null,Object? selectedPeriod = null,}) {
  return _then(_Loaded(
globalStats: null == globalStats ? _self.globalStats : globalStats // ignore: cast_nullable_to_non_nullable
as SellerGlobalStats,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as SellerRevenue,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<RevenuePoint>,annonceStats: null == annonceStats ? _self._annonceStats : annonceStats // ignore: cast_nullable_to_non_nullable
as List<AnnonceStats>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as RevenuePeriod,
  ));
}

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerGlobalStatsCopyWith<$Res> get globalStats {
  
  return $SellerGlobalStatsCopyWith<$Res>(_self.globalStats, (value) {
    return _then(_self.copyWith(globalStats: value));
  });
}/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerRevenueCopyWith<$Res> get revenue {
  
  return $SellerRevenueCopyWith<$Res>(_self.revenue, (value) {
    return _then(_self.copyWith(revenue: value));
  });
}
}

/// @nodoc


class _Error implements StatsDashboardState {
  const _Error({required this.failure});
  

 final  Failure failure;

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'StatsDashboardState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $StatsDashboardStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of StatsDashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
