import 'package:bookstore_app/core/common/providers/auth_state_provider.dart';
import 'package:bookstore_app/core/router/router_names.dart';
import 'package:bookstore_app/view/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:bookstore_app/view/auth/login_screen/login_screen.dart';
import 'package:bookstore_app/view/auth/register_screen/register_screen.dart';
import 'package:bookstore_app/view/auth/welcome_screen.dart';
import 'package:bookstore_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  final user = ref.watch(authStateProvider).value;
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = user != null;
      final isGoingToAuth = state.matchedLocation == '/welcome' ||
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup' ||
          state.matchedLocation == '/forgot_password';

      // If the user is not logged in and trying to access a protected screen, redirect to welcome
      final isGoingToProtectedRoute = state.matchedLocation == '/home';
      if (!isLoggedIn && isGoingToProtectedRoute) {
        return state.namedLocation(RouterNames.welcome);
      }

      // If the user is logged in and trying to access an auth screen, redirect to home
      if (isLoggedIn && isGoingToAuth) {
        return state.namedLocation(RouterNames.home);
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        name: RouterNames.home,
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: RouterNames.welcome,
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: RouterNames.login,
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouterNames.signup,
        path: '/signup',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: RouterNames.forgotPassword,
        path: '/forgot_password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
