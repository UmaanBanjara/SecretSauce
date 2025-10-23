import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretsauce/core/routes/app_routes.dart';
import 'package:secretsauce/core/theme/app_theme.dart';

void main(){
  runApp(ProviderScope(child: SecretSauce()));
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