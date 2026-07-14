// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_annonce.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteAnnonceParams {

 String get id;
/// Create a copy of DeleteAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAnnonceParamsCopyWith<DeleteAnnonceParams> get copyWith => _$DeleteAnnonceParamsCopyWithImpl<DeleteAnnonceParams>(this as DeleteAnnonceParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAnnonceParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DeleteAnnonceParams(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteAnnonceParamsCopyWith<$Res>  {
  factory $DeleteAnnonceParamsCopyWith(DeleteAnnonceParams value, $Res Function(DeleteAnnonceParams) _then) = _$DeleteAnnonceParamsCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$DeleteAnnonceParamsCopyWithImpl<$Res>
    implements $DeleteAnnonceParamsCopyWith<$Res> {
  _$DeleteAnnonceParamsCopyWithImpl(this._self, this._then);

  final DeleteAnnonceParams _self;
  final $Res Function(DeleteAnnonceParams) _then;

/// Create a copy of DeleteAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteAnnonceParams].
extension DeleteAnnonceParamsPatterns on DeleteAnnonceParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteAnnonceParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteAnnonceParams value)  $default,){
final _that = this;
switch (_that) {
case _DeleteAnnonceParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteAnnonceParams value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteAnnonceParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteAnnonceParams() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _DeleteAnnonceParams():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _DeleteAnnonceParams() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _DeleteAnnonceParams implements DeleteAnnonceParams {
  const _DeleteAnnonceParams({required this.id});
  

@override final  String id;

/// Create a copy of DeleteAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteAnnonceParamsCopyWith<_DeleteAnnonceParams> get copyWith => __$DeleteAnnonceParamsCopyWithImpl<_DeleteAnnonceParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAnnonceParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DeleteAnnonceParams(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteAnnonceParamsCopyWith<$Res> implements $DeleteAnnonceParamsCopyWith<$Res> {
  factory _$DeleteAnnonceParamsCopyWith(_DeleteAnnonceParams value, $Res Function(_DeleteAnnonceParams) _then) = __$DeleteAnnonceParamsCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeleteAnnonceParamsCopyWithImpl<$Res>
    implements _$DeleteAnnonceParamsCopyWith<$Res> {
  __$DeleteAnnonceParamsCopyWithImpl(this._self, this._then);

  final _DeleteAnnonceParams _self;
  final $Res Function(_DeleteAnnonceParams) _then;

/// Create a copy of DeleteAnnonceParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteAnnonceParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
