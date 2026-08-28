import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ma_chana9_app/core/constants/app_locale.dart';
import 'package:ma_chana9_app/shared/bloc/locale_bloc.dart';
import 'package:ma_chana9_app/shared/bloc/locale_state.dart';

import 'core/theme/app_theme.dart';
import 'features/annonces/presentation/bloc/annonce_bloc.dart';
import 'features/annonces/presentation/pages/annonce_detail_page.dart';
import 'features/annonces/presentation/pages/annonce_form_page.dart';
import 'features/annonces/presentation/pages/annonce_list_page.dart';
import 'features/annonces/presentation/pages/favorites_page.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/change_password_page.dart';
import 'features/auth/presentation/pages/forgot_password_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/profile/presentation/pages/my_annonces_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'injection_container.dart' as di;
import 'l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  MobileAds.instance.initialize();
  runApp(const Chana9App());
}

class Chana9App extends StatelessWidget {
  const Chana9App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => GetIt.instance<AuthBloc>()),
        BlocProvider<AnnonceBloc>(create: (_) => GetIt.instance<AnnonceBloc>()),
        BlocProvider<LocaleBloc>(create: (_) => GetIt.instance<LocaleBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () => _router.go('/login'),
          );
        },
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Chana9',
              theme: AppTheme.lightTheme,
              routerConfig: _router,
              locale: localeState.locale,
              supportedLocales: AppLocale.supported,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                final locale = Localizations.localeOf(context);
                final isRtl = locale.languageCode == AppLocale.ar.languageCode;
                return Directionality(
                  textDirection:
                  isRtl ? TextDirection.rtl : TextDirection.ltr,
                  child: child ?? const SizedBox.shrink(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _splashBuilder(BuildContext context, GoRouterState state) {
  return SplashPage(
    onReady: (isAuthenticated) {
      if (isAuthenticated) {
        context.go('/annonces');
      } else {
        context.go('/login');
      }
    },
  );
}

Widget _loginBuilder(BuildContext context, GoRouterState state) {
  return LoginPage(onLoginSuccess: () => context.go('/annonces'));
}

class _ShellPage extends StatelessWidget {
  final Widget child;

  const _ShellPage({required this.child});

  int _locationToIndex(String location) {
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/annonces');
              break;
            case 1:
              context.go('/annonces/new');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.annonces,
          ),
          NavigationDestination(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 22),
            ),
            label: l10n.publish,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(path: '/splash', builder: _splashBuilder),
    GoRoute(path: '/login', builder: _loginBuilder),
    ShellRoute(
      builder: (context, state, child) => _ShellPage(child: child),
      routes: [
        GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: '/annonces',
          builder: (context, state) => const AnnonceListPage(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (context, state) => const AnnonceFormPage(),
            ),
            GoRoute(
              path: ':id',
              builder: (context, state) => AnnonceDetailPage(
                annonceId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
          routes: [
            GoRoute(
              path: 'change-password',
              builder: (context, state) => const ChangePasswordPage(),
            ),
            GoRoute(
              path: 'my-annonces/:sellerId',
              builder: (context, state) => MyAnnoncesPage(
                sellerId: state.pathParameters['sellerId']!,
              ),
            ),
            GoRoute(
              path: 'favorites',
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);