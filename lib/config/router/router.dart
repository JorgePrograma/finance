import 'package:finance/config/constants/router_constants.dart';
import 'package:finance/presentation/screen/account/account_add_screen.dart';
import 'package:finance/presentation/screen/account/account_screen.dart';
import 'package:finance/presentation/screen/authentication/forgot/forgot_password_screen.dart';
import 'package:finance/presentation/screen/authentication/login/login_screen.dart';
import 'package:finance/presentation/screen/authentication/signup/signup_screen.dart';
import 'package:finance/presentation/screen/authentication/verification/verification_screen.dart';
import 'package:finance/presentation/screen/home/home_screen.dart';
import 'package:finance/presentation/screen/onboarding/onboarding_screen.dart';
import 'package:finance/presentation/screen/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = GoRouter(
  initialLocation: RouterConstants.users,
  routes: [
    GoRoute(
      path: RouterConstants.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterConstants.oboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RouterConstants.signup,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: RouterConstants.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterConstants.oboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RouterConstants.forgot,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: RouterConstants.verification,
      builder: (context, state) => const VerficationScreen(),
    ),
    GoRoute(
      path: RouterConstants.account,
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: RouterConstants.accountAdd,
      builder: (context, state) => const AccountAddScreen(),
    ),
    GoRoute(
      path: RouterConstants.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouterConstants.users,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
