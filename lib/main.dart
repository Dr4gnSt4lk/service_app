import 'package:flutter/material.dart';
import 'package:service_app/app_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/login/fill.dart';
import 'package:service_app/screens/login/login.dart';

import 'screens/login/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      //home: const RegisterPage(),
      //home: const LoginPage(),
      //home: const FillPage(),
      routerConfig: AppNavigation.router,
    );
  }
}
