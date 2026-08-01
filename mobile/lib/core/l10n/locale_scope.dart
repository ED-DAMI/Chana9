import 'package:flutter/material.dart';

class LocaleScope extends InheritedNotifier<ValueNotifier<Locale>> {
  const LocaleScope({
    super.key,
    required ValueNotifier<Locale> notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ValueNotifier<Locale> of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'No LocaleScope found in context');
    return scope!.notifier!;
  }
}
