import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'core/l10n/app_localizations.dart';
import 'core/l10n/locale_scope.dart';
import 'core/theme/app_theme.dart';
import 'features/annonces/presentation/bloc/annonce_bloc.dart';
import 'features/annonces/presentation/pages/annonce_detail_page.dart';
import 'features/annonces/presentation/pages/annonce_form_page.dart';
import 'features/annonces/presentation/pages/annonce_list_page.dart';
import 'features/annonces/presentation/pages/favorites_page.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/profile/presentation/pages/my_annonces_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Chana9App());
}

class Chana9App extends StatefulWidget {
  const Chana9App({super.key});

  @override
  State<Chana9App> createState() => _Chana9AppState();
}

class _Chana9AppState extends State<Chana9App> {
  final ValueNotifier<Locale> _localeNotifier = ValueNotifier(const Locale('fr'));

  @override
  void dispose() {
    _localeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      notifier: _localeNotifier,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => GetIt.instance<AuthBloc>()),
          BlocProvider<AnnonceBloc>(create: (_) => GetIt.instance<AnnonceBloc>()),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthenticated: () => _router.go('/login'),
            );
          },
          child: ValueListenableBuilder<Locale>(
            valueListenable: _localeNotifier,
            builder: (_, locale, __) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Chana9',
              theme: AppTheme.lightTheme,
              locale: locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: _router,
            ),
          ),
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
    final l10n = context.l10n;

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
            label: l10n.t('nav_annonces'),
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
            label: l10n.t('nav_publish'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: l10n.t('nav_profile'),
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