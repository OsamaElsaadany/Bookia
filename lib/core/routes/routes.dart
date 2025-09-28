import 'package:bookia/features/auth/presentation/login/pages/login_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/Welcome';
  static const String login = '/LoginScreen';

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const Splash()),
      GoRoute(path: welcome, builder: (context, state) => const Welcome()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
    ],
  );
}
