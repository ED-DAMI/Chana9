import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'features/annonces/presentation/bloc/annonce_bloc.dart';
import 'features/annonces/presentation/pages/annonce_detail_page.dart';
import 'features/annonces/presentation/pages/annonce_form_page.dart';
import 'features/annonces/presentation/pages/annonce_list_page.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/profile/presentation/pages/my_annonces_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Chana9App());
}

class Chana9App extends StatelessWidget {
  const Chana9App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => GetIt.instance<AuthBloc>(),
        ),
        BlocProvider<AnnonceBloc>(
          create: (_) => GetIt.instance<AnnonceBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Chana9',
        theme: AppTheme.lightTheme,
        routerConfig: _router,
      ),
    );
  }
}

// ── Builders ──────────────────────────────────────────────────────────────────

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
  return LoginPage(
    onLoginSuccess: () => context.go('/annonces'),
  );
}

// ── Shell avec bottom navigation ─────────────────────────────────────────────

class _ShellPage extends StatelessWidget {
  final Widget child;

  const _ShellPage({required this.child});

  int _locationToIndex(String location) {
    if (location.startsWith('/profile')) return 1;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

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
              context.go('/profile');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Annonces',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// ── Router ────────────────────────────────────────────────────────────────────

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: _splashBuilder,
    ),
    GoRoute(
      path: '/login',
      builder: _loginBuilder,
    ),
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
          ],
        ),
      ],
    ),
  ],
);