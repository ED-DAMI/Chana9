import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ma_chana9_app/core/constants/app_locale.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const _key = 'app_locale';
  final FlutterSecureStorage storage;

  LocaleBloc({required this.storage}) : super(const LocaleState(AppLocale.fallback)) {
    on<CheckLocale>(_onCheckLocale);
    on<ChangeLocale>(_onChangeLocale);
    add(const CheckLocale());
  }

  Future<void> _onCheckLocale(CheckLocale event, Emitter<LocaleState> emit) async {
    final value = await storage.read(key: _key);
    final locale = AppLocale.supported.firstWhere(
      (locale) => locale.languageCode == value,
      orElse: () => AppLocale.fallback,
    );
    emit(LocaleState(locale));
  }

  Future<void> _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) async {
    final locale = AppLocale.supported.contains(event.locale) ? event.locale : AppLocale.fallback;
    await storage.write(key: _key, value: locale.languageCode);
    emit(LocaleState(locale));
  }
}
