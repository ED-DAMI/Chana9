import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/core/constants/app_locale.dart';
import 'package:ma_chana9_app/shared/bloc/locale_bloc.dart';
import 'package:ma_chana9_app/shared/bloc/locale_event.dart';
import 'package:ma_chana9_app/shared/bloc/locale_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelector extends StatelessWidget {
  final bool showText;

  const LanguageSelector({super.key, this.showText = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final current = state.locale;
        final label = _languageLabel(l10n, current);
        return PopupMenuButton<Locale>(
          tooltip: l10n.language,
          onSelected: (locale) => context.read<LocaleBloc>().add(ChangeLocale(locale)),
          itemBuilder: (_) => [
            _item(l10n, AppLocale.fr, current, '🇫🇷'),
            _item(l10n, AppLocale.ar, current, '🇲🇦'),
            _item(l10n, AppLocale.en, current, '🌍'),
            _item(l10n, AppLocale.zgh, current, 'ⵣ'),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_languageFlag(current)),
                if (showText) ...[
                  const SizedBox(width: 6),
                  Text(label),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  PopupMenuItem<Locale> _item(AppLocalizations l10n, Locale locale, Locale current, String flag) {
    return PopupMenuItem<Locale>(
      value: locale,
      child: Row(
        children: [
          Text(flag),
          const SizedBox(width: 8),
          Expanded(child: Text(_languageLabel(l10n, locale))),
          if (current.languageCode == locale.languageCode) const Icon(Icons.check, size: 18),
        ],
      ),
    );
  }

  String _languageLabel(AppLocalizations l10n, Locale locale) {
    return switch (locale.languageCode) {
      'fr' => l10n.french,
      'ar' => l10n.arabic,
      'en' => l10n.english,
      'zgh' => l10n.tamazight,
      _ => l10n.french,
    };
  }

  String _languageFlag(Locale locale) {
    return switch (locale.languageCode) {
      'fr' => '🇫🇷',
      'ar' => '🇲🇦',
      'en' => '🌍',
      'zgh' => 'ⵣ',
      _ => '🇫🇷',
    };
  }
}
