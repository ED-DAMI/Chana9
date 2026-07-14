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

Widget _annoncesBuilder(BuildContext context, GoRouterState state) {
  return const AnnonceListPage();
}

Widget _annonceNewBuilder(BuildContext context, GoRouterState state) {
  return const AnnonceFormPage();
}

Widget _annonceDetailBuilder(BuildContext context, GoRouterState state) {
  return AnnonceDetailPage(
    annonceId: state.pathParameters['id']!,
  );
}

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
    GoRoute(
      path: '/annonces',
      builder: _annoncesBuilder,
      routes: [
        GoRoute(
          path: 'new',
          builder: _annonceNewBuilder,
        ),
        GoRoute(
          path: ':id',
          builder: _annonceDetailBuilder,
        ),
      ],
    ),
  ],
);