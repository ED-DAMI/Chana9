// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnonceDetailEvent {

 String get id;
/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceDetailEventCopyWith<AnnonceDetailEvent> get copyWith => _$AnnonceDetailEventCopyWithImpl<AnnonceDetailEvent>(this as AnnonceDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceDetailEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $AnnonceDetailEventCopyWith<$Res>  {
  factory $AnnonceDetailEventCopyWith(AnnonceDetailEvent value, $Res Function(AnnonceDetailEvent) _then) = _$AnnonceDetailEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$AnnonceDetailEventCopyWithImpl<$Res>
    implements $AnnonceDetailEventCopyWith<$Res> {
  _$AnnonceDetailEventCopyWithImpl(this._self, this._then);

  final AnnonceDetailEvent _self;
  final $Res Function(AnnonceDetailEvent) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceDetailEvent].
extension AnnonceDetailEventPatterns on AnnonceDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Suspend value)?  suspend,TResult Function( _Reactivate value)?  reactivate,TResult Function( _MarkAsSold value)?  markAsSold,TResult Function( _ActivateTopLot value)?  activateTopLot,TResult Function( _Report value)?  report,TResult Function( _AddFavorite value)?  addFavorite,TResult Function( _RemoveFavorite value)?  removeFavorite,TResult Function( _Delete value)?  delete,TResult Function( _Update value)?  update,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Suspend() when suspend != null:
return suspend(_that);case _Reactivate() when reactivate != null:
return reactivate(_that);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that);case _Report() when report != null:
return report(_that);case _AddFavorite() when addFavorite != null:
return addFavorite(_that);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that);case _Delete() when delete != null:
return delete(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Suspend value)  suspend,required TResult Function( _Reactivate value)  reactivate,required TResult Function( _MarkAsSold value)  markAsSold,required TResult Function( _ActivateTopLot value)  activateTopLot,required TResult Function( _Report value)  report,required TResult Function( _AddFavorite value)  addFavorite,required TResult Function( _RemoveFavorite value)  removeFavorite,required TResult Function( _Delete value)  delete,required TResult Function( _Update value)  update,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Suspend():
return suspend(_that);case _Reactivate():
return reactivate(_that);case _MarkAsSold():
return markAsSold(_that);case _ActivateTopLot():
return activateTopLot(_that);case _Report():
return report(_that);case _AddFavorite():
return addFavorite(_that);case _RemoveFavorite():
return removeFavorite(_that);case _Delete():
return delete(_that);case _Update():
return update(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Suspend value)?  suspend,TResult? Function( _Reactivate value)?  reactivate,TResult? Function( _MarkAsSold value)?  markAsSold,TResult? Function( _ActivateTopLot value)?  activateTopLot,TResult? Function( _Report value)?  report,TResult? Function( _AddFavorite value)?  addFavorite,TResult? Function( _RemoveFavorite value)?  removeFavorite,TResult? Function( _Delete value)?  delete,TResult? Function( _Update value)?  update,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Suspend() when suspend != null:
return suspend(_that);case _Reactivate() when reactivate != null:
return reactivate(_that);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that);case _Report() when report != null:
return report(_that);case _AddFavorite() when addFavorite != null:
return addFavorite(_that);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that);case _Delete() when delete != null:
return delete(_that);case _Update() when update != null:
return update(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id)?  load,TResult Function( String id)?  suspend,TResult Function( String id)?  reactivate,TResult Function( String id)?  markAsSold,TResult Function( String id,  int durationDays)?  activateTopLot,TResult Function( String id,  String reason,  String? comment)?  report,TResult Function( String id)?  addFavorite,TResult Function( String id)?  removeFavorite,TResult Function( String id)?  delete,TResult Function( String id,  Map<String, dynamic> body)?  update,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.id);case _Suspend() when suspend != null:
return suspend(_that.id);case _Reactivate() when reactivate != null:
return reactivate(_that.id);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that.id);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that.id,_that.durationDays);case _Report() when report != null:
return report(_that.id,_that.reason,_that.comment);case _AddFavorite() when addFavorite != null:
return addFavorite(_that.id);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that.id);case _Delete() when delete != null:
return delete(_that.id);case _Update() when update != null:
return update(_that.id,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id)  load,required TResult Function( String id)  suspend,required TResult Function( String id)  reactivate,required TResult Function( String id)  markAsSold,required TResult Function( String id,  int durationDays)  activateTopLot,required TResult Function( String id,  String reason,  String? comment)  report,required TResult Function( String id)  addFavorite,required TResult Function( String id)  removeFavorite,required TResult Function( String id)  delete,required TResult Function( String id,  Map<String, dynamic> body)  update,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.id);case _Suspend():
return suspend(_that.id);case _Reactivate():
return reactivate(_that.id);case _MarkAsSold():
return markAsSold(_that.id);case _ActivateTopLot():
return activateTopLot(_that.id,_that.durationDays);case _Report():
return report(_that.id,_that.reason,_that.comment);case _AddFavorite():
return addFavorite(_that.id);case _RemoveFavorite():
return removeFavorite(_that.id);case _Delete():
return delete(_that.id);case _Update():
return update(_that.id,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id)?  load,TResult? Function( String id)?  suspend,TResult? Function( String id)?  reactivate,TResult? Function( String id)?  markAsSold,TResult? Function( String id,  int durationDays)?  activateTopLot,TResult? Function( String id,  String reason,  String? comment)?  report,TResult? Function( String id)?  addFavorite,TResult? Function( String id)?  removeFavorite,TResult? Function( String id)?  delete,TResult? Function( String id,  Map<String, dynamic> body)?  update,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.id);case _Suspend() when suspend != null:
return suspend(_that.id);case _Reactivate() when reactivate != null:
return reactivate(_that.id);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that.id);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that.id,_that.durationDays);case _Report() when report != null:
return report(_that.id,_that.reason,_that.comment);case _AddFavorite() when addFavorite != null:
return addFavorite(_that.id);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that.id);case _Delete() when delete != null:
return delete(_that.id);case _Update() when update != null:
return update(_that.id,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements AnnonceDetailEvent {
  const _Load(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.load(id: $id)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Load(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Suspend implements AnnonceDetailEvent {
  const _Suspend(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuspendCopyWith<_Suspend> get copyWith => __$SuspendCopyWithImpl<_Suspend>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Suspend&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.suspend(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SuspendCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$SuspendCopyWith(_Suspend value, $Res Function(_Suspend) _then) = __$SuspendCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$SuspendCopyWithImpl<$Res>
    implements _$SuspendCopyWith<$Res> {
  __$SuspendCopyWithImpl(this._self, this._then);

  final _Suspend _self;
  final $Res Function(_Suspend) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Suspend(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reactivate implements AnnonceDetailEvent {
  const _Reactivate(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactivateCopyWith<_Reactivate> get copyWith => __$ReactivateCopyWithImpl<_Reactivate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reactivate&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.reactivate(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ReactivateCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$ReactivateCopyWith(_Reactivate value, $Res Function(_Reactivate) _then) = __$ReactivateCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ReactivateCopyWithImpl<$Res>
    implements _$ReactivateCopyWith<$Res> {
  __$ReactivateCopyWithImpl(this._self, this._then);

  final _Reactivate _self;
  final $Res Function(_Reactivate) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Reactivate(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MarkAsSold implements AnnonceDetailEvent {
  const _MarkAsSold(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsSoldCopyWith<_MarkAsSold> get copyWith => __$MarkAsSoldCopyWithImpl<_MarkAsSold>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsSold&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.markAsSold(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MarkAsSoldCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$MarkAsSoldCopyWith(_MarkAsSold value, $Res Function(_MarkAsSold) _then) = __$MarkAsSoldCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$MarkAsSoldCopyWithImpl<$Res>
    implements _$MarkAsSoldCopyWith<$Res> {
  __$MarkAsSoldCopyWithImpl(this._self, this._then);

  final _MarkAsSold _self;
  final $Res Function(_MarkAsSold) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MarkAsSold(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ActivateTopLot implements AnnonceDetailEvent {
  const _ActivateTopLot({required this.id, required this.durationDays});
  

@override final  String id;
 final  int durationDays;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivateTopLotCopyWith<_ActivateTopLot> get copyWith => __$ActivateTopLotCopyWithImpl<_ActivateTopLot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivateTopLot&&(identical(other.id, id) || other.id == id)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays));
}


@override
int get hashCode => Object.hash(runtimeType,id,durationDays);

@override
String toString() {
  return 'AnnonceDetailEvent.activateTopLot(id: $id, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class _$ActivateTopLotCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$ActivateTopLotCopyWith(_ActivateTopLot value, $Res Function(_ActivateTopLot) _then) = __$ActivateTopLotCopyWithImpl;
@override @useResult
$Res call({
 String id, int durationDays
});




}
/// @nodoc
class __$ActivateTopLotCopyWithImpl<$Res>
    implements _$ActivateTopLotCopyWith<$Res> {
  __$ActivateTopLotCopyWithImpl(this._self, this._then);

  final _ActivateTopLot _self;
  final $Res Function(_ActivateTopLot) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? durationDays = null,}) {
  return _then(_ActivateTopLot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Report implements AnnonceDetailEvent {
  const _Report({required this.id, required this.reason, this.comment});
  

@override final  String id;
 final  String reason;
 final  String? comment;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCopyWith<_Report> get copyWith => __$ReportCopyWithImpl<_Report>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Report&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,reason,comment);

@override
String toString() {
  return 'AnnonceDetailEvent.report(id: $id, reason: $reason, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) = __$ReportCopyWithImpl;
@override @useResult
$Res call({
 String id, String reason, String? comment
});




}
/// @nodoc
class __$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? comment = freezed,}) {
  return _then(_Report(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _AddFavorite implements AnnonceDetailEvent {
  const _AddFavorite(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFavoriteCopyWith<_AddFavorite> get copyWith => __$AddFavoriteCopyWithImpl<_AddFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddFavorite&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.addFavorite(id: $id)';
}


}

/// @nodoc
abstract mixin class _$AddFavoriteCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$AddFavoriteCopyWith(_AddFavorite value, $Res Function(_AddFavorite) _then) = __$AddFavoriteCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$AddFavoriteCopyWithImpl<$Res>
    implements _$AddFavoriteCopyWith<$Res> {
  __$AddFavoriteCopyWithImpl(this._self, this._then);

  final _AddFavorite _self;
  final $Res Function(_AddFavorite) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_AddFavorite(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveFavorite implements AnnonceDetailEvent {
  const _RemoveFavorite(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFavoriteCopyWith<_RemoveFavorite> get copyWith => __$RemoveFavoriteCopyWithImpl<_RemoveFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFavorite&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.removeFavorite(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RemoveFavoriteCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$RemoveFavoriteCopyWith(_RemoveFavorite value, $Res Function(_RemoveFavorite) _then) = __$RemoveFavoriteCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RemoveFavoriteCopyWithImpl<$Res>
    implements _$RemoveFavoriteCopyWith<$Res> {
  __$RemoveFavoriteCopyWithImpl(this._self, this._then);

  final _RemoveFavorite _self;
  final $Res Function(_RemoveFavorite) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RemoveFavorite(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Delete implements AnnonceDetailEvent {
  const _Delete(this.id);
  

@override final  String id;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceDetailEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Delete(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Update implements AnnonceDetailEvent {
  const _Update({required this.id, required final  Map<String, dynamic> body}): _body = body;
  

@override final  String id;
 final  Map<String, dynamic> _body;
 Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'AnnonceDetailEvent.update(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $AnnonceDetailEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of AnnonceDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_Update(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$AnnonceDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceDetailState()';
}


}

/// @nodoc
class $AnnonceDetailStateCopyWith<$Res>  {
$AnnonceDetailStateCopyWith(AnnonceDetailState _, $Res Function(AnnonceDetailState) __);
}


/// Adds pattern-matching-related methods to [AnnonceDetailState].
extension AnnonceDetailStatePatterns on AnnonceDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _ActionSuccess value)?  actionSuccess,TResult Function( _Deleted value)?  deleted,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _ActionSuccess value)  actionSuccess,required TResult Function( _Deleted value)  deleted,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _ActionSuccess():
return actionSuccess(_that);case _Deleted():
return deleted(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _ActionSuccess value)?  actionSuccess,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Annonce annonce)?  loaded,TResult Function( Annonce annonce)?  actionSuccess,TResult Function()?  deleted,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.annonce);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that.annonce);case _Deleted() when deleted != null:
return deleted();case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Annonce annonce)  loaded,required TResult Function( Annonce annonce)  actionSuccess,required TResult Function()  deleted,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.annonce);case _ActionSuccess():
return actionSuccess(_that.annonce);case _Deleted():
return deleted();case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Annonce annonce)?  loaded,TResult? Function( Annonce annonce)?  actionSuccess,TResult? Function()?  deleted,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.annonce);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that.annonce);case _Deleted() when deleted != null:
return deleted();case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AnnonceDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceDetailState.initial()';
}


}




/// @nodoc


class _Loading implements AnnonceDetailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceDetailState.loading()';
}


}




/// @nodoc


class _Loaded implements AnnonceDetailState {
  const _Loaded(this.annonce);
  

 final  Annonce annonce;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.annonce, annonce) || other.annonce == annonce));
}


@override
int get hashCode => Object.hash(runtimeType,annonce);

@override
String toString() {
  return 'AnnonceDetailState.loaded(annonce: $annonce)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $AnnonceDetailStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Annonce annonce
});


$AnnonceCopyWith<$Res> get annonce;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonce = null,}) {
  return _then(_Loaded(
null == annonce ? _self.annonce : annonce // ignore: cast_nullable_to_non_nullable
as Annonce,
  ));
}

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnonceCopyWith<$Res> get annonce {
  
  return $AnnonceCopyWith<$Res>(_self.annonce, (value) {
    return _then(_self.copyWith(annonce: value));
  });
}
}

/// @nodoc


class _ActionSuccess implements AnnonceDetailState {
  const _ActionSuccess(this.annonce);
  

 final  Annonce annonce;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionSuccessCopyWith<_ActionSuccess> get copyWith => __$ActionSuccessCopyWithImpl<_ActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionSuccess&&(identical(other.annonce, annonce) || other.annonce == annonce));
}


@override
int get hashCode => Object.hash(runtimeType,annonce);

@override
String toString() {
  return 'AnnonceDetailState.actionSuccess(annonce: $annonce)';
}


}

/// @nodoc
abstract mixin class _$ActionSuccessCopyWith<$Res> implements $AnnonceDetailStateCopyWith<$Res> {
  factory _$ActionSuccessCopyWith(_ActionSuccess value, $Res Function(_ActionSuccess) _then) = __$ActionSuccessCopyWithImpl;
@useResult
$Res call({
 Annonce annonce
});


$AnnonceCopyWith<$Res> get annonce;

}
/// @nodoc
class __$ActionSuccessCopyWithImpl<$Res>
    implements _$ActionSuccessCopyWith<$Res> {
  __$ActionSuccessCopyWithImpl(this._self, this._then);

  final _ActionSuccess _self;
  final $Res Function(_ActionSuccess) _then;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonce = null,}) {
  return _then(_ActionSuccess(
null == annonce ? _self.annonce : annonce // ignore: cast_nullable_to_non_nullable
as Annonce,
  ));
}

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnonceCopyWith<$Res> get annonce {
  
  return $AnnonceCopyWith<$Res>(_self.annonce, (value) {
    return _then(_self.copyWith(annonce: value));
  });
}
}

/// @nodoc


class _Deleted implements AnnonceDetailState {
  const _Deleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceDetailState.deleted()';
}


}




/// @nodoc


class _Failure implements AnnonceDetailState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnnonceDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AnnonceDetailStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of AnnonceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
