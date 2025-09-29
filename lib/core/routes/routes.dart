import 'package:bookia/features/auth/presentation/forget_password/pages/createNewpassword.dart';
import 'package:bookia/features/auth/presentation/forget_password/pages/forgetPassword.dart';
import 'package:bookia/features/auth/presentation/forget_password/pages/otpVerfication.dart';
import 'package:bookia/features/auth/presentation/forget_password/pages/passwordChanged.dart';
import 'package:bookia/features/auth/presentation/login/pages/login_screen.dart';
import 'package:bookia/features/auth/presentation/register/pages/Signup_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/Welcome';
  static const String login = '/LoginScreen';
  static const String signup = '/SignupScreen';
  static const String passwordChanged = '/Passwordchanged';
  static const String forgetpassword = '/Forgetpassword';
  static const String otpverfication = '/Otpverfication';
  static const String createnewpassword = '/Createnewpassword';

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const Splash()),
      GoRoute(path: welcome, builder: (context, state) => const Welcome()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: signup, builder: (context, state) => const SignupScreen()),
      GoRoute(path: forgetpassword, builder: (context, state) => const Forgetpassword()),
      GoRoute(path: passwordChanged, builder: (context, state) => const Passwordchanged()),
      GoRoute(path: otpverfication, builder: (context, state) => const Otpverfication()),
      GoRoute(path: createnewpassword, builder: (context, state) => const Createnewpassword()),
    ],
  );
}
