// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateAnnonceParams {

 String get id; Map<String, dynamic> get body;
/// Create a copy of UpdateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAnnonceParamsCopyWith<UpdateAnnonceParams> get copyWith => _$UpdateAnnonceParamsCopyWithImpl<UpdateAnnonceParams>(this as UpdateAnnonceParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAnnonceParams&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.body, body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(body));

@override
String toString() {
  return 'UpdateAnnonceParams(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class $UpdateAnnonceParamsCopyWith<$Res>  {
  factory $UpdateAnnonceParamsCopyWith(UpdateAnnonceParams value, $Res Function(UpdateAnnonceParams) _then) = _$UpdateAnnonceParamsCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class _$UpdateAnnonceParamsCopyWithImpl<$Res>
    implements $UpdateAnnonceParamsCopyWith<$Res> {
  _$UpdateAnnonceParamsCopyWithImpl(this._self, this._then);

  final UpdateAnnonceParams _self;
  final $Res Function(UpdateAnnonceParams) _then;

/// Create a copy of UpdateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAnnonceParams].
extension UpdateAnnonceParamsPatterns on UpdateAnnonceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAnnonceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAnnonceParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAnnonceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAnnonceParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAnnonceParams() when $default != null:
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
case _UpdateAnnonceParams() when $default != null:
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
case _UpdateAnnonceParams():
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
case _UpdateAnnonceParams() when $default != null:
return $default(_that.id,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateAnnonceParams implements UpdateAnnonceParams {
  const _UpdateAnnonceParams({required this.id, required final  Map<String, dynamic> body}): _body = body;
  

@override final  String id;
 final  Map<String, dynamic> _body;
@override Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of UpdateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAnnonceParamsCopyWith<_UpdateAnnonceParams> get copyWith => __$UpdateAnnonceParamsCopyWithImpl<_UpdateAnnonceParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAnnonceParams&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'UpdateAnnonceParams(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdateAnnonceParamsCopyWith<$Res> implements $UpdateAnnonceParamsCopyWith<$Res> {
  factory _$UpdateAnnonceParamsCopyWith(_UpdateAnnonceParams value, $Res Function(_UpdateAnnonceParams) _then) = __$UpdateAnnonceParamsCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic> body
});




}
/// @nodoc
class __$UpdateAnnonceParamsCopyWithImpl<$Res>
    implements _$UpdateAnnonceParamsCopyWith<$Res> {
  __$UpdateAnnonceParamsCopyWithImpl(this._self, this._then);

  final _UpdateAnnonceParams _self;
  final $Res Function(_UpdateAnnonceParams) _then;

/// Create a copy of UpdateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_UpdateAnnonceParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
