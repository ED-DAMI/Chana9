import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(localizations != null, 'No AppLocalizations found in context');
    return localizations!;
  }

  static const supportedLocales = [
    Locale('fr'),
    Locale('en'),
    Locale('ar'),
  ];

  static const _values = <String, Map<String, String>>{
    'fr': {
      'nav_annonces': 'Annonces',
      'nav_publish': 'Publier',
      'nav_profile': 'Profil',
      'login_subtitle': 'Connectez-vous à votre compte',
      'login_button': 'Se connecter',
      'phone_label': 'Téléphone',
      'phone_required': 'Le numéro de téléphone est requis',
      'phone_invalid': 'Numéro de téléphone invalide',
      'password_label': 'Mot de passe',
      'password_required': 'Le mot de passe est requis',
      'password_min': 'Minimum 6 caractères',
      'profile_title': 'Mon Profil',
      'user_fallback': 'Utilisateur',
      'verified': 'Vérifié ✓',
      'not_verified': 'Non vérifié',
      'my_ads': 'Mes annonces',
      'my_favorites': 'Mes favoris',
      'my_alerts': 'Mes alertes',
      'logout': 'Déconnexion',
      'logout_question': 'Êtes-vous sûr de vouloir vous déconnecter ?',
      'cancel': 'Annuler',
      'language': 'Langue',
      'language_french': 'Français',
      'language_english': 'Anglais',
      'language_arabic': 'Arabe',
      'filters': 'Filtres',
      'search': 'Rechercher',
      'no_ads_found': 'Aucune annonce trouvée',
      'retry': 'Réessayer',
    },
    'en': {
      'nav_annonces': 'Listings',
      'nav_publish': 'Post',
      'nav_profile': 'Profile',
      'login_subtitle': 'Sign in to your account',
      'login_button': 'Sign in',
      'phone_label': 'Phone',
      'phone_required': 'Phone number is required',
      'phone_invalid': 'Invalid phone number',
      'password_label': 'Password',
      'password_required': 'Password is required',
      'password_min': 'Minimum 6 characters',
      'profile_title': 'My Profile',
      'user_fallback': 'User',
      'verified': 'Verified ✓',
      'not_verified': 'Not verified',
      'my_ads': 'My listings',
      'my_favorites': 'My favorites',
      'my_alerts': 'My alerts',
      'logout': 'Log out',
      'logout_question': 'Are you sure you want to log out?',
      'cancel': 'Cancel',
      'language': 'Language',
      'language_french': 'French',
      'language_english': 'English',
      'language_arabic': 'Arabic',
      'filters': 'Filters',
      'search': 'Search',
      'no_ads_found': 'No listings found',
      'retry': 'Retry',
    },
    'ar': {
      'nav_annonces': 'الإعلانات',
      'nav_publish': 'نشر',
      'nav_profile': 'الملف الشخصي',
      'login_subtitle': 'سجّل الدخول إلى حسابك',
      'login_button': 'تسجيل الدخول',
      'phone_label': 'الهاتف',
      'phone_required': 'رقم الهاتف مطلوب',
      'phone_invalid': 'رقم الهاتف غير صالح',
      'password_label': 'كلمة المرور',
      'password_required': 'كلمة المرور مطلوبة',
      'password_min': '6 أحرف على الأقل',
      'profile_title': 'ملفي الشخصي',
      'user_fallback': 'مستخدم',
      'verified': 'موثّق ✓',
      'not_verified': 'غير موثّق',
      'my_ads': 'إعلاناتي',
      'my_favorites': 'مفضلتي',
      'my_alerts': 'تنبيهاتي',
      'logout': 'تسجيل الخروج',
      'logout_question': 'هل أنت متأكد من تسجيل الخروج؟',
      'cancel': 'إلغاء',
      'language': 'اللغة',
      'language_french': 'الفرنسية',
      'language_english': 'الإنجليزية',
      'language_arabic': 'العربية',
      'filters': 'الفلاتر',
      'search': 'بحث',
      'no_ads_found': 'لم يتم العثور على إعلانات',
      'retry': 'إعادة المحاولة',
    },
  };

  String t(String key) {
    final lang = _values[locale.languageCode] ?? _values['fr']!;
    return lang[key] ?? _values['fr']![key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales.any((l) => l.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
