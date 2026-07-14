// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddFavoriteParams {

 String get id;
/// Create a copy of AddFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFavoriteParamsCopyWith<AddFavoriteParams> get copyWith => _$AddFavoriteParamsCopyWithImpl<AddFavoriteParams>(this as AddFavoriteParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFavoriteParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AddFavoriteParams(id: $id)';
}


}

/// @nodoc
abstract mixin class $AddFavoriteParamsCopyWith<$Res>  {
  factory $AddFavoriteParamsCopyWith(AddFavoriteParams value, $Res Function(AddFavoriteParams) _then) = _$AddFavoriteParamsCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$AddFavoriteParamsCopyWithImpl<$Res>
    implements $AddFavoriteParamsCopyWith<$Res> {
  _$AddFavoriteParamsCopyWithImpl(this._self, this._then);

  final AddFavoriteParams _self;
  final $Res Function(AddFavoriteParams) _then;

/// Create a copy of AddFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddFavoriteParams].
extension AddFavoriteParamsPatterns on AddFavoriteParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddFavoriteParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddFavoriteParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddFavoriteParams value)  $default,){
final _that = this;
switch (_that) {
case _AddFavoriteParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddFavoriteParams value)?  $default,){
final _that = this;
switch (_that) {
case _AddFavoriteParams() when $default != null:
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
case _AddFavoriteParams() when $default != null:
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
case _AddFavoriteParams():
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
case _AddFavoriteParams() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _AddFavoriteParams implements AddFavoriteParams {
  const _AddFavoriteParams({required this.id});
  

@override final  String id;

/// Create a copy of AddFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFavoriteParamsCopyWith<_AddFavoriteParams> get copyWith => __$AddFavoriteParamsCopyWithImpl<_AddFavoriteParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddFavoriteParams&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AddFavoriteParams(id: $id)';
}


}

/// @nodoc
abstract mixin class _$AddFavoriteParamsCopyWith<$Res> implements $AddFavoriteParamsCopyWith<$Res> {
  factory _$AddFavoriteParamsCopyWith(_AddFavoriteParams value, $Res Function(_AddFavoriteParams) _then) = __$AddFavoriteParamsCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$AddFavoriteParamsCopyWithImpl<$Res>
    implements _$AddFavoriteParamsCopyWith<$Res> {
  __$AddFavoriteParamsCopyWithImpl(this._self, this._then);

  final _AddFavoriteParams _self;
  final $Res Function(_AddFavoriteParams) _then;

/// Create a copy of AddFavoriteParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_AddFavoriteParams(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
