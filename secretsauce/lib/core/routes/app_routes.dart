import 'package:go_router/go_router.dart';
import 'package:secretsauce/core/routes/routes_string.dart';
import 'package:secretsauce/features/auth/presentation/screens/homescreen.dart';
import 'package:secretsauce/features/auth/presentation/screens/login_screen.dart';
import 'package:secretsauce/features/auth/presentation/screens/otp_screen.dart';
import 'package:secretsauce/features/auth/presentation/screens/signup_screen.dart';
import 'package:secretsauce/features/auth/presentation/screens/tos.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutesString.signup,
  routes: [
    GoRoute(
      path : RoutesString.login,
      builder: (context , state) => LoginScreen(),
    ),
    GoRoute(
      path : RoutesString.tos,
      builder : (context , state) => TosPage(),
    ),
    GoRoute(
      path : RoutesString.otp,
      builder : (context , state) => OtpScreen()
    ),
    GoRoute(
      path : RoutesString.signup,
      builder : (context , state) => SignupScreen()
    ),
    GoRoute(
      path : RoutesString.home,
      builder : (context , state) => Homescreen()
    )
  ]
);