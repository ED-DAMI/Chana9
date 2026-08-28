// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckStatus value)?  checkStatus,TResult Function( _Login value)?  login,TResult Function( _Register value)?  register,TResult Function( _ChangePassword value)?  changePassword,TResult Function( _Logout value)?  logout,TResult Function( _RequestPasswordReset value)?  requestPasswordReset,TResult Function( _VerifyResetOtp value)?  verifyResetOtp,TResult Function( _ResetPassword value)?  resetPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckStatus() when checkStatus != null:
return checkStatus(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _Logout() when logout != null:
return logout(_that);case _RequestPasswordReset() when requestPasswordReset != null:
return requestPasswordReset(_that);case _VerifyResetOtp() when verifyResetOtp != null:
return verifyResetOtp(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckStatus value)  checkStatus,required TResult Function( _Login value)  login,required TResult Function( _Register value)  register,required TResult Function( _ChangePassword value)  changePassword,required TResult Function( _Logout value)  logout,required TResult Function( _RequestPasswordReset value)  requestPasswordReset,required TResult Function( _VerifyResetOtp value)  verifyResetOtp,required TResult Function( _ResetPassword value)  resetPassword,}){
final _that = this;
switch (_that) {
case _CheckStatus():
return checkStatus(_that);case _Login():
return login(_that);case _Register():
return register(_that);case _ChangePassword():
return changePassword(_that);case _Logout():
return logout(_that);case _RequestPasswordReset():
return requestPasswordReset(_that);case _VerifyResetOtp():
return verifyResetOtp(_that);case _ResetPassword():
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckStatus value)?  checkStatus,TResult? Function( _Login value)?  login,TResult? Function( _Register value)?  register,TResult? Function( _ChangePassword value)?  changePassword,TResult? Function( _Logout value)?  logout,TResult? Function( _RequestPasswordReset value)?  requestPasswordReset,TResult? Function( _VerifyResetOtp value)?  verifyResetOtp,TResult? Function( _ResetPassword value)?  resetPassword,}){
final _that = this;
switch (_that) {
case _CheckStatus() when checkStatus != null:
return checkStatus(_that);case _Login() when login != null:
return login(_that);case _Register() when register != null:
return register(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _Logout() when logout != null:
return logout(_that);case _RequestPasswordReset() when requestPasswordReset != null:
return requestPasswordReset(_that);case _VerifyResetOtp() when verifyResetOtp != null:
return verifyResetOtp(_that);case _ResetPassword() when resetPassword != null:
return resetPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkStatus,TResult Function( String phone,  String password,  bool rememberMe)?  login,TResult Function( String phone,  String password,  String? fullName,  String? region)?  register,TResult Function( String currentPassword,  String newPassword)?  changePassword,TResult Function()?  logout,TResult Function( String phone)?  requestPasswordReset,TResult Function( String phone,  String otp)?  verifyResetOtp,TResult Function( String phone,  String otp,  String newPassword)?  resetPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckStatus() when checkStatus != null:
return checkStatus();case _Login() when login != null:
return login(_that.phone,_that.password,_that.rememberMe);case _Register() when register != null:
return register(_that.phone,_that.password,_that.fullName,_that.region);case _ChangePassword() when changePassword != null:
return changePassword(_that.currentPassword,_that.newPassword);case _Logout() when logout != null:
return logout();case _RequestPasswordReset() when requestPasswordReset != null:
return requestPasswordReset(_that.phone);case _VerifyResetOtp() when verifyResetOtp != null:
return verifyResetOtp(_that.phone,_that.otp);case _ResetPassword() when resetPassword != null:
return resetPassword(_that.phone,_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkStatus,required TResult Function( String phone,  String password,  bool rememberMe)  login,required TResult Function( String phone,  String password,  String? fullName,  String? region)  register,required TResult Function( String currentPassword,  String newPassword)  changePassword,required TResult Function()  logout,required TResult Function( String phone)  requestPasswordReset,required TResult Function( String phone,  String otp)  verifyResetOtp,required TResult Function( String phone,  String otp,  String newPassword)  resetPassword,}) {final _that = this;
switch (_that) {
case _CheckStatus():
return checkStatus();case _Login():
return login(_that.phone,_that.password,_that.rememberMe);case _Register():
return register(_that.phone,_that.password,_that.fullName,_that.region);case _ChangePassword():
return changePassword(_that.currentPassword,_that.newPassword);case _Logout():
return logout();case _RequestPasswordReset():
return requestPasswordReset(_that.phone);case _VerifyResetOtp():
return verifyResetOtp(_that.phone,_that.otp);case _ResetPassword():
return resetPassword(_that.phone,_that.otp,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkStatus,TResult? Function( String phone,  String password,  bool rememberMe)?  login,TResult? Function( String phone,  String password,  String? fullName,  String? region)?  register,TResult? Function( String currentPassword,  String newPassword)?  changePassword,TResult? Function()?  logout,TResult? Function( String phone)?  requestPasswordReset,TResult? Function( String phone,  String otp)?  verifyResetOtp,TResult? Function( String phone,  String otp,  String newPassword)?  resetPassword,}) {final _that = this;
switch (_that) {
case _CheckStatus() when checkStatus != null:
return checkStatus();case _Login() when login != null:
return login(_that.phone,_that.password,_that.rememberMe);case _Register() when register != null:
return register(_that.phone,_that.password,_that.fullName,_that.region);case _ChangePassword() when changePassword != null:
return changePassword(_that.currentPassword,_that.newPassword);case _Logout() when logout != null:
return logout();case _RequestPasswordReset() when requestPasswordReset != null:
return requestPasswordReset(_that.phone);case _VerifyResetOtp() when verifyResetOtp != null:
return verifyResetOtp(_that.phone,_that.otp);case _ResetPassword() when resetPassword != null:
return resetPassword(_that.phone,_that.otp,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc


class _CheckStatus implements AuthEvent {
  const _CheckStatus();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkStatus()';
}


}




/// @nodoc


class _Login implements AuthEvent {
  const _Login({required this.phone, required this.password, this.rememberMe = false});
  

 final  String phone;
 final  String password;
@JsonKey() final  bool rememberMe;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,phone,password,rememberMe);

@override
String toString() {
  return 'AuthEvent.login(phone: $phone, password: $password, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@useResult
$Res call({
 String phone, String password, bool rememberMe
});




}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,Object? rememberMe = null,}) {
  return _then(_Login(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Register implements AuthEvent {
  const _Register({required this.phone, required this.password, this.fullName, this.region});
  

 final  String phone;
 final  String password;
 final  String? fullName;
 final  String? region;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,phone,password,fullName,region);

@override
String toString() {
  return 'AuthEvent.register(phone: $phone, password: $password, fullName: $fullName, region: $region)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@useResult
$Res call({
 String phone, String password, String? fullName, String? region
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,Object? fullName = freezed,Object? region = freezed,}) {
  return _then(_Register(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangePassword implements AuthEvent {
  const _ChangePassword({required this.currentPassword, required this.newPassword});
  

 final  String currentPassword;
 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordCopyWith<_ChangePassword> get copyWith => __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePassword&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,currentPassword,newPassword);

@override
String toString() {
  return 'AuthEvent.changePassword(currentPassword: $currentPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(_ChangePassword value, $Res Function(_ChangePassword) _then) = __$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 String currentPassword, String newPassword
});




}
/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPassword = null,Object? newPassword = null,}) {
  return _then(_ChangePassword(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Logout implements AuthEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class _RequestPasswordReset implements AuthEvent {
  const _RequestPasswordReset({required this.phone});
  

 final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestPasswordResetCopyWith<_RequestPasswordReset> get copyWith => __$RequestPasswordResetCopyWithImpl<_RequestPasswordReset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestPasswordReset&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent.requestPasswordReset(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$RequestPasswordResetCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RequestPasswordResetCopyWith(_RequestPasswordReset value, $Res Function(_RequestPasswordReset) _then) = __$RequestPasswordResetCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$RequestPasswordResetCopyWithImpl<$Res>
    implements _$RequestPasswordResetCopyWith<$Res> {
  __$RequestPasswordResetCopyWithImpl(this._self, this._then);

  final _RequestPasswordReset _self;
  final $Res Function(_RequestPasswordReset) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_RequestPasswordReset(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VerifyResetOtp implements AuthEvent {
  const _VerifyResetOtp({required this.phone, required this.otp});
  

 final  String phone;
 final  String otp;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyResetOtpCopyWith<_VerifyResetOtp> get copyWith => __$VerifyResetOtpCopyWithImpl<_VerifyResetOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyResetOtp&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'AuthEvent.verifyResetOtp(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyResetOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$VerifyResetOtpCopyWith(_VerifyResetOtp value, $Res Function(_VerifyResetOtp) _then) = __$VerifyResetOtpCopyWithImpl;
@useResult
$Res call({
 String phone, String otp
});




}
/// @nodoc
class __$VerifyResetOtpCopyWithImpl<$Res>
    implements _$VerifyResetOtpCopyWith<$Res> {
  __$VerifyResetOtpCopyWithImpl(this._self, this._then);

  final _VerifyResetOtp _self;
  final $Res Function(_VerifyResetOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_VerifyResetOtp(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResetPassword implements AuthEvent {
  const _ResetPassword({required this.phone, required this.otp, required this.newPassword});
  

 final  String phone;
 final  String otp;
 final  String newPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordCopyWith<_ResetPassword> get copyWith => __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPassword&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,phone,otp,newPassword);

@override
String toString() {
  return 'AuthEvent.resetPassword(phone: $phone, otp: $otp, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(_ResetPassword value, $Res Function(_ResetPassword) _then) = __$ResetPasswordCopyWithImpl;
@useResult
$Res call({
 String phone, String otp, String newPassword
});




}
/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(this._self, this._then);

  final _ResetPassword _self;
  final $Res Function(_ResetPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? otp = null,Object? newPassword = null,}) {
  return _then(_ResetPassword(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Unauthenticated value)?  unauthenticated,TResult Function( _PasswordSuccess value)?  passwordSuccess,TResult Function( _Failure value)?  failure,TResult Function( _OtpSent value)?  otpSent,TResult Function( _OtpVerified value)?  otpVerified,TResult Function( _ResetSuccess value)?  resetSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _PasswordSuccess() when passwordSuccess != null:
return passwordSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _OtpSent() when otpSent != null:
return otpSent(_that);case _OtpVerified() when otpVerified != null:
return otpVerified(_that);case _ResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Unauthenticated value)  unauthenticated,required TResult Function( _PasswordSuccess value)  passwordSuccess,required TResult Function( _Failure value)  failure,required TResult Function( _OtpSent value)  otpSent,required TResult Function( _OtpVerified value)  otpVerified,required TResult Function( _ResetSuccess value)  resetSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Authenticated():
return authenticated(_that);case _Unauthenticated():
return unauthenticated(_that);case _PasswordSuccess():
return passwordSuccess(_that);case _Failure():
return failure(_that);case _OtpSent():
return otpSent(_that);case _OtpVerified():
return otpVerified(_that);case _ResetSuccess():
return resetSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Unauthenticated value)?  unauthenticated,TResult? Function( _PasswordSuccess value)?  passwordSuccess,TResult? Function( _Failure value)?  failure,TResult? Function( _OtpSent value)?  otpSent,TResult? Function( _OtpVerified value)?  otpVerified,TResult? Function( _ResetSuccess value)?  resetSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _PasswordSuccess() when passwordSuccess != null:
return passwordSuccess(_that);case _Failure() when failure != null:
return failure(_that);case _OtpSent() when otpSent != null:
return otpSent(_that);case _OtpVerified() when otpVerified != null:
return otpVerified(_that);case _ResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  authenticated,TResult Function()?  unauthenticated,TResult Function()?  passwordSuccess,TResult Function( String message)?  failure,TResult Function()?  otpSent,TResult Function()?  otpVerified,TResult Function()?  resetSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _PasswordSuccess() when passwordSuccess != null:
return passwordSuccess();case _Failure() when failure != null:
return failure(_that.message);case _OtpSent() when otpSent != null:
return otpSent();case _OtpVerified() when otpVerified != null:
return otpVerified();case _ResetSuccess() when resetSuccess != null:
return resetSuccess();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  authenticated,required TResult Function()  unauthenticated,required TResult Function()  passwordSuccess,required TResult Function( String message)  failure,required TResult Function()  otpSent,required TResult Function()  otpVerified,required TResult Function()  resetSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Authenticated():
return authenticated(_that.user);case _Unauthenticated():
return unauthenticated();case _PasswordSuccess():
return passwordSuccess();case _Failure():
return failure(_that.message);case _OtpSent():
return otpSent();case _OtpVerified():
return otpVerified();case _ResetSuccess():
return resetSuccess();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function()?  passwordSuccess,TResult? Function( String message)?  failure,TResult? Function()?  otpSent,TResult? Function()?  otpVerified,TResult? Function()?  resetSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Authenticated() when authenticated != null:
return authenticated(_that.user);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _PasswordSuccess() when passwordSuccess != null:
return passwordSuccess();case _Failure() when failure != null:
return failure(_that.message);case _OtpSent() when otpSent != null:
return otpSent();case _OtpVerified() when otpVerified != null:
return otpVerified();case _ResetSuccess() when resetSuccess != null:
return resetSuccess();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _Authenticated implements AuthState {
  const _Authenticated(this.user);
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedCopyWith<_Authenticated> get copyWith => __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(_Authenticated value, $Res Function(_Authenticated) _then) = __$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Authenticated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Unauthenticated implements AuthState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class _PasswordSuccess implements AuthState {
  const _PasswordSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.passwordSuccess()';
}


}




/// @nodoc


class _Failure implements AuthState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of AuthState
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
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
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

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OtpSent implements AuthState {
  const _OtpSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otpSent()';
}


}




/// @nodoc


class _OtpVerified implements AuthState {
  const _OtpVerified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otpVerified()';
}


}




/// @nodoc


class _ResetSuccess implements AuthState {
  const _ResetSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.resetSuccess()';
}


}




// dart format on
