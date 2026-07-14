// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAnnonceParams {

 Map<String, dynamic> get body;
/// Create a copy of CreateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAnnonceParamsCopyWith<CreateAnnonceParams> get copyWith => _$CreateAnnonceParamsCopyWithImpl<CreateAnnonceParams>(this as CreateAnnonceParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAnnonceParams&&const DeepCollectionEquality().equals(other.body, body));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(body));

@override
String toString() {
  return 'CreateAnnonceParams(body: $body)';
}


}

/// @nodoc
abstract mixin class $CreateAnnonceParamsCopyWith<$Res>  {
  factory $CreateAnnonceParamsCopyWith(CreateAnnonceParams value, $Res Function(CreateAnnonceParams) _then) = _$CreateAnnonceParamsCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> body
});




}
/// @nodoc
class _$CreateAnnonceParamsCopyWithImpl<$Res>
    implements $CreateAnnonceParamsCopyWith<$Res> {
  _$CreateAnnonceParamsCopyWithImpl(this._self, this._then);

  final CreateAnnonceParams _self;
  final $Res Function(CreateAnnonceParams) _then;

/// Create a copy of CreateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? body = null,}) {
  return _then(_self.copyWith(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAnnonceParams].
extension CreateAnnonceParamsPatterns on CreateAnnonceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAnnonceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAnnonceParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateAnnonceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAnnonceParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAnnonceParams() when $default != null:
return $default(_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> body)  $default,) {final _that = this;
switch (_that) {
case _CreateAnnonceParams():
return $default(_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> body)?  $default,) {final _that = this;
switch (_that) {
case _CreateAnnonceParams() when $default != null:
return $default(_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _CreateAnnonceParams implements CreateAnnonceParams {
  const _CreateAnnonceParams({required final  Map<String, dynamic> body}): _body = body;
  

 final  Map<String, dynamic> _body;
@override Map<String, dynamic> get body {
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_body);
}


/// Create a copy of CreateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAnnonceParamsCopyWith<_CreateAnnonceParams> get copyWith => __$CreateAnnonceParamsCopyWithImpl<_CreateAnnonceParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAnnonceParams&&const DeepCollectionEquality().equals(other._body, _body));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'CreateAnnonceParams(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreateAnnonceParamsCopyWith<$Res> implements $CreateAnnonceParamsCopyWith<$Res> {
  factory _$CreateAnnonceParamsCopyWith(_CreateAnnonceParams value, $Res Function(_CreateAnnonceParams) _then) = __$CreateAnnonceParamsCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> body
});




}
/// @nodoc
class __$CreateAnnonceParamsCopyWithImpl<$Res>
    implements _$CreateAnnonceParamsCopyWith<$Res> {
  __$CreateAnnonceParamsCopyWithImpl(this._self, this._then);

  final _CreateAnnonceParams _self;
  final $Res Function(_CreateAnnonceParams) _then;

/// Create a copy of CreateAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreateAnnonceParams(
body: null == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
