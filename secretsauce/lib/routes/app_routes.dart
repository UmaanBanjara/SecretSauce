import 'package:go_router/go_router.dart';
import 'package:secretsauce/routes/routes_string.dart';
import 'package:secretsauce/screens/login_screen.dart';
import 'package:secretsauce/screens/otp_screen.dart';
import 'package:secretsauce/screens/signup_screen.dart';
import 'package:secretsauce/screens/tos.dart';

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
    )
  ]
);