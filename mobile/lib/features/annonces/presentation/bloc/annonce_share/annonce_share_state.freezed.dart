// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_share_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnnonceShareState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceShareState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceShareState()';
}


}

/// @nodoc
class $AnnonceShareStateCopyWith<$Res>  {
$AnnonceShareStateCopyWith(AnnonceShareState _, $Res Function(AnnonceShareState) __);
}


/// Adds pattern-matching-related methods to [AnnonceShareState].
extension AnnonceShareStatePatterns on AnnonceShareState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Sharing value)?  sharing,TResult Function( _Shared value)?  shared,TResult Function( _LinkCopied value)?  linkCopied,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Sharing() when sharing != null:
return sharing(_that);case _Shared() when shared != null:
return shared(_that);case _LinkCopied() when linkCopied != null:
return linkCopied(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Sharing value)  sharing,required TResult Function( _Shared value)  shared,required TResult Function( _LinkCopied value)  linkCopied,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Sharing():
return sharing(_that);case _Shared():
return shared(_that);case _LinkCopied():
return linkCopied(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Sharing value)?  sharing,TResult? Function( _Shared value)?  shared,TResult? Function( _LinkCopied value)?  linkCopied,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Sharing() when sharing != null:
return sharing(_that);case _Shared() when shared != null:
return shared(_that);case _LinkCopied() when linkCopied != null:
return linkCopied(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sharing,TResult Function( SharePayload payload)?  shared,TResult Function( String link)?  linkCopied,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Sharing() when sharing != null:
return sharing();case _Shared() when shared != null:
return shared(_that.payload);case _LinkCopied() when linkCopied != null:
return linkCopied(_that.link);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sharing,required TResult Function( SharePayload payload)  shared,required TResult Function( String link)  linkCopied,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Sharing():
return sharing();case _Shared():
return shared(_that.payload);case _LinkCopied():
return linkCopied(_that.link);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sharing,TResult? Function( SharePayload payload)?  shared,TResult? Function( String link)?  linkCopied,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Sharing() when sharing != null:
return sharing();case _Shared() when shared != null:
return shared(_that.payload);case _LinkCopied() when linkCopied != null:
return linkCopied(_that.link);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AnnonceShareState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceShareState.initial()';
}


}




/// @nodoc


class _Sharing implements AnnonceShareState {
  const _Sharing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sharing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnnonceShareState.sharing()';
}


}




/// @nodoc


class _Shared implements AnnonceShareState {
  const _Shared(this.payload);
  

 final  SharePayload payload;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharedCopyWith<_Shared> get copyWith => __$SharedCopyWithImpl<_Shared>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shared&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,payload);

@override
String toString() {
  return 'AnnonceShareState.shared(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$SharedCopyWith<$Res> implements $AnnonceShareStateCopyWith<$Res> {
  factory _$SharedCopyWith(_Shared value, $Res Function(_Shared) _then) = __$SharedCopyWithImpl;
@useResult
$Res call({
 SharePayload payload
});


$SharePayloadCopyWith<$Res> get payload;

}
/// @nodoc
class __$SharedCopyWithImpl<$Res>
    implements _$SharedCopyWith<$Res> {
  __$SharedCopyWithImpl(this._self, this._then);

  final _Shared _self;
  final $Res Function(_Shared) _then;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Shared(
null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as SharePayload,
  ));
}

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SharePayloadCopyWith<$Res> get payload {
  
  return $SharePayloadCopyWith<$Res>(_self.payload, (value) {
    return _then(_self.copyWith(payload: value));
  });
}
}

/// @nodoc


class _LinkCopied implements AnnonceShareState {
  const _LinkCopied(this.link);
  

 final  String link;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkCopiedCopyWith<_LinkCopied> get copyWith => __$LinkCopiedCopyWithImpl<_LinkCopied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkCopied&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,link);

@override
String toString() {
  return 'AnnonceShareState.linkCopied(link: $link)';
}


}

/// @nodoc
abstract mixin class _$LinkCopiedCopyWith<$Res> implements $AnnonceShareStateCopyWith<$Res> {
  factory _$LinkCopiedCopyWith(_LinkCopied value, $Res Function(_LinkCopied) _then) = __$LinkCopiedCopyWithImpl;
@useResult
$Res call({
 String link
});




}
/// @nodoc
class __$LinkCopiedCopyWithImpl<$Res>
    implements _$LinkCopiedCopyWith<$Res> {
  __$LinkCopiedCopyWithImpl(this._self, this._then);

  final _LinkCopied _self;
  final $Res Function(_LinkCopied) _then;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? link = null,}) {
  return _then(_LinkCopied(
null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements AnnonceShareState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnnonceShareState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AnnonceShareStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AnnonceShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
