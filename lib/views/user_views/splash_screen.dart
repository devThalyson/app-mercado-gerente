import 'package:app_mercado_admin/model/cliente.dart';
import 'package:app_mercado_admin/views/home_views/home_view.dart';
import 'package:app_mercado_admin/views/user_views/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        Cliente? cliente = await Cliente.get();
        return cliente != null ? HomeView() : LoginView();
      },
      splash: "assets/images/logo.png",
      animationDuration: Duration(seconds: 2),
      splashTransition: SplashTransition.sizeTransition,
      duration: 2000,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
