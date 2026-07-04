import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/otp_page.dart';
import 'features/annonces/presentation/pages/annonces_list_page.dart';

void main() {
  runApp(const Chana9App());
}

class Chana9App extends StatelessWidget {
  const Chana9App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const LoginPage()),
        GoRoute(path: '/otp', builder: (context, state) => const OtpPage()),
        GoRoute(path: '/annonces', builder: (context, state) => const AnnoncesListPage()),
      ],
    );

    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Chana9',
        theme: AppTheme.lightTheme,
        routerConfig: router,
      ),
    );
  }
}
