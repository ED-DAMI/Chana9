import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Register register;
  final Logout logout;
  final GetCurrentUser getCurrentUser;
  final CheckAuthStatus checkAuthStatus;

  AuthBloc({
    required this.login,
    required this.register,
    required this.logout,
    required this.getCurrentUser,
    required this.checkAuthStatus,
  }) : super(const AuthState.initial()) {
    on<_CheckStatus>(_onCheckStatus);
    on<_Login>(_onLogin);
    on<_Register>(_onRegister);
    on<_Logout>(_onLogout);
  }

  Future<void> _onCheckStatus(
      _CheckStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final authResult = await checkAuthStatus(const NoParams());
    await authResult.fold(
          (f) async => emit(const AuthState.unauthenticated()),
          (isAuth) async {
        if (!isAuth) {
          emit(const AuthState.unauthenticated());
          return;
        }
        final userResult = await getCurrentUser(const NoParams());
        userResult.fold(
              (f) => emit(const AuthState.unauthenticated()),
              (user) => emit(AuthState.authenticated(user)),
        );
      },
    );
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await login(
      LoginParams(phone: event.phone, password: event.password),
    );
    result.fold(
          (f) => emit(AuthState.failure(f.message)),
          (authResult) => emit(AuthState.authenticated(authResult.user)),
    );
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await register(RegisterParams(
      phone: event.phone,
      password: event.password,
      fullName: event.fullName,
      region: event.region,
    ));
    result.fold(
          (f) => emit(AuthState.failure(f.message)),
          (authResult) => emit(AuthState.authenticated(authResult.user)),
    );
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await logout(const NoParams());
    result.fold(
          (f) => emit(AuthState.failure(f.message)),
          (_) => emit(const AuthState.unauthenticated()),
    );
  }
}