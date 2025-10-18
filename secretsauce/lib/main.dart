import 'package:flutter/material.dart';
import 'package:secretsauce/routes/app_routes.dart';
import 'package:secretsauce/theme/app_theme.dart';

void main(){
  runApp(SecretSauce());
}
class SecretSauce extends StatelessWidget {
  const SecretSauce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Secret Sauce',
      theme: SecretSauceTheme.darkTheme,
    );
  }
}