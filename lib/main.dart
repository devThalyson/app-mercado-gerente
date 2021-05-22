import 'package:app_mercado_admin/controller/buys_controllers/buys_controller.dart';
import 'package:app_mercado_admin/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado_admin/controller/menu_controllers/menu_controller.dart';
import 'package:app_mercado_admin/controller/products_controllers/products_controller.dart';
import 'package:app_mercado_admin/views/user_views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BuysController>(
          create: (context) => BuysController(),
        ),
        Provider<ProductsController>(
          create: (context) => ProductsController(),
        ),
        Provider<CategorysController>(
          create: (context) => CategorysController(),
        ),
        Provider<MenuController>(
          create: (context) => MenuController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Mercado - Admin',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: ('Google'),
        ),
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(
            context,
            widget!,
          ),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        home: SplashScreen(),
      ),
    );
  }
}
