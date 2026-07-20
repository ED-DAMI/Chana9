// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annonce_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnonceMediaModel {

 String get id; String get url;@JsonKey(name: 'order') int get order;@JsonKey(name: 'isCover') bool get isCover;
/// Create a copy of AnnonceMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnonceMediaModelCopyWith<AnnonceMediaModel> get copyWith => _$AnnonceMediaModelCopyWithImpl<AnnonceMediaModel>(this as AnnonceMediaModel, _$identity);

  /// Serializes this AnnonceMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnonceMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.order, order) || other.order == order)&&(identical(other.isCover, isCover) || other.isCover == isCover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,order,isCover);

@override
String toString() {
  return 'AnnonceMediaModel(id: $id, url: $url, order: $order, isCover: $isCover)';
}


}

/// @nodoc
abstract mixin class $AnnonceMediaModelCopyWith<$Res>  {
  factory $AnnonceMediaModelCopyWith(AnnonceMediaModel value, $Res Function(AnnonceMediaModel) _then) = _$AnnonceMediaModelCopyWithImpl;
@useResult
$Res call({
 String id, String url,@JsonKey(name: 'order') int order,@JsonKey(name: 'isCover') bool isCover
});




}
/// @nodoc
class _$AnnonceMediaModelCopyWithImpl<$Res>
    implements $AnnonceMediaModelCopyWith<$Res> {
  _$AnnonceMediaModelCopyWithImpl(this._self, this._then);

  final AnnonceMediaModel _self;
  final $Res Function(AnnonceMediaModel) _then;

/// Create a copy of AnnonceMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? order = null,Object? isCover = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isCover: null == isCover ? _self.isCover : isCover // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnonceMediaModel].
extension AnnonceMediaModelPatterns on AnnonceMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnonceMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnonceMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnonceMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnonceMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnonceMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnonceMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url, @JsonKey(name: 'order')  int order, @JsonKey(name: 'isCover')  bool isCover)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnonceMediaModel() when $default != null:
return $default(_that.id,_that.url,_that.order,_that.isCover);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url, @JsonKey(name: 'order')  int order, @JsonKey(name: 'isCover')  bool isCover)  $default,) {final _that = this;
switch (_that) {
case _AnnonceMediaModel():
return $default(_that.id,_that.url,_that.order,_that.isCover);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url, @JsonKey(name: 'order')  int order, @JsonKey(name: 'isCover')  bool isCover)?  $default,) {final _that = this;
switch (_that) {
case _AnnonceMediaModel() when $default != null:
return $default(_that.id,_that.url,_that.order,_that.isCover);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnonceMediaModel extends AnnonceMediaModel {
  const _AnnonceMediaModel({required this.id, required this.url, @JsonKey(name: 'order') required this.order, @JsonKey(name: 'isCover') required this.isCover}): super._();
  factory _AnnonceMediaModel.fromJson(Map<String, dynamic> json) => _$AnnonceMediaModelFromJson(json);

@override final  String id;
@override final  String url;
@override@JsonKey(name: 'order') final  int order;
@override@JsonKey(name: 'isCover') final  bool isCover;

/// Create a copy of AnnonceMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnonceMediaModelCopyWith<_AnnonceMediaModel> get copyWith => __$AnnonceMediaModelCopyWithImpl<_AnnonceMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnonceMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnonceMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.order, order) || other.order == order)&&(identical(other.isCover, isCover) || other.isCover == isCover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,order,isCover);

@override
String toString() {
  return 'AnnonceMediaModel(id: $id, url: $url, order: $order, isCover: $isCover)';
}


}

/// @nodoc
abstract mixin class _$AnnonceMediaModelCopyWith<$Res> implements $AnnonceMediaModelCopyWith<$Res> {
  factory _$AnnonceMediaModelCopyWith(_AnnonceMediaModel value, $Res Function(_AnnonceMediaModel) _then) = __$AnnonceMediaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String url,@JsonKey(name: 'order') int order,@JsonKey(name: 'isCover') bool isCover
});




}
/// @nodoc
class __$AnnonceMediaModelCopyWithImpl<$Res>
    implements _$AnnonceMediaModelCopyWith<$Res> {
  __$AnnonceMediaModelCopyWithImpl(this._self, this._then);

  final _AnnonceMediaModel _self;
  final $Res Function(_AnnonceMediaModel) _then;

/// Create a copy of AnnonceMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? order = null,Object? isCover = null,}) {
  return _then(_AnnonceMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isCover: null == isCover ? _self.isCover : isCover // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
