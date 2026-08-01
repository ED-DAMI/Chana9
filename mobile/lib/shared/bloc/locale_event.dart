import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

class CheckLocale extends LocaleEvent {
  const CheckLocale();
}

class ChangeLocale extends LocaleEvent {
  final Locale locale;

  const ChangeLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}
