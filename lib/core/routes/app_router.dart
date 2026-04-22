import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vikncodes/app/bottom_navigation/views/pages/bottom_navigation_bar.dart';
import '../../app/auth/views/pages/login_page.dart';
import '../../app/auth/views/pages/splash_screen.dart';
import '../../app/invoice/views/pages/filter_page.dart';
import '../../app/invoice/views/pages/invoices_page.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: SplashScreen.routeName,
    routes: [
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppBottomNavigationBar.routeName,
        builder: (context, state) => const AppBottomNavigationBar(),
      ),
      GoRoute(
        path: InvoicesPage.routeName,
        builder: (context, state) => const InvoicesPage(),
      ),
      GoRoute(
        path: FilterPage.routeName,
        builder: (context, state) => const FilterPage(),
      ),
    ],
  );
}
