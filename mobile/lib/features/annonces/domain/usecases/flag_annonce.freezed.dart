// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flag_annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlagAnnonceParams {

 String get id; Map<String, dynamic> get body;
/// Create a copy of FlagAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlagAnnonceParamsCopyWith<FlagAnnonceParams> get copyWith => _$FlagAnnonceParamsCopyWithImpl<FlagAnnonceParams>(this as FlagAnnonceParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlagAnnonceParams&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.body, body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(body));

@override
String toString() {
  return 'FlagAnnonceParams(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class $FlagAnnonceParamsCopyWith<$Res>  {
  factory $FlagAnnonceParamsCopyWith(FlagAnnonceParams value, $Res Function(FlagAnnonceParams) _then) = _$FlagAnnonceParamsCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class _$FlagAnnonceParamsCopyWithImpl<$Res>
    implements $FlagAnnonceParamsCopyWith<$Res> {
  _$FlagAnnonceParamsCopyWithImpl(this._self, this._then);

  final FlagAnnonceParams _self;
  final $Res Function(FlagAnnonceParams) _then;

/// Create a copy of FlagAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [FlagAnnonceParams].
extension FlagAnnonceParamsPatterns on FlagAnnonceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlagAnnonceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlagAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlagAnnonceParams value)  $default,){
final _that = this;
switch (_that) {
case _FlagAnnonceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlagAnnonceParams value)?  $default,){
final _that = this;
switch (_that) {
case _FlagAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic> body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlagAnnonceParams() when $default != null:
return $default(_that.id,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic> body)  $default,) {final _that = this;
switch (_that) {
case _FlagAnnonceParams():
return $default(_that.id,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, dynamic> body)?  $default,) {final _that = this;
switch (_that) {
case _FlagAnnonceParams() when $default != null:
return $default(_that.id,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _FlagAnnonceParams implements FlagAnnonceParams {
  const _FlagAnnonceParams({required this.id, required final  Map<String, dynamic> body}): _body = body;
  

@override final  String id;
 final  Map<String, dynamic> _body;
@override Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of FlagAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlagAnnonceParamsCopyWith<_FlagAnnonceParams> get copyWith => __$FlagAnnonceParamsCopyWithImpl<_FlagAnnonceParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlagAnnonceParams&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'FlagAnnonceParams(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$FlagAnnonceParamsCopyWith<$Res> implements $FlagAnnonceParamsCopyWith<$Res> {
  factory _$FlagAnnonceParamsCopyWith(_FlagAnnonceParams value, $Res Function(_FlagAnnonceParams) _then) = __$FlagAnnonceParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class __$FlagAnnonceParamsCopyWithImpl<$Res>
    implements _$FlagAnnonceParamsCopyWith<$Res> {
  __$FlagAnnonceParamsCopyWithImpl(this._self, this._then);

  final _FlagAnnonceParams _self;
  final $Res Function(_FlagAnnonceParams) _then;

/// Create a copy of FlagAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_FlagAnnonceParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
