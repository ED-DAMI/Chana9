// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_report_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceReportRequestModel {

 String get reason; String? get comment;
/// Create a copy of AnnonceReportRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceReportRequestModelCopyWith<AnnonceReportRequestModel> get copyWith => _$AnnonceReportRequestModelCopyWithImpl<AnnonceReportRequestModel>(this as AnnonceReportRequestModel, _$identity);

  /// Serializes this AnnonceReportRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceReportRequestModel&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,comment);

@override
String toString() {
  return 'AnnonceReportRequestModel(reason: $reason, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $AnnonceReportRequestModelCopyWith<$Res>  {
  factory $AnnonceReportRequestModelCopyWith(AnnonceReportRequestModel value, $Res Function(AnnonceReportRequestModel) _then) = _$AnnonceReportRequestModelCopyWithImpl;
@useResult
$Res call({
 String reason, String? comment
});




}
/// @nodoc
class _$AnnonceReportRequestModelCopyWithImpl<$Res>
    implements $AnnonceReportRequestModelCopyWith<$Res> {
  _$AnnonceReportRequestModelCopyWithImpl(this._self, this._then);

  final AnnonceReportRequestModel _self;
  final $Res Function(AnnonceReportRequestModel) _then;

/// Create a copy of AnnonceReportRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceReportRequestModel].
extension AnnonceReportRequestModelPatterns on AnnonceReportRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceReportRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceReportRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceReportRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceReportRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceReportRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceReportRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceReportRequestModel() when $default != null:
return $default(_that.reason,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _AnnonceReportRequestModel():
return $default(_that.reason,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceReportRequestModel() when $default != null:
return $default(_that.reason,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceReportRequestModel implements AnnonceReportRequestModel {
  const _AnnonceReportRequestModel({required this.reason, this.comment});
  factory _AnnonceReportRequestModel.fromJson(Map<String, dynamic> json) => _$AnnonceReportRequestModelFromJson(json);

@override final  String reason;
@override final  String? comment;

/// Create a copy of AnnonceReportRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceReportRequestModelCopyWith<_AnnonceReportRequestModel> get copyWith => __$AnnonceReportRequestModelCopyWithImpl<_AnnonceReportRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceReportRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceReportRequestModel&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,comment);

@override
String toString() {
  return 'AnnonceReportRequestModel(reason: $reason, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$AnnonceReportRequestModelCopyWith<$Res> implements $AnnonceReportRequestModelCopyWith<$Res> {
  factory _$AnnonceReportRequestModelCopyWith(_AnnonceReportRequestModel value, $Res Function(_AnnonceReportRequestModel) _then) = __$AnnonceReportRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String reason, String? comment
});




}
/// @nodoc
class __$AnnonceReportRequestModelCopyWithImpl<$Res>
    implements _$AnnonceReportRequestModelCopyWith<$Res> {
  __$AnnonceReportRequestModelCopyWithImpl(this._self, this._then);

  final _AnnonceReportRequestModel _self;
  final $Res Function(_AnnonceReportRequestModel) _then;

/// Create a copy of AnnonceReportRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? comment = freezed,}) {
  return _then(_AnnonceReportRequestModel(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
