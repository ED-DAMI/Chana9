// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnonceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceEvent()';
}


}

/// @nodoc
class $AnnonceEventCopyWith<$Res>  {
$AnnonceEventCopyWith(AnnonceEvent _, $Res Function(AnnonceEvent) __);
}


/// Adds pattern-matching-related methods to [AnnonceEvent].
extension AnnonceEventPatterns on AnnonceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SearchAnnonces value)?  searchAnnonces,TResult Function( _LoadAnnonceById value)?  loadAnnonceById,TResult Function( _LoadAnnoncesBySeller value)?  loadAnnoncesBySeller,TResult Function( _CreateAnnonce value)?  createAnnonce,TResult Function( _UpdateAnnonce value)?  updateAnnonce,TResult Function( _DeleteAnnonce value)?  deleteAnnonce,TResult Function( _SuspendAnnonce value)?  suspendAnnonce,TResult Function( _ReactivateAnnonce value)?  reactivateAnnonce,TResult Function( _MarkAsSold value)?  markAsSold,TResult Function( _ActivateTopLot value)?  activateTopLot,TResult Function( _FlagAnnonce value)?  flagAnnonce,TResult Function( _AddFavorite value)?  addFavorite,TResult Function( _RemoveFavorite value)?  removeFavorite,TResult Function( _LoadFavorites value)?  loadFavorites,TResult Function( _CreateAlert value)?  createAlert,TResult Function( _DeleteAlert value)?  deleteAlert,TResult Function( _LoadAlertsByBuyer value)?  loadAlertsByBuyer,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAnnonces() when searchAnnonces != null:
return searchAnnonces(_that);case _LoadAnnonceById() when loadAnnonceById != null:
return loadAnnonceById(_that);case _LoadAnnoncesBySeller() when loadAnnoncesBySeller != null:
return loadAnnoncesBySeller(_that);case _CreateAnnonce() when createAnnonce != null:
return createAnnonce(_that);case _UpdateAnnonce() when updateAnnonce != null:
return updateAnnonce(_that);case _DeleteAnnonce() when deleteAnnonce != null:
return deleteAnnonce(_that);case _SuspendAnnonce() when suspendAnnonce != null:
return suspendAnnonce(_that);case _ReactivateAnnonce() when reactivateAnnonce != null:
return reactivateAnnonce(_that);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that);case _FlagAnnonce() when flagAnnonce != null:
return flagAnnonce(_that);case _AddFavorite() when addFavorite != null:
return addFavorite(_that);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that);case _LoadFavorites() when loadFavorites != null:
return loadFavorites(_that);case _CreateAlert() when createAlert != null:
return createAlert(_that);case _DeleteAlert() when deleteAlert != null:
return deleteAlert(_that);case _LoadAlertsByBuyer() when loadAlertsByBuyer != null:
return loadAlertsByBuyer(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SearchAnnonces value)  searchAnnonces,required TResult Function( _LoadAnnonceById value)  loadAnnonceById,required TResult Function( _LoadAnnoncesBySeller value)  loadAnnoncesBySeller,required TResult Function( _CreateAnnonce value)  createAnnonce,required TResult Function( _UpdateAnnonce value)  updateAnnonce,required TResult Function( _DeleteAnnonce value)  deleteAnnonce,required TResult Function( _SuspendAnnonce value)  suspendAnnonce,required TResult Function( _ReactivateAnnonce value)  reactivateAnnonce,required TResult Function( _MarkAsSold value)  markAsSold,required TResult Function( _ActivateTopLot value)  activateTopLot,required TResult Function( _FlagAnnonce value)  flagAnnonce,required TResult Function( _AddFavorite value)  addFavorite,required TResult Function( _RemoveFavorite value)  removeFavorite,required TResult Function( _LoadFavorites value)  loadFavorites,required TResult Function( _CreateAlert value)  createAlert,required TResult Function( _DeleteAlert value)  deleteAlert,required TResult Function( _LoadAlertsByBuyer value)  loadAlertsByBuyer,}){
final _that = this;
switch (_that) {
case _SearchAnnonces():
return searchAnnonces(_that);case _LoadAnnonceById():
return loadAnnonceById(_that);case _LoadAnnoncesBySeller():
return loadAnnoncesBySeller(_that);case _CreateAnnonce():
return createAnnonce(_that);case _UpdateAnnonce():
return updateAnnonce(_that);case _DeleteAnnonce():
return deleteAnnonce(_that);case _SuspendAnnonce():
return suspendAnnonce(_that);case _ReactivateAnnonce():
return reactivateAnnonce(_that);case _MarkAsSold():
return markAsSold(_that);case _ActivateTopLot():
return activateTopLot(_that);case _FlagAnnonce():
return flagAnnonce(_that);case _AddFavorite():
return addFavorite(_that);case _RemoveFavorite():
return removeFavorite(_that);case _LoadFavorites():
return loadFavorites(_that);case _CreateAlert():
return createAlert(_that);case _DeleteAlert():
return deleteAlert(_that);case _LoadAlertsByBuyer():
return loadAlertsByBuyer(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SearchAnnonces value)?  searchAnnonces,TResult? Function( _LoadAnnonceById value)?  loadAnnonceById,TResult? Function( _LoadAnnoncesBySeller value)?  loadAnnoncesBySeller,TResult? Function( _CreateAnnonce value)?  createAnnonce,TResult? Function( _UpdateAnnonce value)?  updateAnnonce,TResult? Function( _DeleteAnnonce value)?  deleteAnnonce,TResult? Function( _SuspendAnnonce value)?  suspendAnnonce,TResult? Function( _ReactivateAnnonce value)?  reactivateAnnonce,TResult? Function( _MarkAsSold value)?  markAsSold,TResult? Function( _ActivateTopLot value)?  activateTopLot,TResult? Function( _FlagAnnonce value)?  flagAnnonce,TResult? Function( _AddFavorite value)?  addFavorite,TResult? Function( _RemoveFavorite value)?  removeFavorite,TResult? Function( _LoadFavorites value)?  loadFavorites,TResult? Function( _CreateAlert value)?  createAlert,TResult? Function( _DeleteAlert value)?  deleteAlert,TResult? Function( _LoadAlertsByBuyer value)?  loadAlertsByBuyer,}){
final _that = this;
switch (_that) {
case _SearchAnnonces() when searchAnnonces != null:
return searchAnnonces(_that);case _LoadAnnonceById() when loadAnnonceById != null:
return loadAnnonceById(_that);case _LoadAnnoncesBySeller() when loadAnnoncesBySeller != null:
return loadAnnoncesBySeller(_that);case _CreateAnnonce() when createAnnonce != null:
return createAnnonce(_that);case _UpdateAnnonce() when updateAnnonce != null:
return updateAnnonce(_that);case _DeleteAnnonce() when deleteAnnonce != null:
return deleteAnnonce(_that);case _SuspendAnnonce() when suspendAnnonce != null:
return suspendAnnonce(_that);case _ReactivateAnnonce() when reactivateAnnonce != null:
return reactivateAnnonce(_that);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that);case _FlagAnnonce() when flagAnnonce != null:
return flagAnnonce(_that);case _AddFavorite() when addFavorite != null:
return addFavorite(_that);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that);case _LoadFavorites() when loadFavorites != null:
return loadFavorites(_that);case _CreateAlert() when createAlert != null:
return createAlert(_that);case _DeleteAlert() when deleteAlert != null:
return deleteAlert(_that);case _LoadAlertsByBuyer() when loadAlertsByBuyer != null:
return loadAlertsByBuyer(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AnnonceSearchRequestModel request,  int page,  int size)?  searchAnnonces,TResult Function( String id)?  loadAnnonceById,TResult Function( String sellerId,  int page,  int size)?  loadAnnoncesBySeller,TResult Function( Map<String, dynamic> body)?  createAnnonce,TResult Function( String id,  Map<String, dynamic> body)?  updateAnnonce,TResult Function( String id)?  deleteAnnonce,TResult Function( String id)?  suspendAnnonce,TResult Function( String id)?  reactivateAnnonce,TResult Function( String id)?  markAsSold,TResult Function( String id,  int durationDays)?  activateTopLot,TResult Function( String id,  Map<String, dynamic> body)?  flagAnnonce,TResult Function( String id)?  addFavorite,TResult Function( String id)?  removeFavorite,TResult Function( int page,  int size)?  loadFavorites,TResult Function( Map<String, dynamic> body)?  createAlert,TResult Function( String alertId)?  deleteAlert,TResult Function()?  loadAlertsByBuyer,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAnnonces() when searchAnnonces != null:
return searchAnnonces(_that.request,_that.page,_that.size);case _LoadAnnonceById() when loadAnnonceById != null:
return loadAnnonceById(_that.id);case _LoadAnnoncesBySeller() when loadAnnoncesBySeller != null:
return loadAnnoncesBySeller(_that.sellerId,_that.page,_that.size);case _CreateAnnonce() when createAnnonce != null:
return createAnnonce(_that.body);case _UpdateAnnonce() when updateAnnonce != null:
return updateAnnonce(_that.id,_that.body);case _DeleteAnnonce() when deleteAnnonce != null:
return deleteAnnonce(_that.id);case _SuspendAnnonce() when suspendAnnonce != null:
return suspendAnnonce(_that.id);case _ReactivateAnnonce() when reactivateAnnonce != null:
return reactivateAnnonce(_that.id);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that.id);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that.id,_that.durationDays);case _FlagAnnonce() when flagAnnonce != null:
return flagAnnonce(_that.id,_that.body);case _AddFavorite() when addFavorite != null:
return addFavorite(_that.id);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that.id);case _LoadFavorites() when loadFavorites != null:
return loadFavorites(_that.page,_that.size);case _CreateAlert() when createAlert != null:
return createAlert(_that.body);case _DeleteAlert() when deleteAlert != null:
return deleteAlert(_that.alertId);case _LoadAlertsByBuyer() when loadAlertsByBuyer != null:
return loadAlertsByBuyer();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AnnonceSearchRequestModel request,  int page,  int size)  searchAnnonces,required TResult Function( String id)  loadAnnonceById,required TResult Function( String sellerId,  int page,  int size)  loadAnnoncesBySeller,required TResult Function( Map<String, dynamic> body)  createAnnonce,required TResult Function( String id,  Map<String, dynamic> body)  updateAnnonce,required TResult Function( String id)  deleteAnnonce,required TResult Function( String id)  suspendAnnonce,required TResult Function( String id)  reactivateAnnonce,required TResult Function( String id)  markAsSold,required TResult Function( String id,  int durationDays)  activateTopLot,required TResult Function( String id,  Map<String, dynamic> body)  flagAnnonce,required TResult Function( String id)  addFavorite,required TResult Function( String id)  removeFavorite,required TResult Function( int page,  int size)  loadFavorites,required TResult Function( Map<String, dynamic> body)  createAlert,required TResult Function( String alertId)  deleteAlert,required TResult Function()  loadAlertsByBuyer,}) {final _that = this;
switch (_that) {
case _SearchAnnonces():
return searchAnnonces(_that.request,_that.page,_that.size);case _LoadAnnonceById():
return loadAnnonceById(_that.id);case _LoadAnnoncesBySeller():
return loadAnnoncesBySeller(_that.sellerId,_that.page,_that.size);case _CreateAnnonce():
return createAnnonce(_that.body);case _UpdateAnnonce():
return updateAnnonce(_that.id,_that.body);case _DeleteAnnonce():
return deleteAnnonce(_that.id);case _SuspendAnnonce():
return suspendAnnonce(_that.id);case _ReactivateAnnonce():
return reactivateAnnonce(_that.id);case _MarkAsSold():
return markAsSold(_that.id);case _ActivateTopLot():
return activateTopLot(_that.id,_that.durationDays);case _FlagAnnonce():
return flagAnnonce(_that.id,_that.body);case _AddFavorite():
return addFavorite(_that.id);case _RemoveFavorite():
return removeFavorite(_that.id);case _LoadFavorites():
return loadFavorites(_that.page,_that.size);case _CreateAlert():
return createAlert(_that.body);case _DeleteAlert():
return deleteAlert(_that.alertId);case _LoadAlertsByBuyer():
return loadAlertsByBuyer();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AnnonceSearchRequestModel request,  int page,  int size)?  searchAnnonces,TResult? Function( String id)?  loadAnnonceById,TResult? Function( String sellerId,  int page,  int size)?  loadAnnoncesBySeller,TResult? Function( Map<String, dynamic> body)?  createAnnonce,TResult? Function( String id,  Map<String, dynamic> body)?  updateAnnonce,TResult? Function( String id)?  deleteAnnonce,TResult? Function( String id)?  suspendAnnonce,TResult? Function( String id)?  reactivateAnnonce,TResult? Function( String id)?  markAsSold,TResult? Function( String id,  int durationDays)?  activateTopLot,TResult? Function( String id,  Map<String, dynamic> body)?  flagAnnonce,TResult? Function( String id)?  addFavorite,TResult? Function( String id)?  removeFavorite,TResult? Function( int page,  int size)?  loadFavorites,TResult? Function( Map<String, dynamic> body)?  createAlert,TResult? Function( String alertId)?  deleteAlert,TResult? Function()?  loadAlertsByBuyer,}) {final _that = this;
switch (_that) {
case _SearchAnnonces() when searchAnnonces != null:
return searchAnnonces(_that.request,_that.page,_that.size);case _LoadAnnonceById() when loadAnnonceById != null:
return loadAnnonceById(_that.id);case _LoadAnnoncesBySeller() when loadAnnoncesBySeller != null:
return loadAnnoncesBySeller(_that.sellerId,_that.page,_that.size);case _CreateAnnonce() when createAnnonce != null:
return createAnnonce(_that.body);case _UpdateAnnonce() when updateAnnonce != null:
return updateAnnonce(_that.id,_that.body);case _DeleteAnnonce() when deleteAnnonce != null:
return deleteAnnonce(_that.id);case _SuspendAnnonce() when suspendAnnonce != null:
return suspendAnnonce(_that.id);case _ReactivateAnnonce() when reactivateAnnonce != null:
return reactivateAnnonce(_that.id);case _MarkAsSold() when markAsSold != null:
return markAsSold(_that.id);case _ActivateTopLot() when activateTopLot != null:
return activateTopLot(_that.id,_that.durationDays);case _FlagAnnonce() when flagAnnonce != null:
return flagAnnonce(_that.id,_that.body);case _AddFavorite() when addFavorite != null:
return addFavorite(_that.id);case _RemoveFavorite() when removeFavorite != null:
return removeFavorite(_that.id);case _LoadFavorites() when loadFavorites != null:
return loadFavorites(_that.page,_that.size);case _CreateAlert() when createAlert != null:
return createAlert(_that.body);case _DeleteAlert() when deleteAlert != null:
return deleteAlert(_that.alertId);case _LoadAlertsByBuyer() when loadAlertsByBuyer != null:
return loadAlertsByBuyer();case _:
  return null;

}
}

}

/// @nodoc


class _SearchAnnonces implements AnnonceEvent {
  const _SearchAnnonces({required this.request, this.page = 0, this.size = 20});
  

 final  AnnonceSearchRequestModel request;
@JsonKey() final  int page;
@JsonKey() final  int size;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAnnoncesCopyWith<_SearchAnnonces> get copyWith => __$SearchAnnoncesCopyWithImpl<_SearchAnnonces>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAnnonces&&(identical(other.request, request) || other.request == request)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,request,page,size);

@override
String toString() {
  return 'AnnonceEvent.searchAnnonces(request: $request, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$SearchAnnoncesCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$SearchAnnoncesCopyWith(_SearchAnnonces value, $Res Function(_SearchAnnonces) _then) = __$SearchAnnoncesCopyWithImpl;
@useResult
$Res call({
 AnnonceSearchRequestModel request, int page, int size
});


$AnnonceSearchRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class __$SearchAnnoncesCopyWithImpl<$Res>
    implements _$SearchAnnoncesCopyWith<$Res> {
  __$SearchAnnoncesCopyWithImpl(this._self, this._then);

  final _SearchAnnonces _self;
  final $Res Function(_SearchAnnonces) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,Object? page = null,Object? size = null,}) {
  return _then(_SearchAnnonces(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AnnonceSearchRequestModel,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnonceSearchRequestModelCopyWith<$Res> get request {
  
  return $AnnonceSearchRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class _LoadAnnonceById implements AnnonceEvent {
  const _LoadAnnonceById(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadAnnonceByIdCopyWith<_LoadAnnonceById> get copyWith => __$LoadAnnonceByIdCopyWithImpl<_LoadAnnonceById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAnnonceById&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceEvent.loadAnnonceById(id: $id)';
}


}

/// @nodoc
abstract mixin class _$LoadAnnonceByIdCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$LoadAnnonceByIdCopyWith(_LoadAnnonceById value, $Res Function(_LoadAnnonceById) _then) = __$LoadAnnonceByIdCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$LoadAnnonceByIdCopyWithImpl<$Res>
    implements _$LoadAnnonceByIdCopyWith<$Res> {
  __$LoadAnnonceByIdCopyWithImpl(this._self, this._then);

  final _LoadAnnonceById _self;
  final $Res Function(_LoadAnnonceById) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_LoadAnnonceById(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadAnnoncesBySeller implements AnnonceEvent {
  const _LoadAnnoncesBySeller({required this.sellerId, this.page = 0, this.size = 20});
  

 final  String sellerId;
@JsonKey() final  int page;
@JsonKey() final  int size;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadAnnoncesBySellerCopyWith<_LoadAnnoncesBySeller> get copyWith => __$LoadAnnoncesBySellerCopyWithImpl<_LoadAnnoncesBySeller>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAnnoncesBySeller&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,sellerId,page,size);

@override
String toString() {
  return 'AnnonceEvent.loadAnnoncesBySeller(sellerId: $sellerId, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$LoadAnnoncesBySellerCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$LoadAnnoncesBySellerCopyWith(_LoadAnnoncesBySeller value, $Res Function(_LoadAnnoncesBySeller) _then) = __$LoadAnnoncesBySellerCopyWithImpl;
@useResult
$Res call({
 String sellerId, int page, int size
});




}
/// @nodoc
class __$LoadAnnoncesBySellerCopyWithImpl<$Res>
    implements _$LoadAnnoncesBySellerCopyWith<$Res> {
  __$LoadAnnoncesBySellerCopyWithImpl(this._self, this._then);

  final _LoadAnnoncesBySeller _self;
  final $Res Function(_LoadAnnoncesBySeller) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? page = null,Object? size = null,}) {
  return _then(_LoadAnnoncesBySeller(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateAnnonce implements AnnonceEvent {
  const _CreateAnnonce(final  Map<String, dynamic> body): _body = body;
  

 final  Map<String, dynamic> _body;
 Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAnnonceCopyWith<_CreateAnnonce> get copyWith => __$CreateAnnonceCopyWithImpl<_CreateAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAnnonce&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'AnnonceEvent.createAnnonce(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreateAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$CreateAnnonceCopyWith(_CreateAnnonce value, $Res Function(_CreateAnnonce) _then) = __$CreateAnnonceCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> body
});




}
/// @nodoc
class __$CreateAnnonceCopyWithImpl<$Res>
    implements _$CreateAnnonceCopyWith<$Res> {
  __$CreateAnnonceCopyWithImpl(this._self, this._then);

  final _CreateAnnonce _self;
  final $Res Function(_CreateAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreateAnnonce(
null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _UpdateAnnonce implements AnnonceEvent {
  const _UpdateAnnonce({required this.id, required final  Map<String, dynamic> body}): _body = body;
  

 final  String id;
 final  Map<String, dynamic> _body;
 Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAnnonceCopyWith<_UpdateAnnonce> get copyWith => __$UpdateAnnonceCopyWithImpl<_UpdateAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAnnonce&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'AnnonceEvent.updateAnnonce(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdateAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$UpdateAnnonceCopyWith(_UpdateAnnonce value, $Res Function(_UpdateAnnonce) _then) = __$UpdateAnnonceCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class __$UpdateAnnonceCopyWithImpl<$Res>
    implements _$UpdateAnnonceCopyWith<$Res> {
  __$UpdateAnnonceCopyWithImpl(this._self, this._then);

  final _UpdateAnnonce _self;
  final $Res Function(_UpdateAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_UpdateAnnonce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _DeleteAnnonce implements AnnonceEvent {
  const _DeleteAnnonce(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteAnnonceCopyWith<_DeleteAnnonce> get copyWith => __$DeleteAnnonceCopyWithImpl<_DeleteAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAnnonce&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceEvent.deleteAnnonce(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$DeleteAnnonceCopyWith(_DeleteAnnonce value, $Res Function(_DeleteAnnonce) _then) = __$DeleteAnnonceCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteAnnonceCopyWithImpl<$Res>
    implements _$DeleteAnnonceCopyWith<$Res> {
  __$DeleteAnnonceCopyWithImpl(this._self, this._then);

  final _DeleteAnnonce _self;
  final $Res Function(_DeleteAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteAnnonce(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SuspendAnnonce implements AnnonceEvent {
  const _SuspendAnnonce(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuspendAnnonceCopyWith<_SuspendAnnonce> get copyWith => __$SuspendAnnonceCopyWithImpl<_SuspendAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuspendAnnonce&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceEvent.suspendAnnonce(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SuspendAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$SuspendAnnonceCopyWith(_SuspendAnnonce value, $Res Function(_SuspendAnnonce) _then) = __$SuspendAnnonceCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$SuspendAnnonceCopyWithImpl<$Res>
    implements _$SuspendAnnonceCopyWith<$Res> {
  __$SuspendAnnonceCopyWithImpl(this._self, this._then);

  final _SuspendAnnonce _self;
  final $Res Function(_SuspendAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SuspendAnnonce(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ReactivateAnnonce implements AnnonceEvent {
  const _ReactivateAnnonce(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactivateAnnonceCopyWith<_ReactivateAnnonce> get copyWith => __$ReactivateAnnonceCopyWithImpl<_ReactivateAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactivateAnnonce&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AnnonceEvent.reactivateAnnonce(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ReactivateAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$ReactivateAnnonceCopyWith(_ReactivateAnnonce value, $Res Function(_ReactivateAnnonce) _then) = __$ReactivateAnnonceCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ReactivateAnnonceCopyWithImpl<$Res>
    implements _$ReactivateAnnonceCopyWith<$Res> {
  __$ReactivateAnnonceCopyWithImpl(this._self, this._then);

  final _ReactivateAnnonce _self;
  final $Res Function(_ReactivateAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ReactivateAnnonce(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MarkAsSold implements AnnonceEvent {
  const _MarkAsSold(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'AnnonceEvent.markAsSold(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MarkAsSoldCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$MarkAsSoldCopyWith(_MarkAsSold value, $Res Function(_MarkAsSold) _then) = __$MarkAsSoldCopyWithImpl;
@useResult
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

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MarkAsSold(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ActivateTopLot implements AnnonceEvent {
  const _ActivateTopLot({required this.id, required this.durationDays});
  

 final  String id;
 final  int durationDays;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'AnnonceEvent.activateTopLot(id: $id, durationDays: $durationDays)';
}


}

/// @nodoc
abstract mixin class _$ActivateTopLotCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$ActivateTopLotCopyWith(_ActivateTopLot value, $Res Function(_ActivateTopLot) _then) = __$ActivateTopLotCopyWithImpl;
@useResult
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

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? durationDays = null,}) {
  return _then(_ActivateTopLot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,durationDays: null == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FlagAnnonce implements AnnonceEvent {
  const _FlagAnnonce({required this.id, required final  Map<String, dynamic> body}): _body = body;
  

 final  String id;
 final  Map<String, dynamic> _body;
 Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlagAnnonceCopyWith<_FlagAnnonce> get copyWith => __$FlagAnnonceCopyWithImpl<_FlagAnnonce>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlagAnnonce&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'AnnonceEvent.flagAnnonce(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$FlagAnnonceCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$FlagAnnonceCopyWith(_FlagAnnonce value, $Res Function(_FlagAnnonce) _then) = __$FlagAnnonceCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class __$FlagAnnonceCopyWithImpl<$Res>
    implements _$FlagAnnonceCopyWith<$Res> {
  __$FlagAnnonceCopyWithImpl(this._self, this._then);

  final _FlagAnnonce _self;
  final $Res Function(_FlagAnnonce) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_FlagAnnonce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _AddFavorite implements AnnonceEvent {
  const _AddFavorite(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'AnnonceEvent.addFavorite(id: $id)';
}


}

/// @nodoc
abstract mixin class _$AddFavoriteCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$AddFavoriteCopyWith(_AddFavorite value, $Res Function(_AddFavorite) _then) = __$AddFavoriteCopyWithImpl;
@useResult
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

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_AddFavorite(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemoveFavorite implements AnnonceEvent {
  const _RemoveFavorite(this.id);
  

 final  String id;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'AnnonceEvent.removeFavorite(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RemoveFavoriteCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$RemoveFavoriteCopyWith(_RemoveFavorite value, $Res Function(_RemoveFavorite) _then) = __$RemoveFavoriteCopyWithImpl;
@useResult
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

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RemoveFavorite(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadFavorites implements AnnonceEvent {
  const _LoadFavorites({this.page = 0, this.size = 20});
  

@JsonKey() final  int page;
@JsonKey() final  int size;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadFavoritesCopyWith<_LoadFavorites> get copyWith => __$LoadFavoritesCopyWithImpl<_LoadFavorites>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadFavorites&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,page,size);

@override
String toString() {
  return 'AnnonceEvent.loadFavorites(page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$LoadFavoritesCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$LoadFavoritesCopyWith(_LoadFavorites value, $Res Function(_LoadFavorites) _then) = __$LoadFavoritesCopyWithImpl;
@useResult
$Res call({
 int page, int size
});




}
/// @nodoc
class __$LoadFavoritesCopyWithImpl<$Res>
    implements _$LoadFavoritesCopyWith<$Res> {
  __$LoadFavoritesCopyWithImpl(this._self, this._then);

  final _LoadFavorites _self;
  final $Res Function(_LoadFavorites) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? size = null,}) {
  return _then(_LoadFavorites(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateAlert implements AnnonceEvent {
  const _CreateAlert(final  Map<String, dynamic> body): _body = body;
  

 final  Map<String, dynamic> _body;
 Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAlertCopyWith<_CreateAlert> get copyWith => __$CreateAlertCopyWithImpl<_CreateAlert>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAlert&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'AnnonceEvent.createAlert(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreateAlertCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$CreateAlertCopyWith(_CreateAlert value, $Res Function(_CreateAlert) _then) = __$CreateAlertCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> body
});




}
/// @nodoc
class __$CreateAlertCopyWithImpl<$Res>
    implements _$CreateAlertCopyWith<$Res> {
  __$CreateAlertCopyWithImpl(this._self, this._then);

  final _CreateAlert _self;
  final $Res Function(_CreateAlert) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreateAlert(
null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _DeleteAlert implements AnnonceEvent {
  const _DeleteAlert(this.alertId);
  

 final  String alertId;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteAlertCopyWith<_DeleteAlert> get copyWith => __$DeleteAlertCopyWithImpl<_DeleteAlert>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAlert&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'AnnonceEvent.deleteAlert(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class _$DeleteAlertCopyWith<$Res> implements $AnnonceEventCopyWith<$Res> {
  factory _$DeleteAlertCopyWith(_DeleteAlert value, $Res Function(_DeleteAlert) _then) = __$DeleteAlertCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class __$DeleteAlertCopyWithImpl<$Res>
    implements _$DeleteAlertCopyWith<$Res> {
  __$DeleteAlertCopyWithImpl(this._self, this._then);

  final _DeleteAlert _self;
  final $Res Function(_DeleteAlert) _then;

/// Create a copy of AnnonceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(_DeleteAlert(
null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadAlertsByBuyer implements AnnonceEvent {
  const _LoadAlertsByBuyer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadAlertsByBuyer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceEvent.loadAlertsByBuyer()';
}


}




/// @nodoc
mixin _$AnnonceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceState()';
}


}

/// @nodoc
class $AnnonceStateCopyWith<$Res>  {
$AnnonceStateCopyWith(AnnonceState _, $Res Function(AnnonceState) __);
}


/// Adds pattern-matching-related methods to [AnnonceState].
extension AnnonceStatePatterns on AnnonceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _AnnonceListLoaded value)?  annonceListLoaded,TResult Function( _AnnonceDetailLoaded value)?  annonceDetailLoaded,TResult Function( _AnnonceCreated value)?  annonceCreated,TResult Function( _AnnonceUpdated value)?  annonceUpdated,TResult Function( _AnnonceDeleted value)?  annonceDeleted,TResult Function( _ActionSuccess value)?  actionSuccess,TResult Function( _FavoritesLoaded value)?  favoritesLoaded,TResult Function( _AlertsLoaded value)?  alertsLoaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _AnnonceListLoaded() when annonceListLoaded != null:
return annonceListLoaded(_that);case _AnnonceDetailLoaded() when annonceDetailLoaded != null:
return annonceDetailLoaded(_that);case _AnnonceCreated() when annonceCreated != null:
return annonceCreated(_that);case _AnnonceUpdated() when annonceUpdated != null:
return annonceUpdated(_that);case _AnnonceDeleted() when annonceDeleted != null:
return annonceDeleted(_that);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _FavoritesLoaded() when favoritesLoaded != null:
return favoritesLoaded(_that);case _AlertsLoaded() when alertsLoaded != null:
return alertsLoaded(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _AnnonceListLoaded value)  annonceListLoaded,required TResult Function( _AnnonceDetailLoaded value)  annonceDetailLoaded,required TResult Function( _AnnonceCreated value)  annonceCreated,required TResult Function( _AnnonceUpdated value)  annonceUpdated,required TResult Function( _AnnonceDeleted value)  annonceDeleted,required TResult Function( _ActionSuccess value)  actionSuccess,required TResult Function( _FavoritesLoaded value)  favoritesLoaded,required TResult Function( _AlertsLoaded value)  alertsLoaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _AnnonceListLoaded():
return annonceListLoaded(_that);case _AnnonceDetailLoaded():
return annonceDetailLoaded(_that);case _AnnonceCreated():
return annonceCreated(_that);case _AnnonceUpdated():
return annonceUpdated(_that);case _AnnonceDeleted():
return annonceDeleted(_that);case _ActionSuccess():
return actionSuccess(_that);case _FavoritesLoaded():
return favoritesLoaded(_that);case _AlertsLoaded():
return alertsLoaded(_that);case _Failure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _AnnonceListLoaded value)?  annonceListLoaded,TResult? Function( _AnnonceDetailLoaded value)?  annonceDetailLoaded,TResult? Function( _AnnonceCreated value)?  annonceCreated,TResult? Function( _AnnonceUpdated value)?  annonceUpdated,TResult? Function( _AnnonceDeleted value)?  annonceDeleted,TResult? Function( _ActionSuccess value)?  actionSuccess,TResult? Function( _FavoritesLoaded value)?  favoritesLoaded,TResult? Function( _AlertsLoaded value)?  alertsLoaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _AnnonceListLoaded() when annonceListLoaded != null:
return annonceListLoaded(_that);case _AnnonceDetailLoaded() when annonceDetailLoaded != null:
return annonceDetailLoaded(_that);case _AnnonceCreated() when annonceCreated != null:
return annonceCreated(_that);case _AnnonceUpdated() when annonceUpdated != null:
return annonceUpdated(_that);case _AnnonceDeleted() when annonceDeleted != null:
return annonceDeleted(_that);case _ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _FavoritesLoaded() when favoritesLoaded != null:
return favoritesLoaded(_that);case _AlertsLoaded() when alertsLoaded != null:
return alertsLoaded(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PaginatedResponse<Annonce> annonces)?  annonceListLoaded,TResult Function( Annonce annonce)?  annonceDetailLoaded,TResult Function( Annonce annonce)?  annonceCreated,TResult Function( Annonce annonce)?  annonceUpdated,TResult Function()?  annonceDeleted,TResult Function()?  actionSuccess,TResult Function( PaginatedResponse<Annonce> favorites)?  favoritesLoaded,TResult Function( List<Map<String, dynamic>> alerts)?  alertsLoaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _AnnonceListLoaded() when annonceListLoaded != null:
return annonceListLoaded(_that.annonces);case _AnnonceDetailLoaded() when annonceDetailLoaded != null:
return annonceDetailLoaded(_that.annonce);case _AnnonceCreated() when annonceCreated != null:
return annonceCreated(_that.annonce);case _AnnonceUpdated() when annonceUpdated != null:
return annonceUpdated(_that.annonce);case _AnnonceDeleted() when annonceDeleted != null:
return annonceDeleted();case _ActionSuccess() when actionSuccess != null:
return actionSuccess();case _FavoritesLoaded() when favoritesLoaded != null:
return favoritesLoaded(_that.favorites);case _AlertsLoaded() when alertsLoaded != null:
return alertsLoaded(_that.alerts);case _Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PaginatedResponse<Annonce> annonces)  annonceListLoaded,required TResult Function( Annonce annonce)  annonceDetailLoaded,required TResult Function( Annonce annonce)  annonceCreated,required TResult Function( Annonce annonce)  annonceUpdated,required TResult Function()  annonceDeleted,required TResult Function()  actionSuccess,required TResult Function( PaginatedResponse<Annonce> favorites)  favoritesLoaded,required TResult Function( List<Map<String, dynamic>> alerts)  alertsLoaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _AnnonceListLoaded():
return annonceListLoaded(_that.annonces);case _AnnonceDetailLoaded():
return annonceDetailLoaded(_that.annonce);case _AnnonceCreated():
return annonceCreated(_that.annonce);case _AnnonceUpdated():
return annonceUpdated(_that.annonce);case _AnnonceDeleted():
return annonceDeleted();case _ActionSuccess():
return actionSuccess();case _FavoritesLoaded():
return favoritesLoaded(_that.favorites);case _AlertsLoaded():
return alertsLoaded(_that.alerts);case _Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PaginatedResponse<Annonce> annonces)?  annonceListLoaded,TResult? Function( Annonce annonce)?  annonceDetailLoaded,TResult? Function( Annonce annonce)?  annonceCreated,TResult? Function( Annonce annonce)?  annonceUpdated,TResult? Function()?  annonceDeleted,TResult? Function()?  actionSuccess,TResult? Function( PaginatedResponse<Annonce> favorites)?  favoritesLoaded,TResult? Function( List<Map<String, dynamic>> alerts)?  alertsLoaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _AnnonceListLoaded() when annonceListLoaded != null:
return annonceListLoaded(_that.annonces);case _AnnonceDetailLoaded() when annonceDetailLoaded != null:
return annonceDetailLoaded(_that.annonce);case _AnnonceCreated() when annonceCreated != null:
return annonceCreated(_that.annonce);case _AnnonceUpdated() when annonceUpdated != null:
return annonceUpdated(_that.annonce);case _AnnonceDeleted() when annonceDeleted != null:
return annonceDeleted();case _ActionSuccess() when actionSuccess != null:
return actionSuccess();case _FavoritesLoaded() when favoritesLoaded != null:
return favoritesLoaded(_that.favorites);case _AlertsLoaded() when alertsLoaded != null:
return alertsLoaded(_that.alerts);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AnnonceState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceState.initial()';
}


}




/// @nodoc


class _Loading implements AnnonceState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceState.loading()';
}


}




/// @nodoc


class _AnnonceListLoaded implements AnnonceState {
  const _AnnonceListLoaded(this.annonces);
  

 final  PaginatedResponse<Annonce> annonces;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceListLoadedCopyWith<_AnnonceListLoaded> get copyWith => __$AnnonceListLoadedCopyWithImpl<_AnnonceListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceListLoaded&&(identical(other.annonces, annonces) || other.annonces == annonces));
}


@override
int get hashCode => Object.hash(runtimeType,annonces);

@override
String toString() {
  return 'AnnonceState.annonceListLoaded(annonces: $annonces)';
}


}

/// @nodoc
abstract mixin class _$AnnonceListLoadedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$AnnonceListLoadedCopyWith(_AnnonceListLoaded value, $Res Function(_AnnonceListLoaded) _then) = __$AnnonceListLoadedCopyWithImpl;
@useResult
$Res call({
 PaginatedResponse<Annonce> annonces
});




}
/// @nodoc
class __$AnnonceListLoadedCopyWithImpl<$Res>
    implements _$AnnonceListLoadedCopyWith<$Res> {
  __$AnnonceListLoadedCopyWithImpl(this._self, this._then);

  final _AnnonceListLoaded _self;
  final $Res Function(_AnnonceListLoaded) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonces = null,}) {
  return _then(_AnnonceListLoaded(
null == annonces ? _self.annonces : annonces // ignore: cast_nullable_to_non_nullable
as PaginatedResponse<Annonce>,
  ));
}


}

/// @nodoc


class _AnnonceDetailLoaded implements AnnonceState {
  const _AnnonceDetailLoaded(this.annonce);
  

 final  Annonce annonce;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceDetailLoadedCopyWith<_AnnonceDetailLoaded> get copyWith => __$AnnonceDetailLoadedCopyWithImpl<_AnnonceDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceDetailLoaded&&(identical(other.annonce, annonce) || other.annonce == annonce));
}


@override
int get hashCode => Object.hash(runtimeType,annonce);

@override
String toString() {
  return 'AnnonceState.annonceDetailLoaded(annonce: $annonce)';
}


}

/// @nodoc
abstract mixin class _$AnnonceDetailLoadedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$AnnonceDetailLoadedCopyWith(_AnnonceDetailLoaded value, $Res Function(_AnnonceDetailLoaded) _then) = __$AnnonceDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Annonce annonce
});


$AnnonceCopyWith<$Res> get annonce;

}
/// @nodoc
class __$AnnonceDetailLoadedCopyWithImpl<$Res>
    implements _$AnnonceDetailLoadedCopyWith<$Res> {
  __$AnnonceDetailLoadedCopyWithImpl(this._self, this._then);

  final _AnnonceDetailLoaded _self;
  final $Res Function(_AnnonceDetailLoaded) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonce = null,}) {
  return _then(_AnnonceDetailLoaded(
null == annonce ? _self.annonce : annonce // ignore: cast_nullable_to_non_nullable
as Annonce,
  ));
}

/// Create a copy of AnnonceState
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


class _AnnonceCreated implements AnnonceState {
  const _AnnonceCreated(this.annonce);
  

 final  Annonce annonce;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceCreatedCopyWith<_AnnonceCreated> get copyWith => __$AnnonceCreatedCopyWithImpl<_AnnonceCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceCreated&&(identical(other.annonce, annonce) || other.annonce == annonce));
}


@override
int get hashCode => Object.hash(runtimeType,annonce);

@override
String toString() {
  return 'AnnonceState.annonceCreated(annonce: $annonce)';
}


}

/// @nodoc
abstract mixin class _$AnnonceCreatedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$AnnonceCreatedCopyWith(_AnnonceCreated value, $Res Function(_AnnonceCreated) _then) = __$AnnonceCreatedCopyWithImpl;
@useResult
$Res call({
 Annonce annonce
});


$AnnonceCopyWith<$Res> get annonce;

}
/// @nodoc
class __$AnnonceCreatedCopyWithImpl<$Res>
    implements _$AnnonceCreatedCopyWith<$Res> {
  __$AnnonceCreatedCopyWithImpl(this._self, this._then);

  final _AnnonceCreated _self;
  final $Res Function(_AnnonceCreated) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonce = null,}) {
  return _then(_AnnonceCreated(
null == annonce ? _self.annonce : annonce // ignore: cast_nullable_to_non_nullable
as Annonce,
  ));
}

/// Create a copy of AnnonceState
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


class _AnnonceUpdated implements AnnonceState {
  const _AnnonceUpdated(this.annonce);
  

 final  Annonce annonce;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceUpdatedCopyWith<_AnnonceUpdated> get copyWith => __$AnnonceUpdatedCopyWithImpl<_AnnonceUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceUpdated&&(identical(other.annonce, annonce) || other.annonce == annonce));
}


@override
int get hashCode => Object.hash(runtimeType,annonce);

@override
String toString() {
  return 'AnnonceState.annonceUpdated(annonce: $annonce)';
}


}

/// @nodoc
abstract mixin class _$AnnonceUpdatedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$AnnonceUpdatedCopyWith(_AnnonceUpdated value, $Res Function(_AnnonceUpdated) _then) = __$AnnonceUpdatedCopyWithImpl;
@useResult
$Res call({
 Annonce annonce
});


$AnnonceCopyWith<$Res> get annonce;

}
/// @nodoc
class __$AnnonceUpdatedCopyWithImpl<$Res>
    implements _$AnnonceUpdatedCopyWith<$Res> {
  __$AnnonceUpdatedCopyWithImpl(this._self, this._then);

  final _AnnonceUpdated _self;
  final $Res Function(_AnnonceUpdated) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? annonce = null,}) {
  return _then(_AnnonceUpdated(
null == annonce ? _self.annonce : annonce // ignore: cast_nullable_to_non_nullable
as Annonce,
  ));
}

/// Create a copy of AnnonceState
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


class _AnnonceDeleted implements AnnonceState {
  const _AnnonceDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceState.annonceDeleted()';
}


}




/// @nodoc


class _ActionSuccess implements AnnonceState {
  const _ActionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceState.actionSuccess()';
}


}




/// @nodoc


class _FavoritesLoaded implements AnnonceState {
  const _FavoritesLoaded(this.favorites);
  

 final  PaginatedResponse<Annonce> favorites;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesLoadedCopyWith<_FavoritesLoaded> get copyWith => __$FavoritesLoadedCopyWithImpl<_FavoritesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesLoaded&&(identical(other.favorites, favorites) || other.favorites == favorites));
}


@override
int get hashCode => Object.hash(runtimeType,favorites);

@override
String toString() {
  return 'AnnonceState.favoritesLoaded(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class _$FavoritesLoadedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$FavoritesLoadedCopyWith(_FavoritesLoaded value, $Res Function(_FavoritesLoaded) _then) = __$FavoritesLoadedCopyWithImpl;
@useResult
$Res call({
 PaginatedResponse<Annonce> favorites
});




}
/// @nodoc
class __$FavoritesLoadedCopyWithImpl<$Res>
    implements _$FavoritesLoadedCopyWith<$Res> {
  __$FavoritesLoadedCopyWithImpl(this._self, this._then);

  final _FavoritesLoaded _self;
  final $Res Function(_FavoritesLoaded) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favorites = null,}) {
  return _then(_FavoritesLoaded(
null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as PaginatedResponse<Annonce>,
  ));
}


}

/// @nodoc


class _AlertsLoaded implements AnnonceState {
  const _AlertsLoaded(final  List<Map<String, dynamic>> alerts): _alerts = alerts;
  

 final  List<Map<String, dynamic>> _alerts;
 List<Map<String, dynamic>> get alerts {
  if (_alerts is EqualUnmodifiableListView) return _alerts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alerts);
}


/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertsLoadedCopyWith<_AlertsLoaded> get copyWith => __$AlertsLoadedCopyWithImpl<_AlertsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertsLoaded&&const DeepCollectionEquality().equals(other._alerts, _alerts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_alerts));

@override
String toString() {
  return 'AnnonceState.alertsLoaded(alerts: $alerts)';
}


}

/// @nodoc
abstract mixin class _$AlertsLoadedCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
  factory _$AlertsLoadedCopyWith(_AlertsLoaded value, $Res Function(_AlertsLoaded) _then) = __$AlertsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> alerts
});




}
/// @nodoc
class __$AlertsLoadedCopyWithImpl<$Res>
    implements _$AlertsLoadedCopyWith<$Res> {
  __$AlertsLoadedCopyWithImpl(this._self, this._then);

  final _AlertsLoaded _self;
  final $Res Function(_AlertsLoaded) _then;

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alerts = null,}) {
  return _then(_AlertsLoaded(
null == alerts ? _self._alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class _Failure implements AnnonceState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of AnnonceState
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
  return 'AnnonceState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AnnonceStateCopyWith<$Res> {
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

/// Create a copy of AnnonceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
