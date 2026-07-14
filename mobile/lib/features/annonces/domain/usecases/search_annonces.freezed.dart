// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_annonces.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchAnnoncesParams {

 AnnonceSearchRequestModel get request; int get page; int get size;
/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAnnoncesParamsCopyWith<SearchAnnoncesParams> get copyWith => _$SearchAnnoncesParamsCopyWithImpl<SearchAnnoncesParams>(this as SearchAnnoncesParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAnnoncesParams&&(identical(other.request, request) || other.request == request)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,request,page,size);

@override
String toString() {
  return 'SearchAnnoncesParams(request: $request, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $SearchAnnoncesParamsCopyWith<$Res>  {
  factory $SearchAnnoncesParamsCopyWith(SearchAnnoncesParams value, $Res Function(SearchAnnoncesParams) _then) = _$SearchAnnoncesParamsCopyWithImpl;
@useResult
$Res call({
 AnnonceSearchRequestModel request, int page, int size
});


$AnnonceSearchRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class _$SearchAnnoncesParamsCopyWithImpl<$Res>
    implements $SearchAnnoncesParamsCopyWith<$Res> {
  _$SearchAnnoncesParamsCopyWithImpl(this._self, this._then);

  final SearchAnnoncesParams _self;
  final $Res Function(SearchAnnoncesParams) _then;

/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AnnonceSearchRequestModel,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnonceSearchRequestModelCopyWith<$Res> get request {
  
  return $AnnonceSearchRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchAnnoncesParams].
extension SearchAnnoncesParamsPatterns on SearchAnnoncesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchAnnoncesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAnnoncesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchAnnoncesParams value)  $default,){
final _that = this;
switch (_that) {
case _SearchAnnoncesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchAnnoncesParams value)?  $default,){
final _that = this;
switch (_that) {
case _SearchAnnoncesParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnnonceSearchRequestModel request,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAnnoncesParams() when $default != null:
return $default(_that.request,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnnonceSearchRequestModel request,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _SearchAnnoncesParams():
return $default(_that.request,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnnonceSearchRequestModel request,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _SearchAnnoncesParams() when $default != null:
return $default(_that.request,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc


class _SearchAnnoncesParams implements SearchAnnoncesParams {
  const _SearchAnnoncesParams({required this.request, this.page = 0, this.size = 20});
  

@override final  AnnonceSearchRequestModel request;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAnnoncesParamsCopyWith<_SearchAnnoncesParams> get copyWith => __$SearchAnnoncesParamsCopyWithImpl<_SearchAnnoncesParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAnnoncesParams&&(identical(other.request, request) || other.request == request)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,request,page,size);

@override
String toString() {
  return 'SearchAnnoncesParams(request: $request, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$SearchAnnoncesParamsCopyWith<$Res> implements $SearchAnnoncesParamsCopyWith<$Res> {
  factory _$SearchAnnoncesParamsCopyWith(_SearchAnnoncesParams value, $Res Function(_SearchAnnoncesParams) _then) = __$SearchAnnoncesParamsCopyWithImpl;
@override @useResult
$Res call({
 AnnonceSearchRequestModel request, int page, int size
});


@override $AnnonceSearchRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class __$SearchAnnoncesParamsCopyWithImpl<$Res>
    implements _$SearchAnnoncesParamsCopyWith<$Res> {
  __$SearchAnnoncesParamsCopyWithImpl(this._self, this._then);

  final _SearchAnnoncesParams _self;
  final $Res Function(_SearchAnnoncesParams) _then;

/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,Object? page = null,Object? size = null,}) {
  return _then(_SearchAnnoncesParams(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AnnonceSearchRequestModel,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SearchAnnoncesParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnonceSearchRequestModelCopyWith<$Res> get request {
  
  return $AnnonceSearchRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
